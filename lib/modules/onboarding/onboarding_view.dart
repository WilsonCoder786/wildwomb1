import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/iap_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_carpenter_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_electrician_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_gardener_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_painter_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_plumber_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_setup_custom_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_specified_jobs.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_step_deur_plaatsen.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_tiler_input.dart';
import 'package:easy_four_diy/modules/onboarding/widget/_build_step_trap_bekleden.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step2.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step3.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step4.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step5.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step6.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step7.dart';
import 'package:easy_four_diy/modules/onboarding/widget/onboarding_step8.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnbpardingViewState();
}

class _OnbpardingViewState extends State<OnboardingView> {
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;
  int _lastStep = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bool isPremium = context.read<IAPService>().isPremium;
      // Only load interstitial ads for non-premium users
      if (!isPremium) {
        //AdService.loadInterstitialAd(context);
      }
    });

    final bool isEnglish = context.read<AppService>().locale == Locale('en');
    _videoController =
        VideoPlayerController.asset(
            isEnglish ? 'assets/videos/final_2.mp4' : 'assets/videos/final.mp4',
          )
          ..setLooping(true)
          ..initialize().then((_) {
            if (mounted) {
              setState(() {
                _isVideoInitialized = true;
              });
              _videoController.play();
            }
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    final l10n = AppLocalizations.of(context)!;
    // Sync premium status to the provider so it can adjust totalSteps and ad logic
    final bool isPremium = context.watch<IAPService>().isPremium;
    provider.setIsPremium(isPremium);

    // Pause video when leaving step 1
    if (provider.currentStep != _lastStep) {
      _lastStep = provider.currentStep;
      if (provider.currentStep != 1 && _isVideoInitialized) {
        _videoController.pause();
      } else if (provider.currentStep == 1 && _isVideoInitialized) {
        _videoController.play();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/images/easy_4_diy2.png", height: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: _buildProgressIndicator(provider, l10n),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildStepContent(provider, l10n),
              ),
            ),
            _buildNavigation(provider, l10n),
            _buildFooterBadge(l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(
    OnboardingProvider provider,
    AppLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.onboardingStep(provider.currentStep, provider.totalSteps),
          style: Utils.getTextStyle(
            baseSize: 12,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(provider.totalSteps, (index) {
            return Expanded(
              child: Container(
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: index < provider.currentStep
                      ? Utils.kOrange
                      : Utils.kLightGrey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStepContent(OnboardingProvider provider, AppLocalizations l10n) {
    switch (provider.currentStep) {
      case 1:
        return _buildStep1(l10n);
      case 2:
        return OnboardingStep2(provider: provider, l10n: l10n);
      case 3:
        return BuildSpecifiedJobs(provider: provider, l10n: l10n);
      case 4:
        // Route to the correct step-4 widget based on the selected job.
        // Tiler: Tegels repareren and Kit aanbrengen are count/length-based,
        // not m²-based — check before needsAreaCalculation.
        if (provider.selectedJobId == 'tiler') {
          final job = provider.selectedSpecificJobs.isNotEmpty
              ? provider.selectedSpecificJobs.first
              : '';
          final bool isNoAreaTilerJob =
              job.contains('Repareren') ||
              job.contains('repareren') ||
              job.contains('Repairing') ||
              job.contains('Kit') ||
              job.contains('Sealant') ||
              job.contains('sealant');
          if (isNoAreaTilerJob) {
            return BuildTilerInput(provider: provider, l10n: l10n);
          }
          // Vloertegels, Wandtegels, Voegen → standard area form
          return OnboardingStep3(provider: provider, l10n: l10n);
        }
        if (provider.needsAreaCalculation) {
          // Wand plaatsen: show safety disclaimer card before the area form
          if (provider.isGipswand) {
            return _WandPlaatsenAreaStep(provider: provider, l10n: l10n);
          }
          return OnboardingStep3(provider: provider, l10n: l10n);
        } else if (provider.isTrapBekleden) {
          // Fix: Use dedicated trap widget (was dead code — now properly wired in)
          return BuildStepTrapBekleden(provider: provider, l10n: l10n);
        } else if (provider.isDeurPlaatsen) {
          return BuildStepDeurPlaatsen(provider: provider, l10n: l10n);
        } else if (provider.selectedJobId == 'electrician') {
          return BuildElectricianInput(provider: provider, l10n: l10n);
        } else if (provider.selectedJobId == 'carpenter') {
          // Non-area, non-staircase, non-door carpenter jobs (e.g. Plinten monteren)
          return BuildCarpenterInput(provider: provider, l10n: l10n);
        } else if (provider.selectedJobId == 'plumber') {
          return BuildPlumberInput(provider: provider, l10n: l10n);
        } else if (provider.selectedJobId == 'gardener') {
          return BuildGardenerInput(provider: provider, l10n: l10n);
        } else if (provider.selectedJobId == 'painter' &&
            (provider.isFramePainting || provider.isRadiator)) {
          return BuildPainterInput(provider: provider, l10n: l10n);
        } else {
          // All other custom-input jobs
          return BuildSetupCustomInput(provider: provider, l10n: l10n);
        }
      case 5:
        return OnboardingStep4(provider: provider, l10n: l10n);
      case 6:
        return OnboardingStep5(provider: provider, l10n: l10n);
      case 7:
        return OnboardingStep6(provider: provider, l10n: l10n);
      case 8:
        return OnboardingStep7(provider: provider, l10n: l10n);
      case 9:
        // Step 9 (subscription card) is only shown for non-premium users.
        // Premium users skip directly from step 8 to completion (totalSteps == 8).
        return OnboardingStep8(provider: provider, l10n: l10n);
      default:
        return const SizedBox();
    }
  }

  Widget _buildNavigation(OnboardingProvider provider, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed:
                provider.currentStep == 3 && provider.hasReportedSafetyStopPoint
                ? null
                : () => provider.nextStep(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Utils.kOrange,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.currentStep == provider.totalSteps
                      ? (provider.totalSteps == 9
                            ? l10n.onboardingStartFreeTrial
                            : l10n.onboardingNext.toUpperCase())
                      : provider.currentStep == 4
                      ? (provider.needsAreaCalculation
                            ? l10n.onboardingCalculateArea
                            : (l10n.localeName.startsWith('en')
                                  ? 'CALCULATE'
                                  : 'BEREKEN'))
                      : l10n.onboardingNext.toUpperCase(),
                  style: Utils.getTextStyle(
                    baseSize: 14,
                    isBold: true,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
          if (provider.currentStep > 1) ...[
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => provider.previousStep(),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Utils.kDarkBlue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, color: Utils.kDarkBlue),
                  const SizedBox(width: 8),
                  Text(
                    l10n.onboardingBack,
                    style: const TextStyle(
                      color: Utils.kDarkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFooterBadge(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBadgeItem(Icons.security, l10n.onboardingSafe),
          _buildBadgeItem(Icons.verified, l10n.onboardingReliable),
          _buildBadgeItem(Icons.handyman, l10n.onboardingEveryJob),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text(
            label,
            style: Utils.getTextStyle(
              baseSize: 12,
              isBold: true,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1(AppLocalizations l10n) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.onboardingWelcomeTitle,
          textAlign: TextAlign.center,
          style: Utils.getTextStyle(
            baseSize: 22,
            isBold: true,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : _videoController.play();
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: _isVideoInitialized
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            width: _videoController.value.size.width,
                            height: _videoController.value.size.height,
                            child: VideoPlayer(_videoController),
                          ),
                        ),
                        if (!_videoController.value.isPlaying)
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Utils.kDarkBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                      ],
                    )
                  : Container(
                      color: Colors.black12,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l10n.onboardingWelcomeDesc,
          textAlign: TextAlign.start,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// ── Wand plaatsen: area form wrapped with safety disclaimer ─────────────────
class _WandPlaatsenAreaStep extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const _WandPlaatsenAreaStep({required this.provider, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Easy4DIY Safety Restriction (Document 1, Final Version) ──────────
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 4),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFFB8C00), width: 1.2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFFB8C00),
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.safetyLoadBearingTitle,
                      style: Utils.getTextStyle(
                        baseSize: 13,
                        isBold: true,
                        color: const Color(0xFFE65100),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.safetyLoadBearingBody,
                      style: Utils.getTextStyle(
                        baseSize: 12,
                        isBold: false,
                        color: Colors.brown.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ── Standard area measurement form ───────────────────────────────
        OnboardingStep3(provider: provider, l10n: l10n),
      ],
    );
  }
}
