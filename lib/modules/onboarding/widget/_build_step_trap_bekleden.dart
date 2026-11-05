import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/onboarding/widget/build_setup_custom_input.dart';
import 'package:flutter/material.dart';

/// Step widget for Staircase renovation (Trap renoveren / Trap bekleden).
/// Delegates directly to [BuildSetupCustomInput] which provides the complete
/// staircase input and specification interface.
class BuildStepTrapBekleden extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const BuildStepTrapBekleden({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return BuildSetupCustomInput(
      provider: provider,
      l10n: l10n,
    );
  }
}