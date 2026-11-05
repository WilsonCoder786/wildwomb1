import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';

class OnboardingStep7 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const OnboardingStep7({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final calc = provider.calcResult;

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.onboardingCostOverview,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        Text(
          l10n.onboardingCostDiy,
          style: Utils.getTextStyle(
            baseSize: 10,
            isBold: false,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildCostCard(
                l10n.onboardingDoItYourself,
                l10n.dashboardMaterials,
                '€ ${calc?.materialCost.toStringAsFixed(2) ?? "0.00"}',
                l10n.dashboardTimeEstimate,
                '${Utils.formatHours(calc?.klusserHours)} ${l10n.dashboardHours}',
                l10n.dashboardTotal,
                '€ ${calc?.materialCost.toStringAsFixed(2) ?? "0.00"}',
                false,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildCostCard(
                l10n.onboardingHireProfessional,
                l10n.onboardingAveragePrice,
                '€ ${calc?.outsourcingCost.toStringAsFixed(2) ?? "0.00"}',
                l10n.dashboardTimeEstimate,
                '${Utils.formatHours(calc?.proHours)} ${l10n.dashboardHours}',
                '',
                '',
                true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[900],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.onboardingYouSave,
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: false,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '€ ${calc?.savings.toStringAsFixed(2) ?? "0.00"}',
                      style: Utils.getTextStyle(
                        baseSize: 24,
                        isBold: false,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '(${calc?.savingsPercent ?? 0}%) ${l10n.onboardingSmartDiy}',
                      style: Utils.getTextStyle(
                        baseSize: 10,
                        isBold: false,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.savings, color: Colors.greenAccent, size: 40),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildGuidancePanel(),
      ],
    );
  }

  Widget _buildGuidancePanel() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        border: Border.all(color: const Color(0xFFFFCC80)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        l10n.onboardingIndicativeCalculation,
        style: Utils.getTextStyle(
          baseSize: 13,
          isBold: false,
          color: Utils.kDarkBlue,
        ),
      ),
    );
  }
}

Widget _buildCostCard(
  String title,
  String label1,
  String val1,
  String label2,
  String val2,
  String label3,
  String val3,
  bool isHighlighted,
) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: isHighlighted
          ? Utils.kOrange.withValues(alpha: 0.05)
          : Colors.white,
      border: Border.all(
        color: isHighlighted ? Utils.kOrange : Utils.kLightGrey,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Utils.getTextStyle(
            baseSize: 10,
            isBold: false,
            color: isHighlighted ? Utils.kOrange : Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        Text(label1, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text(
          val1,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label2,
          style: Utils.getTextStyle(
            baseSize: 10,
            isBold: false,
            color: Utils.kDarkBlue,
          ),
        ),
        Text(
          val2,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Utils.kDarkBlue,
          ),
        ),
        if (label3.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            label3,
            style: Utils.getTextStyle(
              baseSize: 10,
              isBold: false,
              color: Utils.kDarkBlue,
            ),
          ),
          Text(
            val3,
            style: Utils.getTextStyle(
              baseSize: 14,
              isBold: false,
              color: Utils.kDarkBlue,
            ),
          ),
        ],
      ],
    ),
  );
}
