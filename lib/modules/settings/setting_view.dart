import 'package:easy_four_diy/core/app_navigator.dart';
import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/auth/login_page.dart';
import 'package:easy_four_diy/modules/subscription/subscription_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool _isMeters = true;

  /// Returns the BCP-47 language code ('en' or 'nl') of the currently active
  /// locale so the radio buttons stay in sync with [AppService.locale].
  String _selectedLanguageCode(BuildContext context) {
    final code = context.watch<AppService>().locale.languageCode;
    // Default to 'nl' if somehow a different locale is set
    return (code == 'en' || code == 'nl') ? code : 'nl';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isPremium = context.watch<IAPService>().isPremium;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isPremium) ...[
              _buildPremiumCard(l10n),
              const SizedBox(height: 24),
            ],
            _buildAccountSection(l10n),
            const SizedBox(height: 24),
            _buildLanguageSection(l10n),
            const SizedBox(height: 16),
            _buildUnitsSection(l10n),
            const SizedBox(height: 16),
            _buildOtherSection(l10n),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await context.read<AppService>().logout();
                  if (context.mounted) {
                    AppNavigator.offAllName(
                      context: context,
                      page: const LoginPage(),
                    );
                  }
                },
                icon: Icon(Icons.logout, size: 22),
                label: Text(
                  l10n.settingsLogout,
                  style: Utils.getTextStyle(
                    baseSize: 16,
                    isBold: false,
                    color: Utils.kDarkBlue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Utils.kDarkBlue.withValues(alpha: 0.1),
                  foregroundColor: Utils.kDarkBlue,
                  side: BorderSide(color: Utils.kDarkBlue),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required Widget child,
    required bool profile,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profile
                  ? const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: iconColor, size: 20),
                    ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Utils.getTextStyle(
                      baseSize: 15,
                      isBold: true,
                      color: Utils.kDarkBlue,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Utils.getTextStyle(
                      baseSize: 11,
                      isBold: false,
                      color: Colors.grey[600]!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildLanguageSection(AppLocalizations l10n) {
    final languages = [
      {'code': 'nl', 'label': 'NL', 'name': 'Nederlands'},
      {'code': 'en', 'label': 'EN', 'name': 'English'},
    ];

    final selectedCode = _selectedLanguageCode(context);
    final appService = context.read<AppService>();

    return _buildSectionCard(
      profile: false,
      icon: Icons.language,
      iconColor: Colors.blue,
      iconBgColor: Colors.blue.withValues(alpha: 0.1),
      title: l10n.settingsLanguage,
      subtitle: l10n.settingsLanguageSubtitle,
      child: Column(
        children: languages.map((lang) {
          final isSelected = selectedCode == lang['code'];
          return InkWell(
            onTap: () {
              appService.setLocale(Locale(lang['code']!));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: isSelected ? Utils.kDarkBlue : Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    lang['label']!,
                    style: Utils.getTextStyle(
                      baseSize: 11,
                      isBold: true,
                      color: Utils.kDarkBlue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      lang['name']!,
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: false,
                        color: Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUnitsSection(AppLocalizations l10n) {
    return _buildSectionCard(
      profile: false,
      icon: Icons.square_foot,
      iconColor: Colors.green,
      iconBgColor: Colors.green.withValues(alpha: 0.1),
      title: l10n.settingsUnits,
      subtitle: l10n.settingsUnitsSubtitle,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isMeters = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _isMeters
                      ? Utils.kOrange.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: _isMeters ? Utils.kOrange : Colors.grey[200]!,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  l10n.settingsMeters,
                  style: Utils.getTextStyle(
                    baseSize: 11,
                    isBold: _isMeters,
                    color: _isMeters ? Utils.kOrange : Colors.grey[600]!,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isMeters = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !_isMeters
                      ? Utils.kOrange.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: !_isMeters ? Utils.kOrange : Colors.grey[200]!,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  l10n.settingsInches,
                  style: Utils.getTextStyle(
                    baseSize: 11,
                    isBold: !_isMeters,
                    color: !_isMeters ? Utils.kOrange : Colors.grey[600]!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection(AppLocalizations l10n) {
    final appUser = context.watch<AppService>().appUser;
    final userName = (appUser?.name.isNotEmpty == true)
        ? appUser!.name
        : "User";
    final userEmail = appUser?.email ?? "No email";

    return _buildSectionCard(
      profile: true,
      icon: Icons.person_outline,
      iconColor: Colors.blue,
      iconBgColor: Colors.blue.withValues(alpha: 0.1),
      title: l10n.settingsAccount,
      subtitle: l10n.settingsAccountSubtitle,
      child: Column(
        children: [
          _buildListTile(() {}, l10n.settingsName, userName),
          const Divider(height: 24),
          _buildListTile(() {}, l10n.settingsEmailAddress, userEmail),
        ],
      ),
    );
  }

  Widget _buildOtherSection(AppLocalizations l10n) {
    return _buildSectionCard(
      profile: false,
      icon: Icons.settings_outlined,
      iconColor: Colors.purple,
      iconBgColor: Colors.purple.withValues(alpha: 0.1),
      title: l10n.settingsOther,
      subtitle: "",
      child: Column(
        children: [
          _buildListTile(
            () {
              Utils.openPrivacyPolicy();
            },
            l10n.settingsPrivacyPolicy,
            "",
          ),
          // const Divider(height: 24),
          // _buildListTile(() {}, l10n.settingsTermsConditions, ""),
          const Divider(height: 24),
          _buildListTile(
            () {
              Utils.sendMail();
            },
            l10n.settingsHelpSupport,
            "",
          ),
          const Divider(height: 24),
          _buildListTile(
            () {},
            l10n.settingsAbout,
            "",
            trailing: "Version 1.0.0",
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
    VoidCallback onTap,
    String title,
    String value, {
    String? trailing,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Utils.getTextStyle(
                    baseSize: 13,
                    isBold: false,
                    color: Utils.kDarkBlue,
                  ),
                ),
                if (value.isNotEmpty)
                  Text(
                    value,
                    style: Utils.getTextStyle(
                      baseSize: 10,
                      isBold: false,
                      color: Colors.grey[600]!,
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: Utils.getTextStyle(
                baseSize: 10,
                isBold: false,
                color: Colors.grey[600]!,
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ],
      ),
    );
  }

  Widget _buildPremiumCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Utils.kOrange.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/hammer.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.rootGoPremium,
                      style: Utils.getTextStyle(
                        baseSize: 14,
                        isBold: true,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                    Text(
                      l10n.rootUnlockPremium,
                      style: Utils.getTextStyle(
                        baseSize: 10,
                        isBold: false,
                        color: Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              AppNavigator.toName(context: context, page: SubscriptionPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Utils.kOrange,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              l10n.rootUpgradeNow,
              style: Utils.getTextStyle(
                baseSize: 12,
                isBold: true,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
