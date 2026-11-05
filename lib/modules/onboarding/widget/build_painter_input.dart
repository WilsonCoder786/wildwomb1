import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';

class BuildPainterInput extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;

  const BuildPainterInput({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final isEnglish = l10n.localeName.startsWith('en');
    final count = provider.customCount;
    final item = provider.isRadiator
        ? (isEnglish ? 'radiators' : 'radiatoren')
        : (isEnglish ? 'frames / doors' : 'kozijnen / deuren');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          provider.isRadiator
              ? (isEnglish ? 'Paint radiators' : 'Radiatoren schilderen')
              : (isEnglish
                    ? 'Paint frames / doors'
                    : 'Kozijnen / deuren schilderen'),
          style: Utils.getTextStyle(
            baseSize: 20,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isEnglish
              ? 'Enter the number of items to paint.'
              : 'Vul in hoeveel onderdelen je wilt schilderen.',
          style: Utils.getTextStyle(
            baseSize: 13,
            isBold: false,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              onPressed: count > 1
                  ? () => provider.setCustomCount(count - 1)
                  : null,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              '$count $item',
              style: Utils.getTextStyle(
                baseSize: 16,
                isBold: true,
                color: Utils.kDarkBlue,
              ),
            ),
            IconButton(
              onPressed: () => provider.setCustomCount(count + 1),
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}
