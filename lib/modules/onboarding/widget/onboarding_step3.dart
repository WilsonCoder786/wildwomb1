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
              'label': isEn ? 'Canopy (w×d)' : 'Overkapping (b×d)',
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
        ? '$widthStr × $lengthStr = $totalAreaStr m²'
        : isMuur
        ? '$lengthStr × $heightStr = $totalAreaStr m²'
        : '$lengthStr × $widthStr = $totalAreaStr m²';
    final String formulaLabel = isOverkapping
        ? (isEn ? 'Canopy: width × depth' : 'Overkapping: breedte × diepte')
        : isGardener
        ? (isEn
              ? 'Garden / Patio: length × width'
              : 'Tuin / Terras: lengte × breedte')
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

        // ── Instructional Guide Card ────────────────────────────────────
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
                '• ${l10n.onboardingMeasureFormulaFloor}\n• ${l10n.onboardingMeasureFormulaWall}\n• ${l10n.onboardingMeasureFormulaCeiling}',
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

        // ── Surface type selector ───────────────────────────────────────
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

        // ── Formula hint ────────────────────────────────────────────────
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

        // ── Input rows ──────────────────────────────────────────────────
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

        // ── Snijverlies toggle ──────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Switch(
                value: provider.includeExtra,
                onChanged: (v) => provider.updateMeasurements(includeExtra: v),
                activeThumbColor: Colors.green,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.includeExtra
                          ? (isOverkapping
                                ? (isEn
                                      ? '+15% cutting loss (roofing)'
                                      : '+15% snijverlies (aanbevolen)')
                                : l10n.onboardingCuttingLoss)
                          : (isEn
                                ? 'Without cutting loss'
                                : 'Zonder snijverlies'),
                      style: Utils.getTextStyle(
                        baseSize: 14,
                        isBold: true,
                        color: provider.includeExtra
                            ? Colors.green
                            : Colors.grey[700]!,
                      ),
                    ),
                    Text(
                      provider.includeExtra
                          ? (isOverkapping
                                ? (isEn
                                      ? 'Total with cutting loss: ${Utils.formatDecimal(provider.totalArea * 1.15, context)} m²'
                                      : 'Totaal met snijverlies: ${Utils.formatDecimal(provider.totalArea * 1.15, context)} m²')
                                : l10n.onboardingTotalWithLoss(
                                    Utils.formatDecimal(
                                      provider.totalArea * 1.10,
                                      context,
                                    ),
                                  ))
                          : (isEn
                                ? 'Total: ${Utils.formatDecimal(provider.totalArea, context)} m² (exact)'
                                : 'Totaal: ${Utils.formatDecimal(provider.totalArea, context)} m² (exact)'),
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: false,
                        color: provider.includeExtra
                            ? Colors.green
                            : Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // ── Radiator painting quantity selector ──────────────────────────
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
                      ? 'Total surface area: ${Utils.formatDecimal(provider.radiatorTotaalOppervlakte, context)} m² (${provider.radiatorVerfLiters} L 2-in-1 radiator paint needed for 2 coats)'
                      : 'Totale oppervlakte: ${Utils.formatDecimal(provider.radiatorTotaalOppervlakte, context)} m² (${provider.radiatorVerfLiters} L 2-in-1 radiatorlak nodig voor 2 lagen)',
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

        // ── Plinten type choice ──────────────────────────────────────────
        if (provider.selectedSpecificJobs.any(
          (j) => j.contains('Plint') || j.contains('Skirting'),
        )) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Utils.kDarkBlue.withValues(alpha: 0.15),
              ),
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
                    Icon(Icons.border_bottom, color: Utils.kOrange, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        isEn ? 'Skirting board type:' : 'Type plint:',
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
                ...[
                  {
                    'id': 'plakplinten',
                    'title': isEn
                        ? 'Self-adhesive flat skirting strips'
                        : 'Zelfklevende plakplinten (bijv. laminaat)',
                    'desc': isEn
                        ? 'Standard 2.40m strips (+10% cutting loss), includes degreaser wipes, no mounting glue or screws'
                        : 'Standaard 2,40m strips (+10% snijverlies), inclusief ontvetter, zonder kit/schroeven',
                  },
                  {
                    'id': 'hoge_plinten_lijm',
                    'title': isEn
                        ? 'High skirting boards (Glued with High-Tack)'
                        : 'Hoge muurplinten (lijmen met High-Tack)',
                    'desc': isEn
                        ? 'Mounted with High-Tack adhesive & acrylic sealant (no screws/nails)'
                        : 'Gemonteerd met High-Tack montagelijm & acrylaatkit (geen schroeven)',
                  },
                  {
                    'id': 'hoge_plinten_schroeven',
                    'title': isEn
                        ? 'High skirting boards (Screws / Clips)'
                        : 'Hoge muurplinten (schroeven / clips)',
                    'desc': isEn
                        ? 'Mounted with screws, wall plugs & acrylic sealant (no mounting glue)'
                        : 'Gemonteerd met schroeven/nagels, wandpluggen & acrylaatkit (geen montagelijm)',
                  },
                ].map((item) {
                  final isSelected =
                      provider.plintenType == item['id'] ||
                      (item['id'] == 'hoge_plinten_lijm' &&
                          provider.plintenType == 'hoge_plinten');
                  return GestureDetector(
                    onTap: () => provider.setPlintenType(item['id']!),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Utils.kOrange.withValues(alpha: 0.1)
                            : Colors.grey.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? Utils.kOrange
                              : Colors.grey.shade300,
                          width: isSelected ? 1.5 : 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: isSelected ? Utils.kOrange : Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title']!,
                                  style: Utils.getTextStyle(
                                    baseSize: 12,
                                    isBold: true,
                                    color: Utils.kDarkBlue,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['desc']!,
                                  style: Utils.getTextStyle(
                                    baseSize: 10,
                                    isBold: false,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        // ── Overkapping roof material choice ────────────────────────────
        if (provider.selectedSpecificJobs.any(
          (j) => j.contains('Overkapping') || j.contains('Canopy'),
        )) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Utils.kDarkBlue.withValues(alpha: 0.15),
              ),
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
                    Icon(Icons.roofing, color: Utils.kOrange, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.localeName.startsWith('en')
                            ? 'Roof material choice:'
                            : 'Materiaal keuze dak:',
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
                ...[
                  {
                    'nl': 'Polycarbonaat kanaalplaten (16mm)',
                    'en': 'Polycarbonate multiwall sheets (16mm)',
                    'desc': l10n.localeName.startsWith('en')
                        ? 'Impact-resistant & lightweight'
                        : 'Slagvast, UV-bestendig & licht',
                  },
                  {
                    'nl': 'Veiligheidsglas (gelaagd)',
                    'en': 'Laminated safety glass',
                    'desc': l10n.localeName.startsWith('en')
                        ? 'Crystal clear & luxurious'
                        : 'Glashelder, luxe uitstraling',
                  },
                  {
                    'nl': 'Golfplaten',
                    'en': 'Corrugated roof sheets',
                    'desc': l10n.localeName.startsWith('en')
                        ? 'Economical & durable'
                        : 'Voordelig, snel te monteren',
                  },
                  {
                    'nl': 'Houten dakbeschot met EPDM',
                    'en': 'Timber roof decking with EPDM',
                    'desc': l10n.localeName.startsWith('en')
                        ? 'Warm wooden ceiling & watertight'
                        : 'Warm houten plafond, waterdicht',
                  },
                ].map((mat) {
                  final isSelected =
                      provider.overkappingRoofMaterial == mat['nl'];
                  return GestureDetector(
                    onTap: () =>
                        provider.setOverkappingRoofMaterial(mat['nl']!),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Utils.kOrange.withValues(alpha: 0.1)
                            : Colors.grey.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? Utils.kOrange
                              : Colors.grey.shade300,
                          width: isSelected ? 1.5 : 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: isSelected ? Utils.kOrange : Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.localeName.startsWith('en')
                                      ? mat['en']!
                                      : mat['nl']!,
                                  style: Utils.getTextStyle(
                                    baseSize: 12,
                                    isBold: isSelected,
                                    color: isSelected
                                        ? Utils.kDarkBlue
                                        : Colors.black87,
                                  ),
                                ),
                                Text(
                                  mat['desc']!,
                                  style: Utils.getTextStyle(
                                    baseSize: 10,
                                    isBold: false,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
