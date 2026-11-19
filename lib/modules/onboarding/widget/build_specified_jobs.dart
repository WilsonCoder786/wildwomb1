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
            return InkWell(
              onTap: () => provider.selectSpecificJob(job),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: job,
                      // ignore: deprecated_member_use
                      groupValue: provider.selectedSpecificJobs.isNotEmpty
                          ? provider.selectedSpecificJobs.first
                          : null,
                      // ignore: deprecated_member_use
                      onChanged: (v) {
                        if (v != null) provider.selectSpecificJob(v);
                      },
                      activeColor: Utils.kDarkBlue,
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          job,
                          softWrap: true,
                          style: Utils.getTextStyle(
                            baseSize: 14,
                            isBold: isSelected,
                            color: isSelected ? Utils.kDarkBlue : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
            _situationForJob(provider.selectedJobId ?? '', l10n),
            style: Utils.getTextStyle(
              baseSize: 13,
              isBold: false,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...safetyStopPoints.map(
          (point) => InkWell(
            onTap: () => provider.setSafetyStopPointSelected(
              point.id,
              !provider.isSafetyStopPointSelected(point.id),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: provider.isSafetyStopPointSelected(point.id),
                    onChanged: (applies) {
                      if (applies != null) {
                        provider.setSafetyStopPointSelected(point.id, applies);
                      }
                    },
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        point.label,
                        softWrap: true,
                        style: Utils.getTextStyle(
                          baseSize: 14,
                          isBold: false,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
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
    switch (jobId) {
      case 'carpenter':
        return [
          _SafetyStopPoint('load_bearing', l10n.safetyStopLoadBearing),
          _SafetyStopPoint('asbestos', l10n.safetyStopAsbestos),
          _SafetyStopPoint('moisture_or_leak', l10n.safetyStopMoistureOrLeak),
          _SafetyStopPoint('unknown_services', l10n.safetyStopUnknownServices),
          _SafetyStopPoint('permit', l10n.safetyStopPermit),
          _SafetyStopPoint(
            'complex_structure',
            l10n.safetyStopComplexStructure,
          ),
        ];
      case 'painter':
        return [
          _SafetyStopPoint('lead_paint', l10n.safetyStopLeadPaint),
          _SafetyStopPoint('asbestos', l10n.safetyStopAsbestos),
          _SafetyStopPoint('severe_moisture', l10n.safetyStopMoisture),
          _SafetyStopPoint('uncertain_substrate', l10n.safetyStopSubstrate),
        ];
      case 'plumber':
        return [
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
          _SafetyStopPoint('unknown_services', l10n.safetyStopUnknownServices),
        ];
      case 'electrician':
        return [
          _SafetyStopPoint('gas', l10n.safetyStopGas),
          _SafetyStopPoint('serious_leak', l10n.safetyStopSeriousLeak),
          _SafetyStopPoint('damaged_wiring', l10n.safetyStopWiring),
          _SafetyStopPoint('uncertain_earthing', l10n.safetyStopEarthing),
          _SafetyStopPoint(
            'uncertain_circuit_protection',
            l10n.safetyStopCircuit,
          ),
          _SafetyStopPoint(
            'distribution_board',
            l10n.safetyStopDistributionBoard,
          ),
          _SafetyStopPoint(
            'complex_installation',
            l10n.safetyStopComplexInstallation,
          ),
          _SafetyStopPoint('working_at_height', l10n.safetyStopHeight),
        ];
      case 'gardener':
        return [
          _SafetyStopPoint('load_bearing', l10n.safetyStopLoadBearing),
          _SafetyStopPoint('asbestos', l10n.safetyStopAsbestos),
          _SafetyStopPoint('moisture_or_leak', l10n.safetyStopMoistureOrLeak),
          _SafetyStopPoint('ground_services', l10n.safetyStopGroundServices),
          _SafetyStopPoint('permit', l10n.safetyStopPermit),
          _SafetyStopPoint(
            'complex_structure',
            l10n.safetyStopComplexStructure,
          ),
          _SafetyStopPoint('working_at_height', l10n.safetyStopHeight),
          _SafetyStopPoint('heavy_equipment', l10n.safetyStopHeavyEquipment),
          _SafetyStopPoint('pesticides', l10n.safetyStopPesticide),
        ];
      case 'tiler':
        return [
          _SafetyStopPoint('uncertain_substrate', l10n.safetyStopSubstrate),
          _SafetyStopPoint('load_bearing', l10n.safetyStopLoadBearing),
          _SafetyStopPoint('asbestos', l10n.safetyStopAsbestos),
          _SafetyStopPoint('severe_moisture', l10n.safetyStopMoisture),
          _SafetyStopPoint('services_work', l10n.safetyStopServicesWork),
        ];
      default:
        return [
          _SafetyStopPoint('unknown_services', l10n.safetyStopUnknownServices),
          _SafetyStopPoint('asbestos', l10n.safetyStopAsbestos),
          _SafetyStopPoint('permit', l10n.safetyStopPermit),
        ];
    }
  }

  String _situationForJob(String jobId, AppLocalizations l10n) {
    switch (jobId) {
      case 'carpenter':
        return l10n.onboardingSituationCarpenter;
      case 'plumber':
        return l10n.onboardingSituationPlumber;
      case 'painter':
        return l10n.onboardingSituationPainter;
      case 'gardener':
        return l10n.onboardingSituationGardener;
      case 'electrician':
        return l10n.onboardingSituationElectrician;
      case 'tiler':
        return l10n.onboardingSituationTiler;
      default:
        return l10n.onboardingSafetyIntro;
    }
  }
}

class _SafetyStopPoint {
  final String id;
  final String label;

  const _SafetyStopPoint(this.id, this.label);
}
