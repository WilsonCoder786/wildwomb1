import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

class SubscriptionProvider extends ChangeNotifier {
  final IAPService _iapService;
  bool isYearlyBilling = false;

  String _planName = '';

  List<ProductDetails> get productsList => _iapService.products;
  bool get isLoading => _iapService.isLoading;
  bool get isPurchasing => _iapService.isPurchasing;
  bool get isRestoring => _iapService.isRestorePurchasing;
  bool get isAvailable => _iapService.isAvailable;
  bool get hasProducts => _iapService.hasProducts;
  String? get errorMessage => _iapService.errorMessage;
  String get planName => _planName;

  // Logic to select which product is selected in UI
  ProductDetails? _selectedProduct;

  SubscriptionProvider(this._iapService) {
    _iapService.addListener(_syncFromIap);
    _syncFromIap();
  }

  void _syncFromIap() {
    if (_iapService.products.isNotEmpty && _selectedProduct == null) {
      _selectedProduct = _iapService.products.first;
      _planName = _selectedProduct!.id;
    }
    notifyListeners();
  }

  /// Retries the Google Play product catalogue query.
  Future<void> reloadProducts() => _iapService.reloadProducts();

  void selectProduct(ProductDetails product) {
    _selectedProduct = product;
    _planName = product.id;
    notifyListeners();
  }

  // ─── Restore Purchases ────────────────────────────────────────────────────

  Future<void> restore({required BuildContext context}) async {
    //! Guard: Check connectivity
    final appService = context.read<AppService>();
    if (!appService.connected) {
      Utils.showSnackBar(
        context: context,
        message: 'No Internet Connection',
        success: false,
      );
      return;
    }

    // Guard: Check IAP availability
    if (!isAvailable) {
      Utils.showSnackBar(
        context: context,
        message: 'IAP Not Available',
        success: false,
      );
      return;
    }

    // Guard: Prevent duplicate operations
    if (isPurchasing) {
      return;
    }

    await _iapService.restorePurchases();
  }

  // ─── Purchase ────────────────────────────────────────────────────────────────

  Future<void> buySelectedProduct({required BuildContext context}) async {
    //! Guard: Check connectivity
    final appService = context.read<AppService>();
    if (!appService.connected) {
      Utils.showSnackBar(
        context: context,
        message: 'No Internet Connection',
        success: false,
      );
      return;
    }

    // Guard: Check IAP availability
    if (!isAvailable) {
      Utils.showSnackBar(
        context: context,
        message: 'IAP Not Available',
        success: false,
      );
      return;
    }

    // Guard: Check if products are loaded
    if (!hasProducts) {
      Utils.showSnackBar(
        context: context,
        message: 'Products Loading',
        success: false,
      );
      return;
    }

    // Guard: Check if product is selected
    if (_selectedProduct == null) {
      Utils.showSnackBar(
        context: context,
        message: "Select Subscription Plan",
        success: false,
      );
      return;
    }

    // Guard: Prevent duplicate purchases
    if (isPurchasing) {
      return;
    }

    await _iapService.buyProduct(product: _selectedProduct!);
  }

  // ─── Manage Subscription ─────────────────────────────────────────────────────

  /// Opens the Google Play subscription management page.
  ///
  /// Allows users to upgrade, downgrade, cancel, renew, change payment method,
  /// or view billing history.
  Future<void> manageSubscription() async {
    await _iapService.openManageSubscriptions();
  }

  // ─── Premium & Verification state (exposed from IAPService) ──────────────────

  /// Whether the user has an active premium subscription (verified by Google Play).
  bool get isPremium => _iapService.isPremium;

  /// Whether a purchase is currently being verified.
  bool get isVerifying => _iapService.isVerifying;

  /// Latest verification or purchase status message for display in UI.
  String? get verificationStatus => _iapService.verificationStatus;

  /// Returns the price string of the currently selected product, or null.
  String? getProductPrice() {
    if (_selectedProduct != null) return _selectedProduct!.price;
    if (_iapService.products.isNotEmpty) return _iapService.products.first.price;
    return null;
  }
}
