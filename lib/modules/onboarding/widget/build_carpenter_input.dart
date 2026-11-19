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

  bool get _isDoor =>
      _job.contains('Deur') ||
      _job.contains('Door installation') ||
      _job.contains('Install Door');

  String get _headerTitle {
    if (_isDoor) {
      return _isEn ? 'Door installation — Details' : 'Deur plaatsen — Details';
    }
    if (_isPlint) {
      return _isEn
          ? 'Skirting board installation — Details'
          : 'Plinten monteren — Details';
    }
    return _isEn ? 'Carpenter work — Details' : 'Timmerman werk — Details';
  }

  String get _headerSubtitle {
    if (_isDoor) {
      return _isEn
          ? 'Enter the number of interior doors.'
          : 'Vul het aantal binnendeuren in.';
    }
    if (_isPlint) {
      return _isEn
          ? 'Enter the total length in metres.'
          : 'Voer de totale lengte in meters in.';
    }
    return _isEn
        ? 'Fill in the measurements below.'
        : 'Vul de maten hieronder in.';
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

            const SizedBox(height: 8),

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
            const SizedBox(height: 8),
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
