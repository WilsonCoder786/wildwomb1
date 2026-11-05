import 'package:easy_four_diy/core/services/material_translator.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_gipsplaten_overview.dart';
import 'package:flutter/material.dart';

class OnboardingStep4 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const OnboardingStep4({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final materials = provider.materials;
    final bool isEn = l10n.localeName.startsWith('en');
    final bool isGardenStructure = provider.selectedSpecificJobs.any(
      (j) => j.contains('Overkapping') || j.contains('Canopy construction'),
    );
    final bool isGipswandOrKoof = provider.selectedSpecificJobs.any(
      (j) =>
          j.contains('Gipswand') ||
          j.contains('gipswand') ||
          j.contains('Plasterboard') ||
          j.contains('plasterboard') ||
          j.contains('Wand plaatsen') ||
          j.contains('Wall installation') ||
          j.contains('Scheidingswand') ||
          j.contains('Partition wall') ||
          j.contains('Koof') ||
          j.contains('koof') ||
          j.contains('Coving') ||
          j.contains('Bulkhead'),
    );

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.onboardingMaterialsOverview,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            // Icon placeholder to match data rows
            const SizedBox(width: 16 + 8), // icon(16) + SizedBox(8)
            Expanded(
              child: Text(
                l10n.onboardingMaterial,
                style: Utils.getTextStyle(
                  baseSize: 12,
                  isBold: false,
                  color: Utils.kDarkBlue,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                l10n.onboardingQty,
                textAlign: TextAlign.end,
                style: Utils.getTextStyle(
                  baseSize: 12,
                  isBold: false,
                  color: Utils.kDarkBlue,
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 88,
              child: Text(
                l10n.onboardingPrice,
                textAlign: TextAlign.end,
                style: Utils.getTextStyle(
                  baseSize: 12,
                  isBold: false,
                  color: Utils.kDarkBlue,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: materials.length,
          itemBuilder: (context, index) {
            final item = materials[index];
            final rawName = item['name'] as String;
            final rawQty = item['qty'] as String;
            final displayName = (item['nameEn'] != null && isEn)
                ? item['nameEn'] as String
                : MaterialTranslator.translateName(rawName, isEn);
            final displayQty = (item['qtyEn'] != null && isEn)
                ? item['qtyEn'] as String
                : MaterialTranslator.translateQty(rawQty, isEn);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    item['icon'] as IconData,
                    size: 16,
                    color: Utils.kOrange,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: Utils.getTextStyle(
                            baseSize: 10,
                            isBold: false,
                            color: Utils.kDarkBlue,
                          ),
                        ),
                        if (item['dimension'] != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              item['dimension'] as String,
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      displayQty,
                      textAlign: TextAlign.end,
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: false,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 88,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        item['price'] as String,
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.green, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  !provider.needsAreaCalculation
                      ? (l10n.localeName.startsWith('en')
                            ? 'Based on standard installation'
                            : 'Op basis van standaard installatie')
                      : l10n.onboardingBasedOnArea(
                          Utils.formatDecimal(
                            provider.includeExtra
                                ? (provider.calcResult?.reserveArea ??
                                      (provider.totalArea * 1.10))
                                : (provider.calcResult?.area ??
                                      provider.totalArea),
                            context,
                          ),
                        ),
                  style: Utils.getTextStyle(
                    baseSize: 12,
                    isBold: false,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isGardenStructure) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Utils.kDarkBlue.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Utils.kDarkBlue.withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.roofing, color: Utils.kOrange, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: false,
                        color: Utils.kDarkBlue,
                      ),
                      children: isEn
                          ? const [
                              TextSpan(
                                text: 'Structure & Roof: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Aluminium and timber for the structure, combined with polycarbonate or glass for the roof.',
                              ),
                            ]
                          : const [
                              TextSpan(
                                text: 'Constructie & Dak: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Aluminium en hout voor de constructie, in combinatie met polycarbonaat of glas voor het dak.',
                              ),
                            ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        if (isGipswandOrKoof) BuildGipsplatenOverview(isEn: isEn),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Utils.kDarkBlue.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.12)),
          ),
          child: Row(
            children: [
              Icon(Icons.storefront, size: 16, color: Utils.kOrange),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isEn
                      ? 'Materials & trade dimensions connected to Gamma, Hornbach, Bouwmaat & Jongeneel.'
                      : 'Materialen & handelsmaten gekoppeld aan Gamma, Hornbach, Bouwmaat & Jongeneel.',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Utils.kDarkBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
