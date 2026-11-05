import 'package:easy_four_diy/core/services/onboarding_data_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildStepDeurPlaatsen extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildStepDeurPlaatsen({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEn = l10n.localeName.startsWith('en');

    // Helper: builds a labelled chip-group selector
    Widget chipGroup({
      required String sectionLabel,
      required String sectionLabelEn,
      required String sectionIcon,
      required String hint,
      required String hintEn,
      required List<String> options,
      required List<String> optionsEn,
      required String selected,
      required ValueChanged<String> onSelected,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(sectionIcon, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isEn ? sectionLabelEn : sectionLabel,
                    style: Utils.getTextStyle(
                      baseSize: 14,
                      isBold: true,
                      color: Utils.kDarkBlue,
                    ),
                  ),
                ),
              ],
            ),
            if (hint.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(
                isEn ? hintEn : hint,
                style: Utils.getTextStyle(
                  baseSize: 11,
                  isBold: false,
                  color: Colors.black45,
                ),
              ),
            ],
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(options.length, (i) {
                final opt = options[i];
                final display = (isEn && i < optionsEn.length)
                    ? optionsEn[i]
                    : opt;
                final isSelected = selected == opt;
                return GestureDetector(
                  onTap: () => onSelected(opt),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Utils.kOrange.withValues(alpha: 0.12)
                          : Colors.grey.shade50,
                      border: Border.all(
                        color: isSelected
                            ? Utils.kOrange
                            : Colors.grey.shade300,
                        width: isSelected ? 2.0 : 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.check_circle,
                              color: Utils.kOrange,
                              size: 16,
                            ),
                          ),
                        Text(
                          display,
                          style: Utils.getTextStyle(
                            baseSize: 13,
                            isBold: isSelected,
                            color: isSelected ? Utils.kOrange : Utils.kDarkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    }

    return StatefulBuilder(
      builder: (ctx, ss) {
        // Dynamic materials list
        final List<String> materials = [];
        final dynamicMaterials = provider.materials;
        if (dynamicMaterials.isNotEmpty) {
          for (final item in dynamicMaterials) {
            final name = (item['nameEn'] != null && isEn)
                ? item['nameEn'] as String
                : item['name'] as String;
            materials.add(name);
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── Header ──────────────────────────────────────────────────────
            Text(
              isEn ? 'Door Installation — Details' : 'Deur plaatsen — Keuzes',
              style: Utils.getTextStyle(
                baseSize: 20,
                isBold: true,
                color: Utils.kDarkBlue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isEn
                  ? 'Answer each question to get an accurate price and materials list.'
                  : 'Beantwoord elke vraag voor een nauwkeurige prijs en materialenlijst.',
              style: Utils.getTextStyle(
                baseSize: 13,
                isBold: false,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // ── Q1: Location ─────────────────────────────────────────────────
            chipGroup(
              sectionLabel: 'Stap 1: Locatie',
              sectionLabelEn: 'Step 1: Location (Inside or Outside?)',
              sectionIcon: '🏠',
              hint: 'Buiten = weerbestendig hang- en sluitwerk, tochtstrip, waterdichte kit (+€150)',
              hintEn: 'Outside = weather-resistant hardware, draft seal, waterproof sealant (+€150)',
              options: OnboardingDataService.instance.uiDoorLocation,
              optionsEn: ['Inside', 'Outside'],
              selected: provider.deurLocatie,
              onSelected: (v) {
                provider.setDeurLocatie(v);
                ss(() {});
              },
            ),

            // ── Q1b: If Outside: Exterior Door Type ──────────────────────────
            if (provider.deurLocatie == 'Buiten')
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: chipGroup(
                  sectionLabel: 'Type buitendeur',
                  sectionLabelEn: 'Exterior door type',
                  sectionIcon: '🚪',
                  hint: 'Voordeur = extra veiligheidsslot/meerpuntssluiting  •  Achter-/balkondeur',
                  hintEn: 'Front door = multi-point security lock  •  Back door / Balcony door',
                  options: OnboardingDataService.instance.uiDoorOutsideType,
                  optionsEn: ['Front door', 'Back door', 'Balcony door'],
                  selected: provider.deurBuitenType,
                  onSelected: (v) {
                    provider.setDeurBuitenType(v);
                    ss(() {});
                  },
                ),
              ),

            // ── Q2: Construction Type (Door System) ──────────────────────────
            chipGroup(
              sectionLabel: 'Stap 2: Type constructie (Deursysteem)',
              sectionLabelEn: 'Step 2: Construction Type (Door System)',
              sectionIcon: '🔩',
              hint: 'Stomp = strak, valt in kozijn  •  Opdek = valt over kozijn  •  Inleg = valt ín kozijn (oudere woningen)',
              hintEn: 'Flush = sleek, concealed hinges  •  Surface-mounted = overlaps frame  •  Recessed = fits inside frame',
              options: OnboardingDataService.instance.uiDoorConstruction,
              optionsEn: [
                'Flush (Stomp)',
                'Surface-mounted (Opdek)',
                'Recessed (Inleg)',
              ],
              selected: provider.deurType,
              onSelected: (v) {
                provider.setDeurType(v);
                ss(() {});
              },
            ),

            // ── Q3: Filling / Material ───────────────────────────────────────
            chipGroup(
              sectionLabel: 'Stap 3: Vulling / Materiaal',
              sectionLabelEn: 'Step 3: Filling / Finish (Material)',
              sectionIcon: '🪵',
              hint: 'Massief = massief hout (+€80)  •  Volspaan = stevige kern  •  Board = vlak/glad scharnierdeur  •  Paneel = klassieke paneeldeur  •  Met glas = glaslatten + glas (+€60)  •  Bovenlicht (+€75)',
              hintEn: 'Solid wood = heavy & exterior (+€80)  •  Solid-core = dense interior  •  Board = flat/smooth door  •  Panel = traditional panelled door  •  With glass (+€60)  •  With transom (+€75)',
              options: OnboardingDataService.instance.uiDoorMaterial,
              optionsEn: [
                'Solid wood',
                'Solid-core',
                'Hollow-core',
                'Particleboard / MDF',
                'Board',
                'Panel',
                'With glass',
                'With transom / panels',
              ],
              selected: provider.deurFinish,
              onSelected: (v) {
                provider.setDeurFinish(v);
                ss(() {});
              },
            ),

            // ── Q3b: Glass? (Only show if not already With Glass / Transom) ──
            if (provider.deurUitvoering != 'Met glas' &&
                provider.deurUitvoering != 'Met bovenlicht')
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('🔍', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            isEn
                                ? 'Extra glass insert? (Optional)'
                                : 'Extra glaspaneel toevoegen? (Optioneel)',
                            style: Utils.getTextStyle(
                              baseSize: 14,
                              isBold: true,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                        ),
                        Switch(
                          value: provider.deurGlas,
                          activeThumbColor: Utils.kOrange,
                          onChanged: (v) {
                            provider.setDeurGlas(v);
                            ss(() {});
                          },
                        ),
                      ],
                    ),
                    Text(
                      isEn
                          ? (provider.deurGlas
                                ? 'Yes — adds a glass insert to a solid/opaque door (+€45)'
                                : 'No extra glass insert (choose "With glass" above for a full glass-door)')
                          : (provider.deurGlas
                                ? 'Ja — voegt een glaspaneel toe aan een dichte deur (+€45)'
                                : 'Geen extra glaspaneel (kies hierboven "Met glas" voor een volledige glasdeur)'),
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: false,
                        color: provider.deurGlas
                            ? Utils.kOrange
                            : Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),

            // ── Q3c: Glass installation method (if has glass) ────────────────
            if (provider.deurGlas ||
                provider.deurUitvoering == 'Met glas' ||
                provider.deurUitvoering == 'Met bovenlicht')
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: chipGroup(
                  sectionLabel: 'Glasmontage methode',
                  sectionLabelEn: 'Glass installation method',
                  sectionIcon: '🪟',
                  hint: 'Glaslatten = gemonteerd met glaslatten  •  Direct in deur = fabrieksmatig geïntegreerd',
                  hintEn: 'Glazing beads = installed with glazing beads  •  Direct = integrated into door',
                  options: OnboardingDataService.instance.uiDoorGlassMounting,
                  optionsEn: ['Glazing beads', 'Directly in door'],
                  selected: provider.deurGlasMontage,
                  onSelected: (v) {
                    provider.setDeurGlasMontage(v);
                    ss(() {});
                  },
                ),
              ),

            // ── Q4: Finishing & Hardware ─────────────────────────────────────
            chipGroup(
              sectionLabel: 'Stap 4a: Afwerking / Behandeling',
              sectionLabelEn: 'Step 4a: Finishing (Treatment)',
              sectionIcon: '🎨',
              hint: 'Gegrond = voorbehandeld  •  Onbehandeld = zelf schilderen  •  Blank hout = transparant afgewerkt',
              hintEn: 'Primed = pre-treated  •  Untreated = raw wood  •  Natural wood = clear coated',
              options: OnboardingDataService.instance.uiDoorTreatment,
              optionsEn: ['Primed', 'Untreated', 'Natural wood'],
              selected: provider.deurBehandeling,
              onSelected: (v) {
                provider.setDeurBehandeling(v);
                ss(() {});
              },
            ),

            chipGroup(
              sectionLabel: 'Stap 4b: Deurbeslag type',
              sectionLabelEn: 'Step 4b: Hardware / Handle',
              sectionIcon: '🔑',
              hint: 'Krukstel = deurklink met langschild  •  Deurknop = vaste of draaiknop',
              hintEn: 'Lever handle = long backplate lever  •  Door knob = knob hardware',
              options: OnboardingDataService.instance.uiDoorHandle,
              optionsEn: ['Lever handle (long model)', 'Door knob'],
              selected: provider.deurBeslagType,
              onSelected: (v) {
                provider.setDeurBeslagType(v);
                ss(() {});
              },
            ),

            // ── Q5: Frame ────────────────────────────────────────────────────
            chipGroup(
              sectionLabel: 'Stap 5: Kozijn (Nieuw of bestaand?)',
              sectionLabelEn: 'Step 5: Frame (New frame or existing?)',
              sectionIcon: '🪟',
              hint: 'Nieuw kozijn = kozijnhout, ankers, purschuim, omlijsting (+€120)',
              hintEn: 'New frame = frame wood, anchors, expanding foam, trim (+€120)',
              options: OnboardingDataService.instance.uiDoorFrame,
              optionsEn: ['Existing frame', 'New frame (+€120)'],
              selected: provider.deurKozijn,
              onSelected: (v) {
                provider.setDeurKozijn(v);
                ss(() {});
              },
            ),

            // ── Deurmaat ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('📐', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 8),
                      Text(
                        isEn ? 'Step 6: Door size' : 'Stap 6: Deurmaat',
                        style: Utils.getTextStyle(baseSize: 14, isBold: true, color: Utils.kDarkBlue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isEn
                        ? 'Standard NL door: 201.5 × 83 × 4 cm. Choose custom for non-standard sizes.'
                        : 'Standaard NL deur: 201,5 × 83 × 4 cm. Kies op maat voor afwijkende maten.',
                    style: Utils.getTextStyle(baseSize: 11, isBold: false, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 10),
                  // Standard / Custom toggle
                  Row(
                    children: [
                      _sizeToggleChip(
                        label: isEn ? '✔ Standard size' : '✔ Standaardmaat',
                        selected: provider.deurStandaardMaat,
                        onTap: () { provider.setDeurStandaardMaat(true); ss(() {}); },
                      ),
                      const SizedBox(width: 10),
                      _sizeToggleChip(
                        label: isEn ? '✏ Custom size' : '✏ Op maat',
                        selected: !provider.deurStandaardMaat,
                        onTap: () { provider.setDeurStandaardMaat(false); ss(() {}); },
                      ),
                    ],
                  ),
                  if (!provider.deurStandaardMaat) ...[
                    const SizedBox(height: 12),
                    _dimensionRow(
                      label: isEn ? 'Height (cm)' : 'Hoogte (cm)',
                      value: (provider.deurHoogte * 100).round(),
                      min: 170, max: 260,
                      onChanged: (v) { provider.setDeurHoogte(v / 100); ss(() {}); },
                    ),
                    const SizedBox(height: 8),
                    _dimensionRow(
                      label: isEn ? 'Width (cm)' : 'Breedte (cm)',
                      value: (provider.deurBreedte * 100).round(),
                      min: 55, max: 120,
                      onChanged: (v) { provider.setDeurBreedte(v / 100); ss(() {}); },
                    ),
                    const SizedBox(height: 8),
                    _dimensionRow(
                      label: isEn ? 'Thickness (cm)' : 'Dikte (cm)',
                      value: (provider.deurDikte * 100).round(),
                      min: 3, max: 8,
                      onChanged: (v) { provider.setDeurDikte(v / 100); ss(() {}); },
                    ),
                  ] else ...[
                    const SizedBox(height: 8),
                    Text(
                      isEn
                          ? '📏 H: 201.5 cm  ·  W: 83 cm  ·  T: 4 cm'
                          : '📏 H: 201,5 cm  ·  B: 83 cm  ·  D: 4 cm',
                      style: Utils.getTextStyle(baseSize: 12, isBold: false, color: Utils.kDarkBlue),
                    ),
                  ],
                ],
              ),
            ),

            // ── Aantal deuren ────────────────────────────────────────────────
            _CustomIntegerInputField(
              key: const ValueKey('deur_count'),
              label: isEn ? 'Number of doors' : 'Aantal deuren',
              initialValue: provider.customCount,
              onChanged: (v) {
                provider.setCustomCount(v);
                ss(() {});
              },
            ),

            const SizedBox(height: 8),

            // ── Live price breakdown ─────────────────────────────────────────
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 4, bottom: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Utils.kDarkBlue.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Utils.kDarkBlue.withValues(alpha: 0.15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calculate_outlined,
                        color: Utils.kOrange,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isEn ? 'Price overview (material estimate)' : 'Prijsoverzicht (materiaalraming)',
                        style: Utils.getTextStyle(
                          baseSize: 13,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Show each material item from the itemized list
                  ...provider.materials.map((item) {
                    final name = isEn
                        ? (item['nameEn'] as String? ?? item['name'] as String? ?? '')
                        : (item['name'] as String? ?? '');
                    final qty = isEn
                        ? (item['qtyEn'] as String? ?? item['qty'] as String? ?? '')
                        : (item['qty'] as String? ?? '');
                    final price = item['price'] as String? ?? '';
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$name ($qty)',
                              style: Utils.getTextStyle(
                                baseSize: 11,
                                isBold: false,
                                color: Utils.kDarkBlue.withValues(alpha: 0.75),
                              ),
                            ),
                          ),
                          Text(
                            price,
                            style: Utils.getTextStyle(
                              baseSize: 11,
                              isBold: true,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  if (provider.deurLocatie == 'Buiten')
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        isEn
                            ? '⚠ Exterior door — includes weather-resistant hardware & waterproof sealant'
                            : '⚠ Buitendeur — inclusief weerbestendig hang-sluitwerk & waterdichte kit',
                        style: Utils.getTextStyle(
                          baseSize: 10,
                          isBold: false,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEn
                            ? 'Total (${provider.customCount}× door)'
                            : 'Totaal (${provider.customCount}× deur)',
                        style: Utils.getTextStyle(
                          baseSize: 13,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                      Text(
                        '€ ${provider.deurTotalPrijs.toStringAsFixed(2)}',
                        style: Utils.getTextStyle(
                          baseSize: 18,
                          isBold: true,
                          color: Utils.kOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Dynamic materials list ───────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.checklist_rtl_outlined,
                        color: Colors.green.shade700,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isEn ? 'Required materials' : 'Verplichte materialen',
                        style: Utils.getTextStyle(
                          baseSize: 13,
                          isBold: true,
                          color: Colors.green.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: materials
                        .map(
                          (m) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.green.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              m,
                              style: Utils.getTextStyle(
                                baseSize: 11,
                                isBold: false,
                                color: Colors.green.shade900,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── BEREKEN button ───────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Utils.kOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.calculate_outlined),
                label: Text(
                  isEn ? 'CALCULATE →' : 'BEREKEN →',
                  style: Utils.getTextStyle(
                    baseSize: 15,
                    isBold: true,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  provider.calculateFromCustomInputs();
                  provider.nextStep(ctx);
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

/// Selectable chip for door size toggle (standard / custom).
Widget _sizeToggleChip({
  required String label,
  required bool selected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Utils.kOrange : Colors.transparent,
        border: Border.all(
          color: selected ? Utils.kOrange : Utils.kDarkBlue.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Utils.getTextStyle(
          baseSize: 12,
          isBold: selected,
          color: selected ? Colors.white : Utils.kDarkBlue,
        ),
      ),
    ),
  );
}

/// A labeled stepper row for door dimension inputs (height, width, thickness).
Widget _dimensionRow({
  required String label,
  required int value,
  required int min,
  required int max,
  required ValueChanged<int> onChanged,
}) {
  return Row(
    children: [
      SizedBox(
        width: 110,
        child: Text(
          label,
          style: Utils.getTextStyle(baseSize: 12, isBold: false, color: Utils.kDarkBlue),
        ),
      ),
      IconButton(
        icon: const Icon(Icons.remove_circle_outline, size: 20),
        color: Utils.kOrange,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: value > min ? () => onChanged(value - 1) : null,
      ),
      const SizedBox(width: 6),
      Container(
        width: 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.25)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '$value',
          style: Utils.getTextStyle(baseSize: 13, isBold: true, color: Utils.kDarkBlue),
        ),
      ),
      const SizedBox(width: 6),
      IconButton(
        icon: const Icon(Icons.add_circle_outline, size: 20),
        color: Utils.kOrange,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: value < max ? () => onChanged(value + 1) : null,
      ),
      const SizedBox(width: 4),
      Text(
        'cm',
        style: Utils.getTextStyle(baseSize: 11, isBold: false, color: Colors.grey.shade500),
      ),
    ],
  );
}



class _CustomIntegerInputField extends StatefulWidget {
  final String label;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const _CustomIntegerInputField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<_CustomIntegerInputField> createState() =>
      _CustomIntegerInputFieldState();
}

class _CustomIntegerInputFieldState extends State<_CustomIntegerInputField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue > 0 ? widget.initialValue.toString() : '1',
    );
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      if (_controller.text.isNotEmpty) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      }
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Utils.getTextStyle(
              baseSize: 13,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(12),
              color: Utils.kDarkBlue.withValues(alpha: 0.03),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: Utils.kOrange,
                  onPressed: () {
                    final cur = int.tryParse(_controller.text) ?? 1;
                    if (cur > 1) {
                      final newVal = cur - 1;
                      _controller.text = newVal.toString();
                      widget.onChanged(newVal);
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (val) {
                      final parsed = int.tryParse(val) ?? 1;
                      widget.onChanged(parsed);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Utils.kOrange,
                  onPressed: () {
                    final cur = int.tryParse(_controller.text) ?? 1;
                    final newVal = cur + 1;
                    _controller.text = newVal.toString();
                    widget.onChanged(newVal);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}