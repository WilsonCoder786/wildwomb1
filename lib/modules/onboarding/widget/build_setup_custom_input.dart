import 'package:easy_four_diy/core/services/onboarding_data_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildSetupCustomInput extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildSetupCustomInput({
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
            final qty = (item['qtyEn'] != null && isEn)
                ? item['qtyEn'] as String
                : item['qty'] as String;
            materials.add('$name ($qty)');
          }
        }

        final int treads = provider.trapAantalTreden;
        final double treadDepth = provider.trapTredeDiepte;
        final double riserHeight = provider.trapStootbordHoogte;
        final double width = provider.trapBreedte;
        final double treadsM2 = provider.trapTredenOppervlakte;
        final double risersM2 = provider.trapStootbordenOppervlakte;
        final double netM2 = provider.trapNettoOppervlakte;
        final double totalM2 = provider.trapTotaalOppervlakte;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── Header ──────────────────────────────────────────────────────
            Text(
              isEn
                  ? 'Staircase Covering — Details'
                  : 'Trap bekleden — Afmetingen & Specificaties',
              style: Utils.getTextStyle(
                baseSize: 20,
                isBold: true,
                color: Utils.kDarkBlue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isEn
                  ? 'A staircase is not a flat floor. Enter the treads and dimensions for an exact calculation.'
                  : 'Een trap is geen vlakke vloer. Vul hieronder de treden en afmetingen in voor een exacte berekening.',
              style: Utils.getTextStyle(
                baseSize: 13,
                isBold: false,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // ── Step 1: Number of Treads (Aantal treden) ───────────────────────
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Container(
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
                        const Text('🪜', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            isEn
                                ? 'Step 1: Number of treads'
                                : 'Stap 1: Aantal treden',
                            style: Utils.getTextStyle(
                              baseSize: 14,
                              isBold: true,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                        ),
                        // Quick Stepper
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              color: treads > 1
                                  ? Utils.kOrange
                                  : Colors.grey.shade400,
                              onPressed: treads > 1
                                  ? () {
                                      provider.setTrapAantalTreden(treads - 1);
                                      ss(() {});
                                    }
                                  : null,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Utils.kOrange.withValues(alpha: 0.10),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Utils.kOrange.withValues(alpha: 0.4),
                                ),
                              ),
                              child: Text(
                                '$treads',
                                style: Utils.getTextStyle(
                                  baseSize: 16,
                                  isBold: true,
                                  color: Utils.kOrange,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              color: Utils.kOrange,
                              onPressed: () {
                                provider.setTrapAantalTreden(treads + 1);
                                ss(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEn
                          ? 'Standard Dutch staircase has 13 to 15 treads (average 14).'
                          : 'Een standaard Nederlandse trap heeft 13 tot 15 treden (gemiddeld 14).',
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: false,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      children: OnboardingDataService
                          .instance
                          .staircaseTreadQuickChoices
                          .map((count) {
                            final isSel = treads == count;
                            return ChoiceChip(
                              label: Text(
                                '$count ${isEn ? 'treads' : 'treden'}',
                              ),
                              selected: isSel,
                              selectedColor: Utils.kOrange.withValues(
                                alpha: 0.18,
                              ),
                              labelStyle: Utils.getTextStyle(
                                baseSize: 11,
                                isBold: isSel,
                                color: isSel ? Utils.kOrange : Utils.kDarkBlue,
                              ),
                              onSelected: (_) {
                                provider.setTrapAantalTreden(count);
                                ss(() {});
                              },
                            );
                          })
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            // ── Step 2: Dimensions (Depth, Height, Width) ──────────────────────
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Container(
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
                        const Text('📐', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            isEn
                                ? 'Step 2: Staircase measurements'
                                : 'Stap 2: Afmetingen per trede & trap',
                            style: Utils.getTextStyle(
                              baseSize: 14,
                              isBold: true,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEn
                          ? 'Enter measurements in meters (e.g. 0.30 m = 30 cm).'
                          : 'Vul de maten in meters in (bijv. 0,30 m = 30 cm).',
                      style: Utils.getTextStyle(
                        baseSize: 11,
                        isBold: false,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Tread Depth
                    _CustomDecimalInputField(
                      key: ValueKey('trap_depth_$treadDepth'),
                      label: isEn
                          ? 'Tread depth (diepte trede)'
                          : 'Diepte trede (m)',
                      initialValue: treadDepth,
                      suffix: 'm',
                      onChanged: (val) {
                        provider.setTrapTredeDiepte(val);
                        ss(() {});
                      },
                    ),

                    // Riser Height
                    _CustomDecimalInputField(
                      key: ValueKey('trap_height_$riserHeight'),
                      label: isEn
                          ? 'Riser height (hoogte stootbord)'
                          : 'Hoogte stootbord (m)',
                      initialValue: riserHeight,
                      suffix: 'm',
                      onChanged: (val) {
                        provider.setTrapStootbordHoogte(val);
                        ss(() {});
                      },
                    ),

                    // Staircase Width
                    _CustomDecimalInputField(
                      key: ValueKey('trap_width_$width'),
                      label: isEn
                          ? 'Staircase width (breedte trap)'
                          : 'Breedte trap (m)',
                      initialValue: width,
                      suffix: 'm',
                      onChanged: (val) {
                        provider.setTrapBreedte(val);
                        ss(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ── Step 3: Staircase Type (Dicht vs Open) ─────────────────────────
            chipGroup(
              sectionLabel: 'Stap 3: Type trapconstructie',
              sectionLabelEn: 'Step 3: Staircase construction type',
              sectionIcon: '🏗️',
              hint:
                  'Dichte trap = treden + stootborden  •  Open trap = alleen bovenzijde treden',
              hintEn:
                  'Closed = treads + risers  •  Open = treads only (no risers)',
              options: OnboardingDataService.instance.uiStaircaseTypes,
              optionsEn: ['Closed (with risers)', 'Open (without risers)'],
              selected: provider.trapType,
              onSelected: (v) {
                provider.setTrapType(v);
                ss(() {});
              },
            ),

            // ── Step 4: Covering Material ────────────────────────────────────
            chipGroup(
              sectionLabel: 'Stap 4: Type bekleding',
              sectionLabelEn: 'Step 4: Covering material',
              sectionIcon: '✨',
              hint:
                  'Tapijt = warm & geluiddempend  •  PVC/Vinyl = slijtvast & strak  •  Overzettreden = luxe houtlook',
              hintEn:
                  'Carpet = warm & sound absorbing  •  PVC/Vinyl = durable  •  Step covers = luxury wood/laminate look',
              options:
                  OnboardingDataService.instance.uiStaircaseCoveringMaterials,
              optionsEn: [
                'Carpet',
                'PVC / Vinyl',
                'Step covers (wood/laminate)',
              ],
              selected: provider.trapBekledingType,
              onSelected: (v) {
                provider.setTrapBekledingType(v);
                ss(() {});
              },
            ),

            // ── Cutting Waste Reserve Toggle ─────────────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withValues(alpha: 0.25)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isEn
                              ? '+10% Cutting loss (recommended)'
                              : '+10% snijverlies (aanbevolen)',
                          style: Utils.getTextStyle(
                            baseSize: 13,
                            isBold: true,
                            color: Colors.green.shade800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isEn
                              ? 'Accounts for angled cuts, landings, and nosing tuck-ins.'
                              : 'Vangt schuine treden, draaiingen en trapneuzen netjes op.',
                          style: Utils.getTextStyle(
                            baseSize: 11,
                            isBold: false,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: provider.trapInclusiefSnijverlies,
                    activeThumbColor: Colors.green.shade700,
                    onChanged: (v) {
                      provider.setTrapInclusiefSnijverlies(v);
                      ss(() {});
                    },
                  ),
                ],
              ),
            ),

            // ── Real-Time Calculation & Breakdown Card ───────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Utils.kDarkBlue.withValues(alpha: 0.05),
                    Utils.kDarkBlue.withValues(alpha: 0.02),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Utils.kDarkBlue.withValues(alpha: 0.20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.analytics_outlined,
                        color: Utils.kDarkBlue,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isEn
                            ? 'Geometric Surface Area Breakdown'
                            : 'Oppervlakte & Maatberekening',
                        style: Utils.getTextStyle(
                          baseSize: 14,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEn
                            ? 'Treads ($treads × ${treadDepth.toStringAsFixed(2)}m × ${width.toStringAsFixed(2)}m):'
                            : 'Treden ($treads × ${treadDepth.toStringAsFixed(2)}m × ${width.toStringAsFixed(2)}m):',
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: false,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '${treadsM2.toStringAsFixed(2)} m²',
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.isTrapDicht
                            ? (isEn
                                  ? 'Risers ($treads × ${riserHeight.toStringAsFixed(2)}m × ${width.toStringAsFixed(2)}m):'
                                  : 'Stootborden ($treads × ${riserHeight.toStringAsFixed(2)}m × ${width.toStringAsFixed(2)}m):')
                            : (isEn
                                  ? 'Risers (open staircase):'
                                  : 'Stootborden (open trap):'),
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: false,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        provider.isTrapDicht
                            ? '${risersM2.toStringAsFixed(2)} m²'
                            : '0.00 m²',
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEn
                            ? 'Net surface area:'
                            : 'Totale netto oppervlakte:',
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                      Text(
                        '${netM2.toStringAsFixed(2)} m²',
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: true,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEn
                            ? 'Total with 10% cutting loss:'
                            : 'Totaal incl. 10% snijverlies:',
                        style: Utils.getTextStyle(
                          baseSize: 13,
                          isBold: true,
                          color: Utils.kOrange,
                        ),
                      ),
                      Text(
                        '${totalM2.toStringAsFixed(2)} m²',
                        style: Utils.getTextStyle(
                          baseSize: 14,
                          isBold: true,
                          color: Utils.kOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Live Materials Overview Chips ────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.green.withValues(alpha: 0.25)),
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
                        isEn
                            ? 'Dynamically calculated materials'
                            : 'Berekende benodigde materialen',
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

class _CustomDecimalInputField extends StatefulWidget {
  final String label;
  final double initialValue;
  final String suffix;
  final ValueChanged<double> onChanged;

  const _CustomDecimalInputField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.suffix,
    required this.onChanged,
  });

  @override
  State<_CustomDecimalInputField> createState() =>
      _CustomDecimalInputFieldState();
}

class _CustomDecimalInputFieldState extends State<_CustomDecimalInputField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final initialText = widget.initialValue > 0
        ? widget.initialValue.toStringAsFixed(2)
        : '';
    _controller = TextEditingController(text: initialText);
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
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                _SingleDecimalSeparatorFormatter(),
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: InputBorder.none,
                hintText: '0.00',
                suffixText: widget.suffix,
                suffixStyle: TextStyle(
                  color: Utils.kOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: (val) {
                final trimmed = val.trim();
                if (trimmed.isEmpty) {
                  widget.onChanged(0.0);
                  return;
                }
                final parsed =
                    double.tryParse(trimmed.replaceAll(',', '.')) ?? 0.0;
                widget.onChanged(parsed);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleDecimalSeparatorFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    final count = text.split('').where((c) => c == '.' || c == ',').length;
    if (count > 1) {
      return oldValue;
    }
    return newValue;
  }
}
