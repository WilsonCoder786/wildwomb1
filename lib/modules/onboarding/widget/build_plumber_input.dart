import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Step-4 view for all plumber sub-jobs.
///
/// * Count-based: Kraan vervangen, Leiding ontstoppen, Toilet installeren,
///   CV bijvullen — shows a count stepper with quick-pick chips.
/// * Length-based: Leiding aanleggen — shows a length field with
///   quick-pick metre chips.
/// Includes a live cost-estimate card and a CALCULATE button.
class BuildPlumberInput extends StatefulWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildPlumberInput({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  State<BuildPlumberInput> createState() => _BuildPlumberInputState();
}

class _BuildPlumberInputState extends State<BuildPlumberInput> {
  late TextEditingController _countController;
  late TextEditingController _lengthController;

  OnboardingProvider get p => widget.provider;
  AppLocalizations get l10n => widget.l10n;
  bool get _isEn => l10n.localeName.startsWith('en');

  String get _job =>
      p.selectedSpecificJobs.isNotEmpty ? p.selectedSpecificJobs.first : '';

  // ── sub-job detectors ───────────────────────────────────────────────────────
  bool get _isKraan =>
      _job.contains('Kraan') ||
      _job.contains('Keukenkraan') ||
      _job.contains('Tap') ||
      _job.contains('Faucet') ||
      _job.contains('Kitchen tap');
  bool get _isToilet =>
      _job.contains('Toilet') || _job.contains('WC') || _job.contains('toilet');
  bool get _isCV =>
      _job.contains('CV') ||
      _job.contains('CV-installatie') ||
      _job.contains('Central heating') ||
      _job.contains('Refill');
  bool get _isOntstoppen =>
      _job.contains('Ontstoppen') ||
      _job.contains('Afvoer') ||
      _job.contains('Unclog') ||
      _job.contains('Drain') ||
      _job.contains('unblock') ||
      _job.contains('Blockage');
  bool get _isLeiding =>
      _job.contains('Leiding aanleggen') ||
      _job.contains('Waterleiding') ||
      _job.contains('Pipe laying') ||
      _job.contains('Water pipe') ||
      _job.contains('Pipe') ||
      _job.contains('leiding');

  /// true → count stepper; false → length input
  bool get _isCountJob => _isKraan || _isToilet || _isCV || _isOntstoppen;

  // ── texts ───────────────────────────────────────────────────────────────────

  String get _headerTitle {
    if (_isKraan) {
      return _isEn ? 'Tap replacement — Details' : 'Kraan vervangen — Details';
    } else if (_isToilet) {
      return _isEn
          ? 'Toilet installation — Details'
          : 'Toilet installeren — Details';
    } else if (_isCV) {
      return _isEn
          ? 'Central heating refill — Details'
          : 'CV bijvullen — Details';
    } else if (_isOntstoppen) {
      return _isEn
          ? 'Pipe unblocking — Details'
          : 'Leiding ontstoppen — Details';
    } else if (_isLeiding) {
      return _isEn ? 'Pipe laying — Details' : 'Leiding aanleggen — Details';
    }
    return _isEn ? 'Plumbing work — Details' : 'Loodgieterwerk — Details';
  }

  String get _headerSubtitle {
    if (_isKraan) {
      return _isEn
          ? 'How many kitchen taps need replacing? Optional hoses and sealant are added only when needed.'
          : 'Hoeveel keukenkranen moeten worden vervangen? Slangen en kit worden alleen toegevoegd als dat nodig is.';
    } else if (_isToilet) {
      return _isEn
          ? 'How many toilets are being installed? Includes pan, cistern & fixings.'
          : 'Hoeveel toiletten worden geïnstalleerd? Inclusief pot, stortbak en bevestiging.';
    } else if (_isCV) {
      return _isEn
          ? 'How many central heating units need refilling?'
          : 'Hoeveel CV-installaties moeten worden bijgevuld?';
    } else if (_isOntstoppen) {
      return _isEn
          ? 'How many blocked pipes / drains need clearing?'
          : 'Hoeveel verstopte leidingen / afvoeren moeten worden ontstopt?';
    } else if (_isLeiding) {
      return _isEn
          ? 'Enter the length of a simple, straight copper water-pipe run. Fittings, bends and insulation are not included.'
          : 'Voer de lengte van een eenvoudige, rechte koperen waterleiding in. Koppelingen, bochten en isolatie zijn niet inbegrepen.';
    }
    return _isEn ? 'Enter the details below.' : 'Vul de gegevens hieronder in.';
  }

  String get _inputLabel {
    if (_isCountJob) {
      if (_isKraan) return _isEn ? 'Number of taps' : 'Aantal kranen';
      if (_isToilet) return _isEn ? 'Number of toilets' : 'Aantal toiletten';
      if (_isCV) return _isEn ? 'Number of systems' : 'Aantal installaties';
      if (_isOntstoppen) {
        return _isEn ? 'Number of blockages' : 'Aantal verstopping';
      }
      return _isEn ? 'Quantity' : 'Aantal';
    } else {
      return _isEn ? 'Pipe length (m)' : 'Leidinglengte (m)';
    }
  }

  // ── cost estimate ───────────────────────────────────────────────────────────

  String _estimateCostText() {
    if (_isKraan) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 110.00).toStringAsFixed(2)}';
    } else if (_isToilet) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 334.00).toStringAsFixed(2)}';
    } else if (_isCV) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 13.00).toStringAsFixed(2)}';
    } else if (_isOntstoppen) {
      final n = p.customCount > 0 ? p.customCount : 1;
      return '± €${(n * 10.00).toStringAsFixed(2)}';
    } else if (_isLeiding) {
      final m = p.customLength > 0 ? p.customLength : 5.0;
      return '± €${(m * 6.50).toStringAsFixed(2)}';
    }
    return '';
  }

  // ── unit-price hint ─────────────────────────────────────────────────────────
  String get _unitHint {
    if (_isKraan) return _isEn ? '≈ €110 / tap' : '≈ €110 / kraan';
    if (_isToilet) return _isEn ? '≈ €334 / toilet' : '≈ €334 / toilet';
    if (_isCV) return _isEn ? '≈ €13 / system' : '≈ €13 / installatie';
    if (_isOntstoppen) {
      return _isEn ? '≈ €10 / blockage' : '≈ €10 / verstopping';
    }
    if (_isLeiding) return _isEn ? '≈ €6.50 / m' : '≈ €6,50 / m';
    return '';
  }

  // ── lifecycle ───────────────────────────────────────────────────────────────

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

  // ── build ───────────────────────────────────────────────────────────────────

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

            // ── Input card ───────────────────────────────────────────────────
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
                  // Icon + label row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.plumbing,
                          color: Color(0xFFE65100),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _inputLabel,
                              style: Utils.getTextStyle(
                                baseSize: 14,
                                isBold: true,
                                color: Utils.kDarkBlue,
                              ),
                            ),
                            if (_unitHint.isNotEmpty)
                              Text(
                                _unitHint,
                                style: Utils.getTextStyle(
                                  baseSize: 11,
                                  isBold: false,
                                  color: Colors.black45,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  if (_isCountJob) ...[
                    // ── Count stepper ────────────────────────────────────────
                    Row(
                      children: [
                        _PlmbBtn(
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
                          child: _PlmbField(
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
                        _PlmbBtn(
                          icon: Icons.add,
                          filled: true,
                          onTap: () {
                            final cur = p.customCount;
                            p.setCustomCount(cur + 1);
                            _countController.text = '${cur + 1}';
                            ss(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [1, 2, 3, 4, 5, 6].map((n) {
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
                    _PlmbField(
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
                      children: [3.0, 5.0, 8.0, 10.0, 15.0, 20.0, 30.0].map((
                        m,
                      ) {
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

            // ── Live cost-estimate badge ─────────────────────────────────────
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

            // ── Info note ────────────────────────────────────────────────────
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
                          ? 'Based on standard installation. Exact quote depends on pipe access and local conditions.'
                          : 'Op basis van standaard installatie. Exacte offerte afhankelijk van leidingtoegankelijkheid en lokale situatie.',
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

            // ── CALCULATE button ─────────────────────────────────────────────
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

// ── Private helpers ──────────────────────────────────────────────────────────

class _PlmbBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  const _PlmbBtn({
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

class _PlmbField extends StatelessWidget {
  final TextEditingController controller;
  final String suffix;
  final bool isInteger;
  final ValueChanged<String> onChanged;
  const _PlmbField({
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
