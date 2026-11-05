import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';

class OnboardingStep2 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const OnboardingStep2({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final jobs = [
      {
        'name': l10n.onboardingJobCarpenter,
        'icon': "assets/images/hammer.png",
        'id': 'carpenter',
      },
      {
        'name': l10n.onboardingJobPlumber,
        'icon': "assets/images/lodgieter.png",
        'id': 'plumber',
      },
      {
        'name': l10n.onboardingJobPainter,
        'icon': "assets/images/schilder.png",
        'id': 'painter',
      },
      {
        'name': l10n.onboardingJobGardener,
        'icon': "assets/images/tuinier.png",
        'id': 'gardener',
      },
      {
        'name': l10n.onboardingJobElectrician,
        'icon': "assets/images/elektricien.png",
        'id': 'electrician',
      },
      {
        'name': l10n.onboardingJobTiler,
        'icon': "assets/images/tegelzetter.png",
        'id': 'tiler',
      },
    ];

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.onboardingChooseJob,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        Text(
          l10n.onboardingJobBannerHint,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            final isSelected = provider.selectedJobId == job['id'];
            return GestureDetector(
              onTap: () => provider.selectJob(
                job['name'] as String,
                job['id'] as String,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? Utils.kOrange.withValues(alpha: 0.1)
                      : Colors.white,
                  border: Border.all(
                    color: isSelected ? Utils.kOrange : Utils.kLightGrey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      job['icon'] as String,
                      height: 40,
                      color: job.containsKey('color')
                          ? job['color'] as Color
                          : null,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      job['name'] as String,
                      textAlign: TextAlign.center,
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: isSelected ? true : false,
                        color: isSelected ? Utils.kOrange : Utils.kDarkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
