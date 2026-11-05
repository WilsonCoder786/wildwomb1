import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';

class OnboardingStep8 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const OnboardingStep8({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.onboardingChoosePlan,
          textAlign: TextAlign.center,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.onboardingUnlockFeatures,
          textAlign: TextAlign.center,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        _buildFreeCard(l10n),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            l10n.onboardingSubscriptionChoice,
            style: Utils.getTextStyle(
              baseSize: 18,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildSubscriptionCard(
          l10n: l10n,
          title: l10n.onboardingPlanPremium,
          price: "€2.99",
          period: l10n.onboardingPerMonth,
          buttonText: l10n.onboardingChoosePremium,
          buttonColor: Utils.kOrange,
          isSelected: provider.selectedPlan == 'PREMIUM',
          onTap: () => provider.selectPlan('PREMIUM'),
        ),
        const SizedBox(height: 16),
        _buildSubscriptionCard(
          l10n: l10n,
          title: l10n.onboardingPlanYearly,
          subtitle: l10n.onboardingBestChoice,
          price: "€19.99",
          period: l10n.onboardingPerYear,
          buttonText: l10n.onboardingChooseYearly,
          buttonColor: Colors.green[700]!,
          footerText: l10n.onboardingSave17,
          isSelected: provider.selectedPlan == 'YEARLY',
          onTap: () => provider.selectPlan('YEARLY'),
        ),
      ],
    );
  }
}

Widget _buildSubscriptionCard({
  required AppLocalizations l10n,
  required String title,
  String? subtitle,
  required String price,
  required String period,
  required String buttonText,
  required Color buttonColor,
  String? footerText,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? buttonColor : Utils.kLightGrey,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Utils.getTextStyle(
              baseSize: 14,
              isBold: true,
              color: isSelected ? buttonColor : Colors.black87,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 16),
          ...[
            l10n.onboardingUnlimitedJobs,
            l10n.onboardingAllFeatures,
            l10n.onboardingNoAds,
            l10n.onboardingPremiumSupport,
            l10n.onboardingUpdateNewJobs,
          ].map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.black, size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      feature,
                      style: Utils.getTextStyle(
                        baseSize: 10,
                        isBold: false,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: Utils.getTextStyle(
              baseSize: 22,
              isBold: true,
              color: Colors.black,
            ),
          ),
          Text(
            period,
            style: const TextStyle(color: Colors.black54, fontSize: 10),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (footerText != null) ...[
            const SizedBox(height: 8),
            Text(
              footerText,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

Widget _buildFreeCard(AppLocalizations l10n) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Utils.kLightGrey),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.card_giftcard, color: Utils.kOrange, size: 20),
            const SizedBox(width: 4),
            Text(
              l10n.onboardingPlanFree,
              style: Utils.getTextStyle(
                baseSize: 10,
                isBold: true,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          l10n.onboardingHowItWorks,
          style: Utils.getTextStyle(
            baseSize: 12,
            isBold: true,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildStepRow("1", l10n.onboardingFreeStep1),
        const SizedBox(height: 12),
        _buildStepRow("2", l10n.onboardingFreeStep2),
        const SizedBox(height: 12),
        _buildStepRow("3", l10n.onboardingFreeStep3),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Utils.kDarkBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                l10n.onboardingEasyToUse,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                l10n.onboardingDownloadApp,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 8),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildStepRow(String number, String text) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          text,
          style: Utils.getTextStyle(
            baseSize: 10,
            isBold: true,
            color: Colors.black87,
          ),
        ),
      ),
    ],
  );
}
