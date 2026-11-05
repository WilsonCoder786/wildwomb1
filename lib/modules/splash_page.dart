import 'package:easy_four_diy/core/app_navigator.dart';
import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/modules/auth/login_page.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_view.dart';
import 'package:easy_four_diy/modules/root/root_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Splash screen that:
/// 1. Shows while the app initialises.
/// 2. Waits for [AppService] to finish loading the user profile.
/// 3. Waits for [IAPService] to finish verifying the Google Play subscription.
/// 4. Navigates to the correct screen only after BOTH are ready.
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  /// Whether [AppService] has finished its async init.
  bool _appServiceReady = false;

  /// Whether [IAPService] has finished its startup subscription check.
  bool _iapServiceReady = false;

  @override
  void initState() {
    super.initState();
    // Ensure at least 2 s of splash visibility for UX polish.
    Future.delayed(const Duration(seconds: 2), _onDelayComplete);
  }

  void _onDelayComplete() {
    if (!mounted) return;
    _checkBothServices();
  }

  /// Checks whether both services are ready. If not, attaches listeners that
  /// call this again when each service notifies a change.
  void _checkBothServices() {
    if (!mounted) return;

    final appService = context.read<AppService>();
    final iapService = context.read<IAPService>();

    // ── AppService readiness ──────────────────────────────────────────────────
    if (appService.initialized) {
      _appServiceReady = true;
    } else {
      // Not ready yet — listen and re-check when it updates.
      appService.addListener(_onAppServiceUpdate);
    }

    // ── IAPService readiness ──────────────────────────────────────────────────
    // IAPService is considered ready once it is no longer loading.
    if (!iapService.isLoading) {
      _iapServiceReady = true;
    } else {
      // Still loading — listen and re-check when it notifies.
      iapService.addListener(_onIapServiceUpdate);
    }

    _tryNavigate();
  }

  void _onAppServiceUpdate() {
    if (!mounted) return;
    final appService = context.read<AppService>();
    if (appService.initialized) {
      appService.removeListener(_onAppServiceUpdate);
      _appServiceReady = true;
      _tryNavigate();
    }
  }

  void _onIapServiceUpdate() {
    if (!mounted) return;
    final iapService = context.read<IAPService>();
    if (!iapService.isLoading) {
      iapService.removeListener(_onIapServiceUpdate);
      _iapServiceReady = true;
      _tryNavigate();
    }
  }

  /// Navigates only when both services have completed their startup work.
  void _tryNavigate() {
    if (!_appServiceReady || !_iapServiceReady) return;
    if (!mounted) return;
    _navigate();
  }

  void _navigate() {
    if (!mounted) return;

    final appService = context.read<AppService>();
    final iapService = context.read<IAPService>();

    // User not logged in → send to login.
    if (appService.appUser == null) {
      AppNavigator.offAllName(context: context, page: const LoginPage());
      return;
    }

    // User has an active Google Play subscription → go straight to root.
    // The subscription screen is not shown; ads are suppressed by IAPService.
    if (iapService.isPremium) {
      AppNavigator.offAllName(context: context, page: const RootView());
      return;
    }

    // Free user — follow the existing onboarding / root flow.
    if (appService.appUser!.freeTrialUsed) {
      AppNavigator.offAllName(context: context, page: const RootView());
    } else {
      AppNavigator.offAllName(context: context, page: const OnboardingView());
    }
  }

  @override
  void dispose() {
    // Clean up listeners in case the widget is disposed before navigation.
    try {
      context.read<AppService>().removeListener(_onAppServiceUpdate);
    } catch (_) {}
    try {
      context.read<IAPService>().removeListener(_onIapServiceUpdate);
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/easy_4_diy2.png', height: 80),
      ),
    );
  }
}
