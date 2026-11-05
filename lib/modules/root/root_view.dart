import 'package:easy_four_diy/core/services/ad_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/dashboard/dashboard_view.dart';
import 'package:easy_four_diy/modules/root/root_provider.dart';
import 'package:easy_four_diy/modules/settings/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final List<Widget> _widgetOptions = <Widget>[DashboardView(), SettingView()];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<RootProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 100,
            title: Image.asset("assets/images/easy_4_diy2.png", height: 46),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: _widgetOptions.elementAt(provider.selectedIndex),
                ),
                // Hide banner ads for subscribed users
                if (!context.watch<IAPService>().isPremium)
                  const AdBannerWidget(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Utils.kOrange,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: l10n.rootDashboard,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: l10n.rootSettings,
                  ),
                ],
                currentIndex: provider.selectedIndex,
                showUnselectedLabels: true,
                selectedLabelStyle: Utils.getTextStyle(
                  baseSize: 12,
                  isBold: true,
                  color: Colors.white,
                ),
                unselectedLabelStyle: Utils.getTextStyle(
                  baseSize: 12,
                  isBold: false,
                  color: Colors.white70,
                ),
                selectedItemColor: Utils.kDarkBlue,
                unselectedItemColor: Colors.white70,
                onTap: (index) {
                  provider.setIndex(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
