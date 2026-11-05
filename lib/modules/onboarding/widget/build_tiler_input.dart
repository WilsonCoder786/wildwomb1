import 'dart:math';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Step-4 view for tiler sub-jobs that do NOT need an m² area input:
///   • Tegels repareren  — number of tiles to replace (count)
///   • Kit aanbrengen    — length of joint to seal (metres)
///
/// All other tiler sub-jobs (Vloertegels, Wandtegels, Voegen) use the standard
/// OnboardingStep3 area-measurement screen and are not routed here.
class BuildTilerInput extends StatefulWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildTilerInput({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  State<BuildTilerInput> createState() => _BuildTilerInputState();
}

class _BuildTilerInputState extends State<BuildTilerInput> {
  late TextEditingController _countCtrl;
  late TextEditingController _lengthCtrl;

  OnboardingProvider get p => widget.provider;
  AppLocalizations get l10n => widget.l10n;
  bool get _isEn => l10n.localeName.startsWith('en');

  String get _job =>
      p.selectedSpecificJobs.isNotEmpty ? p.selectedSpecificJobs.first : '';

  bool get _isRepareren =>
      _job.contains('Repareren') ||
      _job.contains('repareren') ||
      _job.contains('Repairing tiles') ||
      _job.contains('Repair');

  bool get _isKit =>
      _job.contains('Kit') ||
      _job.contains('Sealant') ||
      _job.contains('sealant');

  // ── texts ───────────────────────────────────────────────────────────────────

  String get _headerTitle {
    if (_isRepareren) {
      return _isEn ? 'Repairing tiles — Details' : 'Tegels repareren — Details';
    }
    if (_isKit) {
      return _isEn ? 'Applying sealant — Details' : 'Kit aanbrengen — Details';
    }
    return _isEn ? 'Tiling work — Details' : 'Tegelwerk — Details';
  }

  String get _headerSubtitle {
    if (_isRepareren) {
      return _isEn
          ? 'How many tiles need replacing? Includes replacement tiles, adhesive & grout.'
          : 'Hoeveel tegels moeten worden vervangen? Inclusief vervangingstegels, lijm en voegmiddel.';
    }
    if (_isKit) {
      return _isEn
          ? 'Enter the total length of joints / seams to seal (in metres). 1 tube ≈ 10 m.'
          : 'Voer de totale lengte van te kitten naden/voegen in (in meters). 1 tube ≈ 10 m.';
    }
    return _isEn ? 'Enter the details below.' : 'Vul de gegevens hieronder in.';
  }

  // ── cost estimate ───────────────────────────────────────────────────────────

  String _estimateCostText() {
    if (_isRepareren) {
      final n = p.customCount > 0 ? p.customCount : 3;
      return '± €${(n * 8.00).toStringAsFixed(2)}';
    }
    if (_isKit) {
      final m = p.customLength > 0 ? p.customLength : 10.0;
      return '± €${(m * 0.70).toStringAsFixed(2)}';
    }
    return '';
  }

  // ── lifecycle ───────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _countCtrl = TextEditingController(
      text: p.customCount > 0 ? '${p.customCount}' : '3',
    );
    _lengthCtrl = TextEditingController(
      text: p.customLength > 0 ? p.customLength.toStringAsFixed(1) : '10.0',
    );
    if (p.customCount <= 0) p.setCustomCount(3);
    if (p.customLength <= 0) p.setCustomLength(10.0);
  }

  @override
  void dispose() {
    _countCtrl.dispose();
    _lengthCtrl.dispose();
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

            // ── Header ───────────────────────────────────────────────────────
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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.grid_4x4,
                          color: Color(0xFFE65100),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _isRepareren
                              ? (_isEn
                                    ? 'Number of tiles to replace'
                                    : 'Aantal te vervangen tegels')
                              : (_isEn
                                    ? 'Sealant joint length (m)'
                                    : 'Te kitten naadlengte (m)'),
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

                  // ── Tegels repareren: count stepper ──────────────────────
                  if (_isRepareren) ...[
                    Row(
                      children: [
                        _TlrBtn(
                          icon: Icons.remove,
                          onTap: () {
                            final cur = p.customCount;
                            if (cur > 1) {
                              p.setCustomCount(cur - 1);
                              _countCtrl.text = '${cur - 1}';
                              ss(() {});
                            }
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _TlrField(
                            controller: _countCtrl,
                            suffix: _isEn ? 'tiles' : 'tegels',
                            isInteger: true,
                            onChanged: (v) {
                              final n = int.tryParse(v) ?? 1;
                              p.setCustomCount(n > 0 ? n : 1);
                              ss(() {});
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        _TlrBtn(
                          icon: Icons.add,
                          filled: true,
                          onTap: () {
                            final cur = p.customCount;
                            p.setCustomCount(cur + 1);
                            _countCtrl.text = '${cur + 1}';
                            ss(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [1, 2, 3, 5, 8, 10, 15, 20].map((n) {
                        final isSel = p.customCount == n;
                        return GestureDetector(
                          onTap: () {
                            p.setCustomCount(n);
                            _countCtrl.text = '$n';
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
                                  '$n ${_isEn ? (n == 1 ? "tile" : "tiles") : (n == 1 ? "tegel" : "tegels")}',
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

                  // ── Kit aanbrengen: length field ─────────────────────────
                  if (_isKit) ...[
                    _TlrField(
                      controller: _lengthCtrl,
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
                            _lengthCtrl.text = m.toStringAsFixed(1);
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
                    // Tube hint
                    const SizedBox(height: 10),
                    if (p.customLength > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.opacity, size: 16, color: Utils.kOrange),
                            const SizedBox(width: 8),
                            Text(
                              '${max(1, (p.customLength / 10).ceil())} ${_isEn ? "tube(s) needed" : "tube(s) nodig"} (~10 m/tube)',
                              style: Utils.getTextStyle(
                                baseSize: 12,
                                isBold: true,
                                color: Utils.kOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ],
              ),
            ),

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
                          ? 'Based on standard tile dimensions. Exact quote depends on tile type and surface condition.'
                          : 'Op basis van standaard tegelformaten. Exacte offerte afhankelijk van tegeltype en ondergrond.',
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
}

// ── Private helpers ──────────────────────────────────────────────────────────

class _TlrBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  const _TlrBtn({required this.icon, required this.onTap, this.filled = false});

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

class _TlrField extends StatelessWidget {
  final TextEditingController controller;
  final String suffix;
  final bool isInteger;
  final ValueChanged<String> onChanged;
  const _TlrField({
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
          hintText: isInteger ? '3' : '0.00',
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
