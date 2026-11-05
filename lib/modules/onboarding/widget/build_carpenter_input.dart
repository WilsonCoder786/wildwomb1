import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Step-4 view for carpenter sub-jobs that do NOT need an m² area calculation
/// and are neither staircase (BuildSetupCustomInput) nor door (BuildStepDeurPlaatsen).
///
/// Currently this covers: Plinten monteren / Skirting board installation.
/// It reads [OnboardingProvider.customInputConfig] to render the correct fields
/// dynamically, so any future no-area carpenter job is handled automatically.
class BuildCarpenterInput extends StatefulWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildCarpenterInput({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  State<BuildCarpenterInput> createState() => _BuildCarpenterInputState();
}

class _BuildCarpenterInputState extends State<BuildCarpenterInput> {
  final Map<String, TextEditingController> _controllers = {};

  OnboardingProvider get p => widget.provider;
  AppLocalizations get l10n => widget.l10n;
  bool get _isEn => l10n.localeName.startsWith('en');

  String get _job =>
      p.selectedSpecificJobs.isNotEmpty ? p.selectedSpecificJobs.first : '';

  bool get _isPlint =>
      _job.contains('Plint') ||
      _job.contains('plint') ||
      _job.contains('Skirting board') ||
      _job.contains('Skirting');

  // ── header texts ────────────────────────────────────────────────────────────

  String get _headerTitle {
    if (_isPlint) {
      return _isEn
          ? 'Skirting board installation — Details'
          : 'Plinten monteren — Details';
    }
    return _isEn ? 'Carpenter work — Details' : 'Timmerman werk — Details';
  }

  String get _headerSubtitle {
    if (_isPlint) {
      return _isEn
          ? 'Enter the total perimeter (running metres) and select the skirting type.'
          : 'Voer de totale omtrek (loopmeters) in en kies het type plint.';
    }
    return _isEn
        ? 'Fill in the dimensions below for an accurate calculation.'
        : 'Vul de afmetingen hieronder in voor een nauwkeurige berekening.';
  }

  // ── lifecycle ───────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    // Seed the controllers from the current provider values
    for (final field in p.customInputConfig) {
      final key = field['key'] as String;
      final type = field['type'] as String;
      final value = field['value'];
      if (type == 'integer') {
        _controllers[key] = TextEditingController(
          text: (value as int? ?? 0) > 0 ? '$value' : '1',
        );
      } else if (type == 'decimal') {
        final d = (value as double?) ?? 0.0;
        _controllers[key] = TextEditingController(
          text: d > 0 ? d.toStringAsFixed(1) : '',
        );
      }
    }
    // Ensure sensible defaults
    if (p.customLength <= 0) p.setCustomLength(12.0);
    if (p.customCount <= 0) p.setCustomCount(1);
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  // ── estimated cost ──────────────────────────────────────────────────────────

  String _estimateCostText() {
    if (_isPlint) {
      final meters = p.customLength > 0 ? p.customLength : 12.0;
      if (p.isPlakplinten) {
        // Document 2 – Klus 3: Standaard app-rekenmateriaal per meter: €10 C / €7 P
        final cost = meters * 10.0;
        return '± €${cost.toStringAsFixed(2)}';
      }
      final int mInt = meters.ceil();
      final tubesKit = (mInt / 10).ceil();
      final dozenSchroeven = (mInt / 25).ceil();
      final setsPluggen = (mInt / 25).ceil();
      final tubesAcrylaat = (mInt / 15).ceil();
      final stuksProfiel = (mInt / 5).ceil();
      final cost = (mInt * 8.00) +
          (tubesKit * 8.50) +
          (dozenSchroeven * 5.50) +
          (setsPluggen * 3.50) +
          (tubesAcrylaat * 3.50) +
          (stuksProfiel * 3.50) +
          5.00 +
          12.50;
      return '± €${cost.toStringAsFixed(2)}';
    }
    return '';
  }

  // ── build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final config = p.customInputConfig;

    return StatefulBuilder(
      builder: (ctx, ss) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── Header ────────────────────────────────────────────────────────
            Text(
              _headerTitle,
              style: Utils.getTextStyle(
                baseSize: 20,
                isBold: true,
                color: Utils.kDarkBlue,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _headerSubtitle,
              style: Utils.getTextStyle(
                baseSize: 13,
                isBold: false,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),

            // ── Dynamic input card ────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Utils.kDarkBlue.withValues(alpha: 0.15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: config.map((field) {
                  final key = field['key'] as String;
                  final type = field['type'] as String;
                  final label = (_isEn && field['labelEn'] != null)
                      ? field['labelEn'] as String
                      : field['label'] as String;

                  if (type == 'decimal') {
                    final ctrl = _controllers[key] ??
                        TextEditingController(text: '0.00');
                    return _buildDecimalField(
                      label: label,
                      key: key,
                      controller: ctrl,
                      ss: ss,
                    );
                  } else if (type == 'integer') {
                    final ctrl = _controllers[key] ??
                        TextEditingController(text: '1');
                    return _buildIntegerField(
                      label: label,
                      key: key,
                      controller: ctrl,
                      ss: ss,
                    );
                  } else if (type == 'dropdown') {
                    final options = (field['options'] as List).cast<String>();
                    final optionsEn = field['optionsEn'] != null
                        ? (field['optionsEn'] as List).cast<String>()
                        : options;
                    final displayOptions =
                        _isEn ? optionsEn : options;
                    final currentValue = field['value'] as String? ?? options.first;
                    return _buildDropdownField(
                      label: label,
                      key: key,
                      options: options,
                      displayOptions: displayOptions,
                      currentValue: currentValue,
                      ss: ss,
                    );
                  }
                  return const SizedBox.shrink();
                }).toList(),
              ),
            ),

            // ── Plinten type selector (Plakplint / Voorzetplint / Hoge plinten) ──
            if (_isPlint) ...[
              const SizedBox(height: 20),
              Text(
                _isEn ? '🪵 Skirting type' : '🪵 Type plint',
                style: Utils.getTextStyle(
                  baseSize: 14,
                  isBold: true,
                  color: Utils.kDarkBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _isEn
                    ? 'Affects tools, fixing method and material cost.'
                    : 'Bepaalt gereedschap, bevestigingsmethode en materiaalkosten.',
                style: Utils.getTextStyle(
                  baseSize: 11,
                  isBold: false,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _plintTypeChip(
                    nlLabel: 'Plakplint',
                    enLabel: 'Self-adhesive (Plakplint)',
                    hint: _isEn
                        ? 'Glued directly — no drilling needed'
                        : 'Gelijmd direct — geen boren nodig',
                    value: 'plakplinten',
                    ss: ss,
                  ),
                  _plintTypeChip(
                    nlLabel: 'Voorzetplint',
                    enLabel: 'Clip-on / Glue (Voorzetplint)',
                    hint: _isEn
                        ? 'Glued or clipped over existing skirting'
                        : 'Gelijmd of geklipt over bestaande plint',
                    value: 'hoge_plinten_lijm',
                    ss: ss,
                  ),
                  _plintTypeChip(
                    nlLabel: 'Hoge plint (schroeven)',
                    enLabel: 'High skirting (screwed)',
                    hint: _isEn
                        ? 'Fixed with screws — for high or heavy boards'
                        : 'Vastgeschroefd — voor hoge of zware plinten',
                    value: 'hoge_plinten_schroeven',
                    ss: ss,
                  ),
                ],
              ),
            ],

            if (_isPlint) ...[
              const SizedBox(height: 16),
              Text(
                _isEn ? 'Quick-pick total length:' : 'Snel kiezen totale lengte:',
                style: Utils.getTextStyle(
                  baseSize: 12,
                  isBold: true,
                  color: Utils.kDarkBlue,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [8.0, 10.0, 12.0, 15.0, 18.0, 20.0, 25.0, 30.0]
                    .map((m) {
                  final isSel = (p.customLength - m).abs() < 0.01;
                  return GestureDetector(
                    onTap: () {
                      p.setCustomLength(m);
                      _controllers['length']?.text = m.toStringAsFixed(1);
                      ss(() {});
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 160),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSel
                            ? Utils.kOrange.withValues(alpha: 0.12)
                            : Colors.grey.shade100,
                        border: Border.all(
                          color:
                              isSel ? Utils.kOrange : Colors.grey.shade300,
                          width: isSel ? 1.8 : 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSel)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                Icons.check_circle,
                                size: 14,
                                color: Utils.kOrange,
                              ),
                            ),
                          Text(
                            '${m.toStringAsFixed(0)} m',
                            style: Utils.getTextStyle(
                              baseSize: 12,
                              isBold: isSel,
                              color: isSel ? Utils.kOrange : Utils.kDarkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],

            const SizedBox(height: 20),

            // ── Live cost estimate ────────────────────────────────────────────
            if (_estimateCostText().isNotEmpty) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Utils.kDarkBlue.withValues(alpha: 0.06),
                      Utils.kDarkBlue.withValues(alpha: 0.02),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Utils.kDarkBlue.withValues(alpha: 0.18),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Utils.kOrange.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.euro_outlined,
                        color: Utils.kOrange,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isEn
                                ? 'Estimated material cost'
                                : 'Geschatte materiaalkosten',
                            style: Utils.getTextStyle(
                              baseSize: 11,
                              isBold: false,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _estimateCostText(),
                            style: Utils.getTextStyle(
                              baseSize: 18,
                              isBold: true,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            // ── Info note ─────────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Colors.green.withValues(alpha: 0.25)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Colors.green, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _isEn
                          ? 'Based on standard Dutch trade dimensions. Cutting waste and fixing materials included.'
                          : 'Op basis van Nederlandse handelsmaten. Snijverlies en bevestigingsmateriaal inbegrepen.',
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: false,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── CALCULATE button ──────────────────────────────────────────────
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
                  _isEn ? 'CALCULATE \u2192' : 'BEREKEN \u2192',
                  style: Utils.getTextStyle(
                    baseSize: 15,
                    isBold: true,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  p.calculateFromCustomInputs();
                  p.nextStep(ctx);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  // ── field builders ───────────────────────────────────────────────────────────

  Widget _buildDecimalField({
    required String label,
    required String key,
    required TextEditingController controller,
    required StateSetter ss,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Utils.getTextStyle(
              baseSize: 13,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(12),
              color: Utils.kDarkBlue.withValues(alpha: 0.03),
            ),
            child: TextField(
              controller: controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              textAlign: TextAlign.center,
              style: Utils.getTextStyle(
                baseSize: 18,
                isBold: true,
                color: Utils.kDarkBlue,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: InputBorder.none,
                hintText: '0.0',
                suffixText: 'm',
                suffixStyle: const TextStyle(
                  color: Color(0xFFE65100),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: (v) {
                final d = double.tryParse(v.replaceAll(',', '.')) ?? 0.0;
                if (key == 'length') {
                  p.setCustomLength(d);
                } else if (key == 'height') {
                  p.setCustomHeight(d);
                } else if (key == 'depth') {
                  p.setCustomDepth(d);
                }
                ss(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntegerField({
    required String label,
    required String key,
    required TextEditingController controller,
    required StateSetter ss,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Utils.getTextStyle(
              baseSize: 13,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _StepBtn(
                icon: Icons.remove,
                onTap: () {
                  final cur = int.tryParse(controller.text) ?? 1;
                  if (cur > 1) {
                    controller.text = '${cur - 1}';
                    p.setCustomCount(cur - 1);
                    ss(() {});
                  }
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Utils.kDarkBlue.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Utils.kDarkBlue.withValues(alpha: 0.03),
                  ),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textAlign: TextAlign.center,
                    style: Utils.getTextStyle(
                      baseSize: 18,
                      isBold: true,
                      color: Utils.kDarkBlue,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: InputBorder.none,
                      hintText: '1',
                      suffixText: _isEn ? 'rooms' : 'kamers',
                      suffixStyle: const TextStyle(
                        color: Color(0xFFE65100),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (v) {
                      final n = int.tryParse(v) ?? 1;
                      p.setCustomCount(n > 0 ? n : 1);
                      ss(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _StepBtn(
                icon: Icons.add,
                onTap: () {
                  final cur = int.tryParse(controller.text) ?? 1;
                  controller.text = '${cur + 1}';
                  p.setCustomCount(cur + 1);
                  ss(() {});
                },
                filled: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String key,
    required List<String> options,
    required List<String> displayOptions,
    required String currentValue,
    required StateSetter ss,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Utils.getTextStyle(
              baseSize: 13,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(options.length, (i) {
              final isSel = options[i] == currentValue;
              final display =
                  i < displayOptions.length ? displayOptions[i] : options[i];
              return GestureDetector(
                onTap: () {
                  p.setCustomMaterial(options[i]);
                  ss(() {});
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: isSel
                        ? Utils.kOrange.withValues(alpha: 0.12)
                        : Colors.grey.shade50,
                    border: Border.all(
                      color: isSel ? Utils.kOrange : Colors.grey.shade300,
                      width: isSel ? 1.8 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSel)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.check_circle,
                            size: 15,
                            color: Utils.kOrange,
                          ),
                        ),
                      Text(
                        display,
                        style: Utils.getTextStyle(
                          baseSize: 12,
                          isBold: isSel,
                          color: isSel ? Utils.kOrange : Utils.kDarkBlue,
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

  // ── Plint type chip helper ───────────────────────────────────────────────

  Widget _plintTypeChip({
    required String nlLabel,
    required String enLabel,
    required String hint,
    required String value,
    required StateSetter ss,
  }) {
    final isSel = p.plintenType == value;
    final label = _isEn ? enLabel : nlLabel;
    return GestureDetector(
      onTap: () {
        p.setPlintenType(value);
        ss(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSel
              ? Utils.kOrange.withValues(alpha: 0.12)
              : Colors.grey.shade50,
          border: Border.all(
            color: isSel ? Utils.kOrange : Colors.grey.shade300,
            width: isSel ? 2.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSel)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Icon(Icons.check_circle, color: Utils.kOrange, size: 15),
                  ),
                Text(
                  label,
                  style: Utils.getTextStyle(
                    baseSize: 13,
                    isBold: isSel,
                    color: isSel ? Utils.kOrange : Utils.kDarkBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              hint,
              style: Utils.getTextStyle(
                baseSize: 10,
                isBold: false,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Private helpers ─────────────────────────────────────────────────────────

class _StepBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  const _StepBtn({required this.icon, required this.onTap, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: filled ? Utils.kOrange : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 20,
          color: filled ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
