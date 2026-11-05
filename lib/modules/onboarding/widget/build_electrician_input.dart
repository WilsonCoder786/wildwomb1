import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Step-4 view shown specifically when [OnboardingProvider.selectedJobId] is
/// 'electrician'. Renders the correct quantity / length input for each
/// electrician sub-job and provides a live cost-estimate card.
class BuildElectricianInput extends StatefulWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildElectricianInput({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  State<BuildElectricianInput> createState() => _BuildElectricianInputState();
}

class _BuildElectricianInputState extends State<BuildElectricianInput> {
  late TextEditingController _countController;
  late TextEditingController _lengthController;

  OnboardingProvider get p => widget.provider;
  AppLocalizations get l10n => widget.l10n;

  bool get _isEn => l10n.localeName.startsWith('en');

  String get _job =>
      p.selectedSpecificJobs.isNotEmpty ? p.selectedSpecificJobs.first : '';

  bool get _isStopcontact =>
      _job.contains('Stopcontact') || _job.contains('Outlet');
  bool get _isVerlichting =>
      _job.contains('Verlichting') ||
      _job.contains('Lamp') ||
      _job.contains('Lighting');
  bool get _isStroomleiding =>
      _job.contains('Stroomleiding') || _job.contains('Cable laying');
  bool get _isKabelgoot =>
      _job.contains('Kabelgoot') || _job.contains('Cable trunking');
  bool get _isRookmelder =>
      _job.contains('Rookmelder') || _job.contains('Smoke');

  /// true -> count input (integer); false -> length input (decimal metres)
  bool get _isCountJob => _isStopcontact || _isVerlichting || _isRookmelder;

  @override
  void initState() {
    super.initState();
    _countController = TextEditingController(
      text: p.customCount > 0 ? '${p.customCount}' : '1',
    );
    _lengthController = TextEditingController(
      text: p.customLength > 0 ? p.customLength.toStringAsFixed(1) : '5.0',
    );
    if (p.customCount <= 0) p.setCustomCount(1);
    if (p.customLength <= 0) p.setCustomLength(5.0);
  }

  @override
  void dispose() {
    _countController.dispose();
    _lengthController.dispose();
    super.dispose();
  }

  // ── labels ─────────────────────────────────────────────────────────────────

  String get _headerTitle {
    if (_isStopcontact) {
      return _isEn
          ? 'Outlet installation — Details'
          : 'Stopcontact plaatsen — Details';
    } else if (_isVerlichting) {
      return _isEn
          ? 'Lighting installation — Details'
          : 'Verlichting plaatsen — Details';
    } else if (_isStroomleiding) {
      return _isEn
          ? 'Cable laying — Details'
          : 'Stroomleiding leggen — Details';
    } else if (_isKabelgoot) {
      return _isEn
          ? 'Cable trunking — Details'
          : 'Kabelgoot monteren — Details';
    } else if (_isRookmelder) {
      return _isEn
          ? 'Smoke detector installation — Details'
          : 'Rookmelder plaatsen — Details';
    }
    return _isEn ? 'Electrical work — Details' : 'Elektra — Details';
  }

  String get _headerSubtitle {
    if (_isStopcontact) {
      return _isEn
          ? 'How many outlets do you want to install? Each includes cable, back box & cover plate.'
          : 'Hoeveel stopcontacten wil je plaatsen? Per stuk inclusief kabel, inbouwdoos en afdekplaat.';
    } else if (_isVerlichting) {
      return _isEn
          ? 'How many light fixtures do you want to install?'
          : 'Hoeveel lampen / armaturen wil je plaatsen?';
    } else if (_isStroomleiding) {
      return _isEn
          ? 'Enter the total cable run length in metres.'
          : 'Voer de totale leidinglengte in meters in.';
    } else if (_isKabelgoot) {
      return _isEn
          ? 'Enter the total cable trunking length in metres.'
          : 'Voer de totale lengte van de kabelgoot in meters in.';
    } else if (_isRookmelder) {
      return _isEn
          ? 'How many smoke detectors do you want to install?'
          : 'Hoeveel rookmelders wil je plaatsen?';
    }
    return _isEn ? 'Enter the details below.' : 'Vul de gegevens hieronder in.';
  }

  String get _inputLabel {
    if (_isCountJob) {
      if (_isStopcontact) {
        return _isEn ? 'Number of outlets' : 'Aantal stopcontacten';
      }
      if (_isVerlichting) {
        return _isEn ? 'Number of fixtures' : 'Aantal armaturen';
      }
      if (_isRookmelder) {
        return _isEn ? 'Number of detectors' : 'Aantal rookmelders';
      }
      return _isEn ? 'Quantity' : 'Aantal';
    } else {
      if (_isStroomleiding) {
        return _isEn ? 'Cable run length (m)' : 'Leidinglengte (m)';
      }
      if (_isKabelgoot) {
        return _isEn ? 'Trunking length (m)' : 'Lengte kabelgoot (m)';
      }
      return _isEn ? 'Length (m)' : 'Lengte (m)';
    }
  }

  String _estimateCostText() {
    if (_isStopcontact) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 20.00).toStringAsFixed(2)}';
    } else if (_isVerlichting) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 86.00).toStringAsFixed(2)}';
    } else if (_isStroomleiding) {
      final m = p.customLength > 0 ? p.customLength : 5.0;
      return '± €${(m * 3.50).toStringAsFixed(2)}';
    } else if (_isKabelgoot) {
      final m = p.customLength > 0 ? p.customLength : 3.0;
      return '± €${(m * 4.00).toStringAsFixed(2)}';
    } else if (_isRookmelder) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 25.50).toStringAsFixed(2)}';
    }
    return '';
  }

  // ── build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (ctx, ss) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── Header ──────────────────────────────────────────────────────
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

            // ── Input card ──────────────────────────────────────────────────
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
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.electrical_services,
                          color: Color(0xFFE65100),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _inputLabel,
                          style: Utils.getTextStyle(
                            baseSize: 14,
                            isBold: true,
                            color: Utils.kDarkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  if (_isCountJob) ...[
                    // ── Count stepper ────────────────────────────────────────
                    Row(
                      children: [
                        _StepperButton(
                          icon: Icons.remove,
                          onTap: () {
                            final cur = p.customCount;
                            if (cur > 1) {
                              p.setCustomCount(cur - 1);
                              _countController.text = '${cur - 1}';
                              ss(() {});
                            }
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _DecimalField(
                            controller: _countController,
                            suffix: _isEn ? 'pcs' : 'st',
                            isInteger: true,
                            onChanged: (v) {
                              final n = int.tryParse(v) ?? 1;
                              p.setCustomCount(n > 0 ? n : 1);
                              ss(() {});
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        _StepperButton(
                          icon: Icons.add,
                          onTap: () {
                            final cur = p.customCount;
                            p.setCustomCount(cur + 1);
                            _countController.text = '${cur + 1}';
                            ss(() {});
                          },
                          filled: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [1, 2, 3, 4, 5, 6, 8, 10].map((n) {
                        final isSel = p.customCount == n;
                        return GestureDetector(
                          onTap: () {
                            p.setCustomCount(n);
                            _countController.text = '$n';
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
                                color: isSel
                                    ? Utils.kOrange
                                    : Colors.grey.shade300,
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
                                  '$n ${_isEn ? (n == 1 ? "pc" : "pcs") : "st"}',
                                  style: Utils.getTextStyle(
                                    baseSize: 12,
                                    isBold: isSel,
                                    color: isSel
                                        ? Utils.kOrange
                                        : Utils.kDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ] else ...[
                    // ── Length input ─────────────────────────────────────────
                    _DecimalField(
                      controller: _lengthController,
                      suffix: 'm',
                      isInteger: false,
                      onChanged: (v) {
                        final d =
                            double.tryParse(v.replaceAll(',', '.')) ?? 0.0;
                        p.setCustomLength(d);
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [3.0, 5.0, 8.0, 10.0, 15.0, 20.0].map((m) {
                        final isSel = (p.customLength - m).abs() < 0.01;
                        return GestureDetector(
                          onTap: () {
                            p.setCustomLength(m);
                            _lengthController.text = m.toStringAsFixed(1);
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
                                color: isSel
                                    ? Utils.kOrange
                                    : Colors.grey.shade300,
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
                                    color: isSel
                                        ? Utils.kOrange
                                        : Utils.kDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ── Live cost-estimate badge ────────────────────────────────────
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

            // ── Info note ──────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withValues(alpha: 0.25)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Colors.green, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _isEn
                          ? 'Based on standard installation. Exact quote depends on cable routing and local conditions.'
                          : 'Op basis van standaard installatie. Exacte offerte afhankelijk van kabelroute en lokale situatie.',
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

            // ── CALCULATE button ───────────────────────────────────────────
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
}

// ── Private helper widgets ─────────────────────────────────────────────────

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  const _StepperButton({
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

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

class _DecimalField extends StatelessWidget {
  final TextEditingController controller;
  final String suffix;
  final bool isInteger;
  final ValueChanged<String> onChanged;
  const _DecimalField({
    required this.controller,
    required this.suffix,
    required this.isInteger,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
        color: Utils.kDarkBlue.withValues(alpha: 0.03),
      ),
      child: TextField(
        controller: controller,
        keyboardType: isInteger
            ? TextInputType.number
            : const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: isInteger
            ? [FilteringTextInputFormatter.digitsOnly]
            : [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
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
          hintText: isInteger ? '1' : '0.00',
          suffixText: suffix,
          suffixStyle: const TextStyle(
            color: Color(0xFFE65100),
            fontWeight: FontWeight.bold,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
