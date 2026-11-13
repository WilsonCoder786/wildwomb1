import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_gipsplaten_overview.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_input_row.dart';
import 'package:flutter/material.dart';

class OnboardingStep3 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const OnboardingStep3({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEn = l10n.localeName.startsWith('en');
    final bool isOverkapping = provider.isOverkapping;
    final measurementTypes = isOverkapping
        ? [
            {
              'label': isEn ? 'Canopy (wÃ—d)' : 'Overkapping (bÃ—d)',
              'value': 'Plafond (lxb)',
            },
          ]
        : [
            {'label': l10n.onboardingTypeFloor, 'value': 'Vloer (lxb)'},
            {'label': l10n.onboardingTypeWall, 'value': 'Muur (lxh)'},
            {'label': l10n.onboardingTypeCeiling, 'value': 'Plafond (lxb)'},
          ];

    final bool isGardener = provider.selectedJobId == 'gardener';
    final bool isMuur =
        provider.selectedMeasurementType == 'Muur (lxh)' &&
        !isGardener &&
        !isOverkapping;

    final String lengthStr = Utils.formatDecimal(provider.length, context);
    final String widthStr = Utils.formatDecimal(provider.width, context);
    final String heightStr = Utils.formatDecimal(provider.height, context);
    final String totalAreaStr = Utils.formatDecimal(
      provider.totalArea,
      context,
    );

    // Formula hint: show the active formula with current values
    final String formulaHint = isOverkapping
        ? '$widthStr Ã— $lengthStr = $totalAreaStr mÂ²'
        : isMuur
        ? '$lengthStr Ã— $heightStr = $totalAreaStr mÂ²'
        : '$lengthStr Ã— $widthStr = $totalAreaStr mÂ²';
    final String formulaLabel = isOverkapping
        ? (isEn ? 'Canopy: width Ã— depth' : 'Overkapping: breedte Ã— diepte')
        : isGardener
        ? (isEn
              ? 'Garden / Patio: length Ã— width'
              : 'Tuin / Terras: lengte Ã— breedte')
        : isMuur
        ? l10n.onboardingMeasureFormulaWall
        : provider.selectedMeasurementType == 'Plafond (lxb)'
        ? l10n.onboardingMeasureFormulaCeiling
        : l10n.onboardingMeasureFormulaFloor;

    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          l10n.onboardingFillSizes,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        Text(
          l10n.onboardingRoomDimensions,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 14),

        // â”€â”€ Instructional Guide Card â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Utils.kDarkBlue.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: Utils.kOrange, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.onboardingMeasureHeader,
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: true,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                l10n.onboardingMeasureStep1,
                style: Utils.getTextStyle(
                  baseSize: 11,
                  isBold: false,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Utils.kLightGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.onboardingMeasureExampleTitle,
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: true,
                        color: Utils.kOrange,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.onboardingMeasureExampleDesc,
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: false,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'â€¢ ${l10n.onboardingMeasureFormulaFloor}\nâ€¢ ${l10n.onboardingMeasureFormulaWall}\nâ€¢ ${l10n.onboardingMeasureFormulaCeiling}',
                style: Utils.getTextStyle(
                  baseSize: 11,
                  isBold: true,
                  color: Utils.kDarkBlue,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.onboardingMeasureFooter,
                style: Utils.getTextStyle(
                  baseSize: 11,
                  isBold: false,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // â”€â”€ Surface type selector â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        if (!isGardener) ...[
          Row(
            children: measurementTypes.map((type) {
              final isSelected =
                  provider.selectedMeasurementType == type['value'];
              return Expanded(
                child: GestureDetector(
                  onTap: () => provider.setMeasurementType(type['value']!),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Utils.kDarkBlue : Colors.white,
                      border: Border.all(color: Utils.kDarkBlue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      type['label']!,
                      textAlign: TextAlign.center,
                      style: Utils.getTextStyle(
                        baseSize: 10,
                        isBold: isSelected ? true : false,
                        color: isSelected ? Colors.white : Utils.kDarkBlue,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
        ],

        // â”€â”€ Formula hint â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Utils.kDarkBlue.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: RichText(
            text: TextSpan(
              style: Utils.getTextStyle(
                baseSize: 12,
                isBold: false,
                color: Utils.kDarkBlue,
              ),
              children: [
                TextSpan(
                  text: '$formulaLabel  \u2192  ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: formulaHint),
              ],
            ),
          ),
        ),

        const SizedBox(height: 14),

        // â”€â”€ Input rows â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        if (isOverkapping) ...[
          BuildInputRow(
            icon: Icons.straighten,
            label: isEn ? 'Width (m)' : 'Breedte (m)',
            value: widthStr,
            onChanged: (v) =>
                provider.updateMeasurements(width: Utils.parseDecimal(v)),
          ),
          const SizedBox(height: 10),
          BuildInputRow(
            icon: Icons.height,
            label: isEn ? 'Depth (m)' : 'Diepte (m)',
            value: lengthStr,
            onChanged: (v) =>
                provider.updateMeasurements(length: Utils.parseDecimal(v)),
          ),
          const SizedBox(height: 10),
        ] else ...[
          BuildInputRow(
            icon: Icons.straighten,
            label: l10n.onboardingLength,
            value: lengthStr,
            onChanged: (v) =>
                provider.updateMeasurements(length: Utils.parseDecimal(v)),
          ),
          const SizedBox(height: 10),

          if (!isMuur) ...[
            BuildInputRow(
              icon: Icons.height,
              label: l10n.onboardingWidth,
              value: widthStr,
              onChanged: (v) =>
                  provider.updateMeasurements(width: Utils.parseDecimal(v)),
            ),
            const SizedBox(height: 10),
          ],

          if (isMuur) ...[
            BuildInputRow(
              icon: Icons.open_in_full,
              label: l10n.onboardingHeight,
              value: heightStr,
              onChanged: (v) =>
                  provider.updateMeasurements(height: Utils.parseDecimal(v)),
            ),
            const SizedBox(height: 10),
          ],
        ],

        // Totale oppervlakte (read-only)
        BuildInputRow(
          icon: Icons.square_foot,
          label: l10n.onboardingTotalArea,
          value: totalAreaStr,
          onChanged: null,
        ),
        const SizedBox(height: 20),

        // â”€â”€ Radiator painting quantity selector â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        if (provider.isRadiator) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Utils.kOrange.withValues(alpha: 0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.heat_pump, color: Utils.kOrange, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        isEn
                            ? 'Number of radiators to paint:'
                            : 'Aantal radiatoren te schilderen:',
                        style: Utils.getTextStyle(
                          baseSize: 13,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (provider.radiatorAantal > 1) {
                          provider.setRadiatorAantal(
                            provider.radiatorAantal - 1,
                          );
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.remove, size: 20),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${provider.radiatorAantal} ${isEn ? (provider.radiatorAantal == 1 ? 'radiator' : 'radiators') : (provider.radiatorAantal == 1 ? 'radiator' : 'radiatoren')}',
                      style: Utils.getTextStyle(
                        baseSize: 15,
                        isBold: true,
                        color: Utils.kDarkBlue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        if (provider.radiatorAantal < 20) {
                          provider.setRadiatorAantal(
                            provider.radiatorAantal + 1,
                          );
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Utils.kOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  isEn
                      ? 'Total surface area: ${Utils.formatDecimal(provider.radiatorTotaalOppervlakte, context)} mÂ² (${provider.radiatorVerfLiters} L 2-in-1 radiator paint needed for 2 coats)'
                      : 'Totale oppervlakte: ${Utils.formatDecimal(provider.radiatorTotaalOppervlakte, context)} mÂ² (${provider.radiatorVerfLiters} L 2-in-1 radiatorlak nodig voor 2 lagen)',
                  style: Utils.getTextStyle(
                    baseSize: 11,
                    isBold: false,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        if (provider.selectedSpecificJobs.any(
          (j) =>
              j.contains('Gipswand') ||
              j.contains('gipswand') ||
              j.contains('Plasterboard') ||
              j.contains('plasterboard') ||
              j.contains('Koof') ||
              j.contains('koof') ||
              j.contains('Coving') ||
              j.contains('Bulkhead'),
        ))
          BuildGipsplatenOverview(isEn: l10n.localeName.startsWith('en')),
      ],
    );
  }
}
