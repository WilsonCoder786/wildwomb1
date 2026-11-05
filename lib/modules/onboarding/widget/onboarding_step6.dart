import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/models/faq_item.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/modules/onboarding/widget/faq_data.dart';
import 'package:flutter/material.dart';

class OnboardingStep6 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;

  const OnboardingStep6({
    super.key,
    required this.provider,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final jobId = provider.selectedJobId ?? "";
    final jobFaqs = getOnboardingFaqs(
      l10n: l10n,
      jobId: jobId,
      selectedSpecificJobs: provider.selectedSpecificJobs,
      isPlakplinten: provider.isPlakplinten,
    );
    final generalFaqs = getOnboardingFaqs(
      l10n: l10n,
      jobId: jobId,
      selectedSpecificJobs: const [],
      isPlakplinten: provider.isPlakplinten,
    );
    final seenQuestions = <String>{};
    final faqs = <FaqItem>[];

    for (final faq in [...jobFaqs, ...generalFaqs]) {
      final question = faq.question.trim().toLowerCase();
      if (_isToolsFaq(question) ||
          _isOverallDurationFaq(question) ||
          !seenQuestions.add(question)) {
        continue;
      }

      faqs.add(faq);
      if (faqs.length == 10) break;
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.onboardingFaqTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        ...List.generate(
          faqs.length,
          (index) => _FaqTile(index: index, faq: faqs[index]),
        ),
      ],
    );
  }

  bool _isToolsFaq(String question) {
    final q = question.toLowerCase();

    return q.contains('welk gereedschap heb ik nodig') ||
        q.contains('what tools do i need');
  }

  bool _isOverallDurationFaq(String question) {
    return RegExp(
      r'^(?:how long\b.*\b(?:take|takes)\b|hoe lang duurt\b)',
      caseSensitive: false,
    ).hasMatch(question.trim());
  }
}

class _FaqTile extends StatelessWidget {
  final int index;
  final FaqItem faq;

  const _FaqTile({required this.index, required this.faq});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          leading: CircleAvatar(
            radius: 12,
            backgroundColor: primary,
            child: Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),

          title: Text(
            faq.question,
            style: theme.textTheme.bodySmall?.copyWith(color: primary),
          ),

          trailing: Icon(Icons.expand_more, color: primary),

          collapsedBackgroundColor: Colors.white,

          backgroundColor: primary.withValues(alpha: 0.04),

          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),

          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                faq.answer,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
