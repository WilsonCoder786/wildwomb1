import 'dart:io';

import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class AdService {
  static InterstitialAd? _interstitialAd;

  // ─── Ad Unit IDs ─────────────────────────────────────────────────────────────

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2121194116204746/2082855935';
    } else if (Platform.isIOS) {
      return '';
    }
    return '';
  }

  /// Banner ad unit ID (test IDs; replace with production IDs before release).
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2121194116204746/7293950472';
    } else if (Platform.isIOS) {
      return '';
    }
    return '';
  }

  static bool shouldShowAds(BuildContext context) {
    return !context.read<IAPService>().isPremium;
  }

  // ─── Interstitial Ads ─────────────────────────────────────────────────────────

  static void loadInterstitialAd(BuildContext context) {
    if (!shouldShowAds(context)) return;

    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('AdService: InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  static void showInterstitialAd(BuildContext context) {
    if (!shouldShowAds(context)) return;

    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadInterstitialAd(context);
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('AdService: Failed to show InterstitialAd: $error');
          ad.dispose();
          loadInterstitialAd(context);
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      // Ad not yet loaded — pre-load for next time.
      loadInterstitialAd(context);
    }
  }
}

// ─── Banner Ad Widget ─────────────────────────────────────────────────────────

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bool isPremium = context.read<IAPService>().isPremium;
      if (!isPremium && _bannerAd == null) {
        _loadBannerAd();
      }
    });
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdService.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() => _isLoaded = true);
          }
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('AdService: BannerAd failed to load: ${err.message}');
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPremium = context.watch<IAPService>().isPremium;

    if (isPremium || !_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}
