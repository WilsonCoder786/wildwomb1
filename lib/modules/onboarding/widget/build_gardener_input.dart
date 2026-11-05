import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Step-4 view for all gardener sub-jobs.
///
/// Sub-job input types:
/// * Schutting plaatsen  — panels (count) + total length (m)
/// * Bestrating aanleggen — length × width (m²)
/// * Snoeien             — trees / shrubs count
/// * Overkapping bouwen  — width × depth (m²)
/// * Gazon leggen        — length × width (m²)
///
/// Includes a live cost-estimate card and a CALCULATE button.
class BuildGardenerInput extends StatefulWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildGardenerInput({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  State<BuildGardenerInput> createState() => _BuildGardenerInputState();
}

class _BuildGardenerInputState extends State<BuildGardenerInput> {
  late TextEditingController _lengthCtrl;
  late TextEditingController _widthCtrl;
  late TextEditingController _countCtrl;

  OnboardingProvider get p => widget.provider;
  AppLocalizations get l10n => widget.l10n;
  bool get _isEn => l10n.localeName.startsWith('en');

  String get _job =>
      p.selectedSpecificJobs.isNotEmpty ? p.selectedSpecificJobs.first : '';

  // ── sub-job detectors ───────────────────────────────────────────────────────
  bool get _isSchutting => _job.contains('Schutting') || _job.contains('Fence');
  bool get _isBestrating =>
      _job.contains('Bestrating') ||
      _job.contains('Paving') ||
      _job.contains('Terras') ||
      _job.contains('Patio');
  bool get _isSnoeien =>
      _job.contains('Snoeien') ||
      _job.contains('Pruning') ||
      _job.contains('Hagen') ||
      _job.contains('Hedge');
  bool get _isOverkapping =>
      _job.contains('Overkapping') ||
      _job.contains('Canopy') ||
      _job.contains('Carport') ||
      _job.contains('Pergola');
  bool get _isGazon =>
      _job.contains('Gazon') ||
      _job.contains('Lawn') ||
      _job.contains('Gras') ||
      _job.contains('Grass');

  // ── texts ───────────────────────────────────────────────────────────────────

  String get _headerTitle {
    if (_isSchutting) {
      return _isEn
          ? 'Fence installation — Details'
          : 'Schutting plaatsen — Details';
    }
    if (_isBestrating) {
      return _isEn
          ? 'Paving installation — Details'
          : 'Bestrating aanleggen — Details';
    }
    if (_isSnoeien) {
      return _isEn ? 'Pruning — Details' : 'Snoeien — Details';
    }
    if (_isOverkapping) {
      return _isEn
          ? 'Canopy construction — Details'
          : 'Overkapping bouwen — Details';
    }
    if (_isGazon) {
      return _isEn ? 'Lawn laying — Details' : 'Gazon leggen — Details';
    }
    return _isEn ? 'Garden work — Details' : 'Tuinwerk — Details';
  }

  String get _headerSubtitle {
    if (_isSchutting) {
      return _isEn
          ? 'Enter the number of fence panels (180×180 cm) and total fence length.'
          : 'Voer het aantal schuttpanelen (180×180 cm) en de totale schuttinglengte in.';
    }
    if (_isBestrating) {
      return _isEn
          ? 'Enter the area dimensions. Includes tiles, sand, edging & concrete.'
          : 'Voer de afmetingen van de bestrating in. Inclusief tegels, zand, afboording en beton.';
    }
    if (_isSnoeien) {
      return _isEn
          ? 'Enter the planting area in 10 m² units.'
          : 'Voer het beplante oppervlak in eenheden van 10 m² in.';
    }
    if (_isOverkapping) {
      return _isEn
          ? 'Enter the canopy dimensions. Includes posts, beams, roof panels & fixings.'
          : 'Voer de afmetingen van de overkapping in. Inclusief staanders, balken, dakplaten en bevestiging.';
    }
    if (_isGazon) {
      return _isEn
          ? 'Enter the area for artificial grass on an already prepared subgrade.'
          : 'Voer het oppervlak voor kunstgras op een voorbereide ondergrond in.';
    }
    return _isEn
        ? 'Fill in the details below.'
        : 'Vul de gegevens hieronder in.';
  }

  // ── cost estimate ───────────────────────────────────────────────────────────

  String _estimateCostText() {
    if (_isSchutting) {
      final meters = p.customLength > 0 ? p.customLength : 9.0;
      final cost = meters * 47.0;
      return '± €${cost.toStringAsFixed(2)}';
    }
    if (_isBestrating) {
      final areaM2 = (p.customLength > 0 && p.customDepth > 0)
          ? p.customLength * p.customDepth
          : 10.0;
      return '± €${(areaM2 * 43.0).toStringAsFixed(2)}';
    }
    if (_isSnoeien) {
      return '± €0.00';
    }
    if (_isOverkapping) {
      final l = p.customLength > 0 ? p.customLength : 4.0;
      final d = p.customDepth > 0 ? p.customDepth : 3.0;
      final areaM2 = l * d;
      return '± €${(areaM2 * 122.0).toStringAsFixed(2)}';
    }
    if (_isGazon) {
      final areaM2 = (p.customLength > 0 && p.customDepth > 0)
          ? p.customLength * p.customDepth
          : 20.0;
      return '± €${(areaM2 * 38.0).toStringAsFixed(2)}';
    }
    return '';
  }

  // ── lifecycle ───────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _lengthCtrl = TextEditingController(
      text: p.customLength > 0 ? p.customLength.toStringAsFixed(1) : '',
    );
    _widthCtrl = TextEditingController(
      text: p.customDepth > 0 ? p.customDepth.toStringAsFixed(1) : '',
    );
    _countCtrl = TextEditingController(
      text: p.customCount > 0 ? '${p.customCount}' : '',
    );
    // Seed defaults
    if (_isSchutting) {
      if (p.customCount <= 0) p.setCustomCount(5);
      if (p.customLength <= 0) p.setCustomLength(9.0);
      _countCtrl.text = '${p.customCount}';
      _lengthCtrl.text = p.customLength.toStringAsFixed(1);
    } else if (_isSnoeien) {
      if (p.customCount <= 0) p.setCustomCount(1);
      _countCtrl.text = '${p.customCount}';
    } else if (_isBestrating || _isGazon) {
      if (p.customLength <= 0) p.setCustomLength(5.0);
      if (p.customDepth <= 0) p.setCustomDepth(4.0);
      _lengthCtrl.text = p.customLength.toStringAsFixed(1);
      _widthCtrl.text = p.customDepth.toStringAsFixed(1);
    } else if (_isOverkapping) {
      if (p.customLength <= 0) p.setCustomLength(4.0);
      if (p.customDepth <= 0) p.setCustomDepth(3.0);
      _lengthCtrl.text = p.customLength.toStringAsFixed(1);
      _widthCtrl.text = p.customDepth.toStringAsFixed(1);
    }
  }

  @override
  void dispose() {
    _lengthCtrl.dispose();
    _widthCtrl.dispose();
    _countCtrl.dispose();
    super.dispose();
  }

  // ── helpers ─────────────────────────────────────────────────────────────────

  Widget _decimalField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String suffix,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
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
            border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(12),
            color: Utils.kDarkBlue.withValues(alpha: 0.03),
          ),
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
              hintText: hint,
              suffixText: suffix,
              suffixStyle: const TextStyle(
                color: Color(0xFFE65100),
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _quickChips({
    required List<double> values,
    required double current,
    required String suffix,
    required void Function(double) onSelect,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: values.map((v) {
        final isSel = (current - v).abs() < 0.01;
        return GestureDetector(
          onTap: () => onSelect(v),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSel
                  ? Utils.kOrange.withValues(alpha: 0.12)
                  : Colors.grey.shade100,
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
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Utils.kOrange,
                    ),
                  ),
                Text(
                  '${v % 1 == 0 ? v.toInt() : v} $suffix',
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
    );
  }

  Widget _countStepper({
    required String label,
    required String unitSingular,
    required String unitPlural,
  }) {
    return StatefulBuilder(
      builder: (ctx, ss) {
        final cur = p.customCount;
        return Column(
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
                _GdnBtn(
                  icon: Icons.remove,
                  onTap: () {
                    if (cur > 1) {
                      p.setCustomCount(cur - 1);
                      _countCtrl.text = '${cur - 1}';
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
                      controller: _countCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        suffixText: cur == 1 ? unitSingular : unitPlural,
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
                _GdnBtn(
                  icon: Icons.add,
                  filled: true,
                  onTap: () {
                    p.setCustomCount(cur + 1);
                    _countCtrl.text = '${cur + 1}';
                    ss(() {});
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
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
                  // Icon row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.yard_outlined,
                          color: Color(0xFFE65100),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _headerTitle.split(' — ').last,
                          style: Utils.getTextStyle(
                            baseSize: 14,
                            isBold: true,
                            color: Utils.kDarkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // ── Schutting: panels + length ────────────────────────────
                  if (_isSchutting) ...[
                    _countStepper(
                      label: _isEn
                          ? 'Number of fence panels (180×180 cm)'
                          : 'Aantal schuttpanelen (180×180 cm)',
                      unitSingular: _isEn ? 'panel' : 'paneel',
                      unitPlural: _isEn ? 'panels' : 'panelen',
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [3, 5, 7, 10, 12, 15],
                      current: p.customCount.toDouble(),
                      suffix: _isEn ? 'pnl' : 'pnl',
                      onSelect: (v) {
                        p.setCustomCount(v.toInt());
                        _countCtrl.text = '${v.toInt()}';
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 18),
                    _decimalField(
                      controller: _lengthCtrl,
                      label: _isEn
                          ? 'Total fence length (m)'
                          : 'Totale schuttinglengte (m)',
                      hint: '9.0',
                      suffix: 'm',
                      onChanged: (v) {
                        p.setCustomLength(
                          double.tryParse(v.replaceAll(',', '.')) ?? 0,
                        );
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [5, 7, 9, 12, 15, 18],
                      current: p.customLength,
                      suffix: 'm',
                      onSelect: (v) {
                        p.setCustomLength(v);
                        _lengthCtrl.text = v.toStringAsFixed(1);
                        ss(() {});
                      },
                    ),
                  ],

                  // ── Bestrating / Gazon: length × width ───────────────────
                  if (_isBestrating || _isGazon) ...[
                    _decimalField(
                      controller: _lengthCtrl,
                      label: _isEn ? 'Length (m)' : 'Lengte (m)',
                      hint: '5.0',
                      suffix: 'm',
                      onChanged: (v) {
                        p.setCustomLength(
                          double.tryParse(v.replaceAll(',', '.')) ?? 0,
                        );
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [3, 4, 5, 6, 8, 10],
                      current: p.customLength,
                      suffix: 'm',
                      onSelect: (v) {
                        p.setCustomLength(v);
                        _lengthCtrl.text = v.toStringAsFixed(1);
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 18),
                    _decimalField(
                      controller: _widthCtrl,
                      label: _isEn ? 'Width (m)' : 'Breedte (m)',
                      hint: '4.0',
                      suffix: 'm',
                      onChanged: (v) {
                        p.setCustomDepth(
                          double.tryParse(v.replaceAll(',', '.')) ?? 0,
                        );
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [2, 3, 4, 5, 6, 8],
                      current: p.customDepth,
                      suffix: 'm',
                      onSelect: (v) {
                        p.setCustomDepth(v);
                        _widthCtrl.text = v.toStringAsFixed(1);
                        ss(() {});
                      },
                    ),
                    // Live m² indicator
                    if (p.customLength > 0 && p.customDepth > 0) ...[
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.square_foot,
                              size: 18,
                              color: Utils.kOrange,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${(p.customLength * p.customDepth).toStringAsFixed(1)} m²',
                              style: Utils.getTextStyle(
                                baseSize: 15,
                                isBold: true,
                                color: Utils.kOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],

                  // ── Snoeien: count ────────────────────────────────────────
                  if (_isSnoeien) ...[
                    _countStepper(
                      label: _isEn
                          ? 'Planting area units (10 m² each)'
                          : 'Eenheden beplant oppervlak (10 m² per stuk)',
                      unitSingular: _isEn ? 'unit' : 'eenheid',
                      unitPlural: _isEn ? 'units' : 'eenheden',
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [1, 2, 3, 5, 7, 10],
                      current: p.customCount.toDouble(),
                      suffix: _isEn ? ' × 10 m²' : ' × 10 m²',
                      onSelect: (v) {
                        p.setCustomCount(v.toInt());
                        _countCtrl.text = '${v.toInt()}';
                        ss(() {});
                      },
                    ),
                  ],

                  // ── Overkapping: width × depth ────────────────────────────
                  if (_isOverkapping) ...[
                    _decimalField(
                      controller: _lengthCtrl,
                      label: _isEn
                          ? 'Canopy width (m)'
                          : 'Breedte overkapping (m)',
                      hint: '4.0',
                      suffix: 'm',
                      onChanged: (v) {
                        p.setCustomLength(
                          double.tryParse(v.replaceAll(',', '.')) ?? 0,
                        );
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [3, 4, 5, 6],
                      current: p.customLength,
                      suffix: 'm',
                      onSelect: (v) {
                        p.setCustomLength(v);
                        _lengthCtrl.text = v.toStringAsFixed(1);
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 18),
                    _decimalField(
                      controller: _widthCtrl,
                      label: _isEn
                          ? 'Canopy depth (m)'
                          : 'Diepte overkapping (m)',
                      hint: '3.0',
                      suffix: 'm',
                      onChanged: (v) {
                        p.setCustomDepth(
                          double.tryParse(v.replaceAll(',', '.')) ?? 0,
                        );
                        ss(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    _quickChips(
                      values: const [2, 2.5, 3, 3.5, 4],
                      current: p.customDepth,
                      suffix: 'm',
                      onSelect: (v) {
                        p.setCustomDepth(v);
                        _widthCtrl.text = v.toStringAsFixed(1);
                        ss(() {});
                      },
                    ),
                    if (p.customLength > 0 && p.customDepth > 0) ...[
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Utils.kOrange.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.roofing, size: 18, color: Utils.kOrange),
                            const SizedBox(width: 8),
                            Text(
                              '${(p.customLength * p.customDepth).toStringAsFixed(1)} m²',
                              style: Utils.getTextStyle(
                                baseSize: 15,
                                isBold: true,
                                color: Utils.kOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                          ? 'Based on standard Dutch prices. Exact quote depends on site conditions and material choice.'
                          : 'Op basis van Nederlandse richtprijzen. Exacte offerte afhankelijk van situatie ter plaatse en materiaalkeuze.',
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

class _GdnBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  const _GdnBtn({required this.icon, required this.onTap, this.filled = false});

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
