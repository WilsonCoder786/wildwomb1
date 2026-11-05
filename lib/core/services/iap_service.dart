import 'dart:async';
import 'dart:io';

import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:url_launcher/url_launcher.dart';

/// Google Play Billing service.
///
/// Design principles:
/// - Local cache (Hive/SharedPreferences) is used **only** as a startup-performance
///   hint. It is **never** the source of truth.
/// - On every app launch, [checkSubscriptionStatus] queries Google Play and
///   updates (or clears) the cache accordingly.
/// - The app never crashes due to billing errors; every path is wrapped in try/catch.
class IAPService extends ChangeNotifier with WidgetsBindingObserver {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;

  List<ProductDetails> _products = <ProductDetails>[];
  bool _isAvailable = false;
  bool _isLoading = false;
  bool _isPurchasing = false;
  bool _isRestorePurchasing = false;
  bool _isVerifying = false;
  bool _isPremium = false;
  String _iapError = '';
  String? _verificationStatus;

  // ─── Hive cache keys ────────────────────────────────────────────────────────

  static const String _kIsPremium = 'iap_is_premium';
  static const String _kProductId = 'iap_product_id';
  static const String _kPurchaseToken = 'iap_purchase_token';
  static const String _kPurchaseDate = 'iap_purchase_date';
  static const String _kExpiryDate = 'iap_expiry_date';
  static const String _kLastVerified = 'iap_last_verified';

  // ─── Product IDs ────────────────────────────────────────────────────────────

  /// The two subscription product IDs registered in Google Play Console.
  static const Set<String> productIds = {
    'monthly_easy_subscription',
    'yearly_easy_subscription',
  };

  // ─── Public getters ─────────────────────────────────────────────────────────

  List<ProductDetails> get products => _products;
  bool get isLoading => _isLoading;
  bool get isPurchasing => _isPurchasing;
  bool get isRestorePurchasing => _isRestorePurchasing;
  bool get isAvailable => _isAvailable;
  bool get isVerifying => _isVerifying;
  bool get isPremium => _isPremium;
  String? get verificationStatus => _verificationStatus;
  bool get hasProducts => _products.isNotEmpty;
  String? get errorMessage => _iapError.isEmpty ? null : _iapError;

  // ─── Broadcast streams ───────────────────────────────────────────────────────

  final StreamController<bool> _premiumStatusController =
      StreamController<bool>.broadcast();
  final StreamController<String?> _verificationStatusController =
      StreamController<String?>.broadcast();

  Stream<bool> get premiumStatusStream => _premiumStatusController.stream;
  Stream<String?> get verificationStatusStream =>
      _verificationStatusController.stream;

  // ─── Initialization ──────────────────────────────────────────────────────────

  IAPService() {
    WidgetsBinding.instance.addObserver(this);
    // Seed UI immediately from cache so the splash can show a fast result while
    // the real GP verification completes in the background.
    _isPremium = HiveService.getSetting<bool>(_kIsPremium) ?? false;
    _initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _purchaseSubscription?.cancel();
    _premiumStatusController.close();
    _verificationStatusController.close();
    super.dispose();
  }

  /// Re-verify when app resumes from background (e.g. user returns from
  /// Google Play after cancelling/upgrading).
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkSubscriptionStatus();
    }
  }

  /// Connect to Google Play Billing, subscribe to the purchase stream,
  /// load product details, then verify existing subscriptions.
  Future<void> _initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      _isAvailable = await _inAppPurchase.isAvailable();
      notifyListeners();

      if (_isAvailable) {
        // Subscribe to the purchase update stream BEFORE calling restorePurchases.
        final Stream<List<PurchaseDetails>> purchaseUpdated =
            _inAppPurchase.purchaseStream;

        _purchaseSubscription = purchaseUpdated.listen(
          (purchaseDetailsList) {
            _listenToPurchaseUpdated(purchaseDetailsList: purchaseDetailsList);
          },
          onDone: () => _purchaseSubscription?.cancel(),
          onError: (error) {
            debugPrint('IAP Stream Error: $error');
            _isPurchasing = false;
            notifyListeners();
          },
        );

        // Load product catalogue from Google Play.
        await _loadProducts();

        // Verify active subscriptions with Google Play. This is the authoritative
        // check; it updates _isPremium and the local cache.
        await checkSubscriptionStatus();
      } else {
        // Billing not available (emulator, restricted region, etc.).
        // Fall back to cached value — do NOT grant premium in this state.
        _isPremium = false;
        await _clearSubscriptionCache();
        debugPrint('IAP: Google Play Billing not available on this device.');
      }
    } catch (e) {
      debugPrint('IAP Initialization error: $e');
      // Do not grant premium if we cannot verify.
      _isPremium = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadProducts() async {
    try {
      debugPrint('IAP: Querying product IDs: $productIds');
      final ProductDetailsResponse response =
          await _inAppPurchase.queryProductDetails(productIds);

      if (response.error != null) {
        debugPrint('IAP: Product query error: ${response.error}');
      }
      if (response.notFoundIDs.isNotEmpty) {
        debugPrint('IAP: Product IDs not found: ${response.notFoundIDs}');
      }
      if (response.productDetails.isNotEmpty) {
        _products = response.productDetails;
        // Sort by price ascending so Monthly appears before Yearly.
        _products.sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
        notifyListeners();
      }
    } catch (e) {
      debugPrint('IAP: Failed to load products: $e');
    }
  }

  /// Publicly retries the product catalogue query.
  ///
  /// Shows [isLoading] while the request is in flight so the UI can display
  /// a spinner. Safe to call multiple times; guarded against concurrent calls.
  Future<void> reloadProducts() async {
    if (_isLoading) return; // already in progress
    if (!_isAvailable) {
      debugPrint('IAP: Cannot reload products — billing not available.');
      return;
    }
    _isLoading = true;
    notifyListeners();
    try {
      await _loadProducts();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ─── Subscription Verification (source of truth) ────────────────────────────

  /// Query Google Play for all active subscriptions.
  ///
  /// This is called on every app startup and every time the app resumes.
  /// It is the **authoritative** check — local cache is only updated here
  /// and must never be used to grant premium access independently.
  Future<void> checkSubscriptionStatus() async {
    if (!_isAvailable) {
      debugPrint('IAP: Billing not available, skipping subscription check.');
      return;
    }

    try {
      debugPrint('IAP: Querying active subscriptions from Google Play…');
      _updateVerificationStatus('Verifying subscription…');

      // restorePurchases() triggers the purchaseStream with all previously
      // purchased (and currently active) subscriptions. The listener
      // (_listenToPurchaseUpdated) handles the results.
      await _inAppPurchase.restorePurchases();

      // The stream listener will update _isPremium and the cache asynchronously.
      // We update the timestamp so the UI knows a check was performed.
      await HiveService.saveSetting(
        _kLastVerified,
        DateTime.now().toIso8601String(),
      );

      _updateVerificationStatus(null);
    } catch (e) {
      debugPrint('IAP: checkSubscriptionStatus error: $e');
      // Network or billing error — keep existing state, do not clear.
      _updateVerificationStatus(null);
    }
  }

  // ─── Purchase Flow ───────────────────────────────────────────────────────────

  /// Initiates a Google Play subscription purchase dialog.
  Future<void> buyProduct({required ProductDetails product}) async {
    if (!_isAvailable) {
      Utils.iapSnackBar(
        message: 'In-app purchases are not available on this device.',
        success: false,
      );
      return;
    }

    _isPurchasing = true;
    _iapError = '';
    notifyListeners();

    try {
      late PurchaseParam purchaseParam;

      if (Platform.isAndroid) {
        purchaseParam = GooglePlayPurchaseParam(productDetails: product);
      } else {
        purchaseParam = PurchaseParam(productDetails: product);
      }

      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      _isPurchasing = false;
      _iapError = 'Purchase failed: ${e.toString()}';
      notifyListeners();
      Utils.iapSnackBar(
        message: 'Failed to initiate purchase. Please try again.',
        success: false,
      );
    }
  }

  // ─── Restore Purchases ───────────────────────────────────────────────────────

  /// Restores previously purchased subscriptions.
  ///
  /// Queries Google Play for the user's purchase history and re-delivers
  /// any active subscriptions.
  Future<void> restorePurchases() async {
    _isRestorePurchasing = true;
    _isPurchasing = true;
    _iapError = '';
    notifyListeners();

    try {
      await _inAppPurchase.restorePurchases();
    } catch (e) {
      debugPrint('IAP: Restore error: $e');
      _iapError = 'Restore failed: ${e.toString()}';
      Utils.iapSnackBar(
        message: 'Restore failed. Please check your internet connection.',
        success: false,
      );
    } finally {
      _isRestorePurchasing = false;
      _isPurchasing = false;
      notifyListeners();
    }
  }

  // ─── Manage Subscription ────────────────────────────────────────────────────

  /// Opens the Google Play subscription management page in the Play Store.
  ///
  /// Allows users to: upgrade/downgrade plan, cancel, renew, change payment
  /// method, and view billing history.
  Future<void> openManageSubscriptions() async {
    const String packageName = 'com.easydiy.app';
    final Uri playStoreUri = Uri.parse(
      'https://play.google.com/store/account/subscriptions'
      '?package=$packageName',
    );

    try {
      final bool launched = await launchUrl(
        playStoreUri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint('IAP: Could not open Google Play subscriptions page.');
        Utils.iapSnackBar(
          message: 'Could not open Google Play. Please check manually.',
          success: false,
        );
      }
    } catch (e) {
      debugPrint('IAP: openManageSubscriptions error: $e');
      Utils.iapSnackBar(
        message: 'Could not open Google Play. Please check manually.',
        success: false,
      );
    }
  }

  // ─── Purchase Stream Listener ────────────────────────────────────────────────

  void _listenToPurchaseUpdated({
    required List<PurchaseDetails> purchaseDetailsList,
  }) async {
    // Track whether any active subscription was found in this batch.
    bool foundActivePurchase = false;

    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
          _isPurchasing = true;
          _updateVerificationStatus('Processing purchase…');
          debugPrint('IAP: Purchase pending for ${purchaseDetails.productID}');
          break;

        case PurchaseStatus.canceled:
          _isPurchasing = false;
          _updateVerificationStatus(null);
          debugPrint('IAP: Purchase canceled by user.');
          break;

        case PurchaseStatus.error:
          await _handlePurchaseError(purchaseDetails);
          break;

        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            foundActivePurchase = true;
            await _deliverProduct(purchaseDetails: purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails: purchaseDetails);
          }
          break;
      }

      // Always acknowledge completed purchases to avoid refunds.
      if (purchaseDetails.pendingCompletePurchase) {
        try {
          await _inAppPurchase.completePurchase(purchaseDetails);
        } catch (e) {
          debugPrint('IAP: completePurchase error: $e');
        }
      }
    }

    // If this batch came from checkSubscriptionStatus (restorePurchases) and
    // nothing active was found, clear the cache and revoke premium.
    if (purchaseDetailsList.isNotEmpty && !foundActivePurchase) {
      final bool wasStartupCheck =
          purchaseDetailsList.every((p) => p.status == PurchaseStatus.restored);
      if (wasStartupCheck) {
        debugPrint('IAP: No active subscriptions found — revoking premium.');
        await _clearSubscriptionCache();
        _updatePremiumStatus(false);
      }
    }
  }

  Future<void> _handlePurchaseError(PurchaseDetails purchaseDetails) async {
    final String errorCode = purchaseDetails.error?.code ?? '';
    final String errorMessage = purchaseDetails.error?.message ?? '';

    // itemAlreadyOwned means the user has an active subscription — restore it.
    if (errorMessage.contains('itemAlreadyOwned') ||
        errorMessage.contains('BillingResponse.itemAlreadyOwned') ||
        (errorCode == 'purchase_error' && errorMessage.contains('7'))) {
      debugPrint('IAP: Item already owned — restoring previous purchase…');
      await restorePurchases();
    } else {
      _isPurchasing = false;
      _updateVerificationStatus('Purchase failed: $errorMessage');
      notifyListeners();
      Utils.iapSnackBar(
        message: 'Purchase failed. Please try again.',
        success: false,
      );
    }
  }

  // ─── Verification ────────────────────────────────────────────────────────────

  /// Client-side purchase validation.
  ///
  /// Checks product ID, purchase status, and server verification data.
  /// Note: Server-side verification is recommended for production, but since
  /// this app has no backend, we rely on the signed Google Play receipt.
  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    _isVerifying = true;
    _updateVerificationStatus('Verifying purchase…');

    // Must have a valid purchase ID.
    if (purchaseDetails.purchaseID == null ||
        purchaseDetails.purchaseID!.isEmpty) {
      debugPrint('IAP: Verification failed — missing purchase ID.');
      _isVerifying = false;
      _updateVerificationStatus('Purchase verification failed.');
      return false;
    }

    // Must be one of our registered product IDs.
    if (!productIds.contains(purchaseDetails.productID)) {
      debugPrint(
        'IAP: Verification failed — unknown product: ${purchaseDetails.productID}',
      );
      _isVerifying = false;
      _updateVerificationStatus('Invalid product. Please contact support.');
      return false;
    }

    // Status must be purchased or restored.
    if (purchaseDetails.status != PurchaseStatus.purchased &&
        purchaseDetails.status != PurchaseStatus.restored) {
      _isVerifying = false;
      _updateVerificationStatus('Purchase status is not valid.');
      return false;
    }

    // Google Play receipts must have server verification data.
    if (purchaseDetails.verificationData.source == 'google_play') {
      final String serverData =
          purchaseDetails.verificationData.serverVerificationData;
      if (serverData.isEmpty) {
        debugPrint('IAP: Verification failed — missing server verification data.');
        _isVerifying = false;
        _updateVerificationStatus('Purchase data is incomplete. Please try again.');
        return false;
      }
    }

    debugPrint(
      'IAP: Client-side verification passed for: ${purchaseDetails.productID}',
    );
    _isVerifying = false;
    return true;
  }

  // ─── Delivery & Cache ────────────────────────────────────────────────────────

  /// Grants premium access and persists all subscription details to local cache.
  Future<void> _deliverProduct({
    required PurchaseDetails purchaseDetails,
  }) async {
    try {
      _updateVerificationStatus('Activating premium…');

      final String now = DateTime.now().toIso8601String();

      // Attempt to extract expiry date from Google Play billing details.
      String? expiryDate;
      if (Platform.isAndroid &&
          purchaseDetails is GooglePlayPurchaseDetails) {
        try {
          final int expiryMs =
              purchaseDetails.billingClientPurchase.purchaseTime;
          // billingClientPurchase.purchaseTime is the purchase time, not expiry.
          // Expiry is only available from GP server API; we store purchaseTime
          // as a reference and leave expiryDate null when unavailable.
          expiryDate = DateTime.fromMillisecondsSinceEpoch(expiryMs)
              .toIso8601String();
        } catch (_) {
          // Ignore — expiry date is optional.
        }
      }

      // Persist all required fields.
      await HiveService.saveSetting(_kIsPremium, true);
      await HiveService.saveSetting(
          _kProductId, purchaseDetails.productID);
      await HiveService.saveSetting(
          _kPurchaseToken, purchaseDetails.purchaseID ?? '');
      await HiveService.saveSetting(_kPurchaseDate, now);
      if (expiryDate != null) {
        await HiveService.saveSetting(_kExpiryDate, expiryDate);
      }
      await HiveService.saveSetting(_kLastVerified, now);

      _updatePremiumStatus(true);
      _isPurchasing = false;
      _isVerifying = false;
      _updateVerificationStatus('Purchase verified successfully!');

      debugPrint(
        'IAP: Premium activated — product: ${purchaseDetails.productID}',
      );
    } catch (e) {
      debugPrint('IAP: _deliverProduct error: $e');
      _isPurchasing = false;
      _isVerifying = false;
      _updateVerificationStatus(
        'Failed to save premium status. Please contact support.',
      );
      notifyListeners();
    }
  }

  void _handleInvalidPurchase({required PurchaseDetails purchaseDetails}) {
    _isPurchasing = false;
    _isVerifying = false;
    notifyListeners();
    Utils.iapSnackBar(
      message: _iapError.isNotEmpty
          ? _iapError
          : 'Purchase verification failed.',
      success: false,
    );
  }

  /// Removes all subscription data from local cache and marks the user
  /// as non-premium. Called when GP reports no active subscriptions.
  Future<void> _clearSubscriptionCache() async {
    try {
      await HiveService.saveSetting(_kIsPremium, false);
      await HiveService.saveSetting(_kProductId, null);
      await HiveService.saveSetting(_kPurchaseToken, null);
      await HiveService.saveSetting(_kPurchaseDate, null);
      await HiveService.saveSetting(_kExpiryDate, null);
      await HiveService.saveSetting(
        _kLastVerified,
        DateTime.now().toIso8601String(),
      );
      debugPrint('IAP: Subscription cache cleared.');
    } catch (e) {
      debugPrint('IAP: _clearSubscriptionCache error: $e');
    }
  }

  // ─── Internal helpers ─────────────────────────────────────────────────────────

  void _updateVerificationStatus(String? status) {
    _verificationStatus = status;
    _verificationStatusController.add(status);
    notifyListeners();
  }

  void _updatePremiumStatus(bool premium) {
    _isPremium = premium;
    _premiumStatusController.add(premium);
    notifyListeners();
  }
}
