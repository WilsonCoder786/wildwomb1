import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';

class BuildSpecifiedJobs extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildSpecifiedJobs({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> jobsMap = {
      'carpenter': [
        l10n.jobCarpenter01,
        l10n.jobCarpenter02,
        l10n.jobCarpenter03,
        l10n.jobCarpenter04,
        l10n.jobCarpenter05,
      ],
      'plumber': [
        l10n.jobPlumber01,
        l10n.jobPlumber02,
        l10n.jobPlumber03,
        l10n.jobPlumber04,
        l10n.jobPlumber05,
      ],
      'painter': [
        l10n.jobPainter01,
        l10n.jobPainter02,
        l10n.jobPainter03,
        l10n.jobPainter04,
        l10n.jobPainter05,
      ],
      'gardener': [
        l10n.jobGardener01,
        l10n.jobGardener02,
        l10n.jobGardener03,
        l10n.jobGardener04,
        l10n.jobGardener05,
      ],
      'electrician': [
        l10n.jobElectrician01,
        l10n.jobElectrician02,
        l10n.jobElectrician03,
        l10n.jobElectrician04,
        l10n.jobElectrician05,
      ],
      'tiler': [
        l10n.jobTiler01,
        l10n.jobTiler02,
        l10n.jobTiler03,
        l10n.jobTiler04,
        l10n.jobTiler05,
      ],
    };

    final specificJobs = jobsMap[provider.selectedJobId] ?? [];
    final safetyStopPoints = _safetyStopPointsForJob(
      provider.selectedJobId ?? '',
      l10n,
    );

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          provider.selectedJob ?? l10n.onboardingJobCarpenter,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        Text(
          l10n.onboardingSelectJob,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: specificJobs.length,
          itemBuilder: (context, index) {
            final job = specificJobs[index];
            final isSelected = provider.selectedSpecificJobs.contains(job);
            return RadioListTile<String>(
              value: job,
              // ignore: deprecated_member_use
              groupValue: provider.selectedSpecificJobs.isNotEmpty
                  ? provider.selectedSpecificJobs.first
                  : null,
              // ignore: deprecated_member_use
              onChanged: (v) {
                if (v != null) provider.selectSpecificJob(v);
              },
              title: Text(
                job,
                style: Utils.getTextStyle(
                  baseSize: 14,
                  isBold: isSelected,
                  color: isSelected ? Utils.kDarkBlue : Colors.black87,
                ),
              ),
              activeColor: Utils.kDarkBlue,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            l10n.onboardingSafetyTitle,
            style: Utils.getTextStyle(
              baseSize: 18,
              isBold: true,
              color: Utils.kDarkBlue,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            l10n.onboardingSafetyIntro,
            style: Utils.getTextStyle(
              baseSize: 13,
              isBold: false,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...safetyStopPoints.map(
          (point) => CheckboxListTile(
            value: provider.isSafetyStopPointSelected(point.id),
            onChanged: (applies) {
              if (applies != null) {
                provider.setSafetyStopPointSelected(point.id, applies);
              }
            },
            title: Text(point.label),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            dense: true,
          ),
        ),
        if (provider.hasReportedSafetyStopPoint)
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              border: Border.all(color: const Color(0xFFC62828)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.block, color: Color(0xFFC62828)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.onboardingSafetyStopMessage,
                    style: Utils.getTextStyle(
                      baseSize: 13,
                      isBold: true,
                      color: const Color(0xFF8E0000),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  List<_SafetyStopPoint> _safetyStopPointsForJob(
    String jobId,
    AppLocalizations l10n,
  ) {
    final common = <_SafetyStopPoint>[
      _SafetyStopPoint('unknown_services', l10n.safetyStopUnknownServices),
      _SafetyStopPoint('asbestos', l10n.safetyStopAsbestos),
      _SafetyStopPoint('permit', l10n.safetyStopPermit),
      _SafetyStopPoint('working_at_height', l10n.safetyStopHeight),
    ];

    switch (jobId) {
      case 'carpenter':
        return [
          ...common,
          _SafetyStopPoint('load_bearing', l10n.safetyStopLoadBearing),
          _SafetyStopPoint('heavy_equipment', l10n.safetyStopHeavyEquipment),
        ];
      case 'painter':
        return [
          ...common,
          _SafetyStopPoint('lead_paint', l10n.safetyStopLeadPaint),
          _SafetyStopPoint('severe_moisture', l10n.safetyStopMoisture),
          _SafetyStopPoint('uncertain_substrate', l10n.safetyStopSubstrate),
        ];
      case 'plumber':
        return [
          ...common,
          _SafetyStopPoint('gas', l10n.safetyStopGas),
          _SafetyStopPoint('flue_gas', l10n.safetyStopFlue),
          _SafetyStopPoint('boiler_repair', l10n.safetyStopBoiler),
          _SafetyStopPoint('serious_leak', l10n.safetyStopSeriousLeak),
          _SafetyStopPoint(
            'recurring_pressure_loss',
            l10n.safetyStopPressureLoss,
          ),
          _SafetyStopPoint('complex_blockage', l10n.safetyStopBlockage),
          _SafetyStopPoint('drinking_water', l10n.safetyStopDrinkingWater),
        ];
      case 'electrician':
        return [
          ...common,
          _SafetyStopPoint('gas', l10n.safetyStopGas),
          _SafetyStopPoint('damaged_wiring', l10n.safetyStopWiring),
          _SafetyStopPoint('uncertain_earthing', l10n.safetyStopEarthing),
          _SafetyStopPoint(
            'uncertain_circuit_protection',
            l10n.safetyStopCircuit,
          ),
        ];
      case 'gardener':
        return [
          ...common,
          _SafetyStopPoint('load_bearing', l10n.safetyStopLoadBearing),
          _SafetyStopPoint('heavy_equipment', l10n.safetyStopHeavyEquipment),
          _SafetyStopPoint('pesticides', l10n.safetyStopPesticide),
        ];
      case 'tiler':
        return [
          ...common,
          _SafetyStopPoint('load_bearing', l10n.safetyStopLoadBearing),
          _SafetyStopPoint('severe_moisture', l10n.safetyStopMoisture),
          _SafetyStopPoint('uncertain_substrate', l10n.safetyStopSubstrate),
        ];
      default:
        return common;
    }
  }
}

class _SafetyStopPoint {
  final String id;
  final String label;

  const _SafetyStopPoint(this.id, this.label);
}
