import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/core/services/onboarding_data_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/dashboard/dashboard_provider.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/root/root_provider.dart';
import 'package:easy_four_diy/modules/settings/setting_provider.dart';
import 'package:easy_four_diy/modules/splash_page.dart';
import 'package:easy_four_diy/modules/subscription/subscritption_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await MobileAds.instance.initialize();
  await OnboardingDataService.instance.init();

  Utils.configLoading();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppService()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => RootProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),

        // IAP
        ChangeNotifierProvider(create: (_) => IAPService()),

        // Subscription
        ChangeNotifierProxyProvider<IAPService, SubscriptionProvider>(
          create: (context) => SubscriptionProvider(context.read<IAPService>()),
          update: (context, iapService, previous) =>
              previous ?? SubscriptionProvider(iapService),
          lazy: false,
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = context.watch<AppService>();
    return MaterialApp(
      scaffoldMessengerKey: Utils.key,
      navigatorKey: Utils.navKey,
      debugShowCheckedModeBanner: false,
      locale: appService.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Splashscreen(),
      builder: EasyLoading.init(),
    );
  }
}
