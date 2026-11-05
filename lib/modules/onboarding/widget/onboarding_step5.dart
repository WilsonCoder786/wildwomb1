import 'package:easy_four_diy/core/services/onboarding_data_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';

class OnboardingStep5 extends StatelessWidget {
  final OnboardingProvider provider;
  final AppLocalizations l10n;
  const OnboardingStep5({super.key, required this.provider, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final checklist = provider.checklist;
    final checklistKeys = checklist.keys.where((k) => k.startsWith('checklist')).toList();

    // Build groups: one section per selected job, matching tools from the JSON.
    final groups = _buildGroups(checklistKeys);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: Text(
            l10n.onboardingToolsCheck,
            style: Utils.getTextStyle(baseSize: 22, isBold: true, color: Utils.kDarkBlue),
          ),
        ),
        Center(
          child: Text(
            l10n.onboardingHaveRightTools,
            style: Utils.getTextStyle(baseSize: 12, isBold: false, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),

        // ── Selected job chips ────────────────────────────────────────────
        if (provider.selectedSpecificJobs.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Wrap(
              spacing: 8,
              runSpacing: 6,
              children: provider.selectedSpecificJobs
                  .map(
                    (job) => Chip(
                      avatar: const Icon(Icons.work_outline, size: 16, color: Colors.white),
                      label: Text(
                        job,
                        style: Utils.getTextStyle(baseSize: 12, isBold: false, color: Colors.white),
                      ),
                      backgroundColor: Utils.kDarkBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                  )
                  .toList(),
            ),
          ),

        // ── Grouped checklist ─────────────────────────────────────────────
        ...groups.entries.map((entry) {
          final groupLabel = entry.key;
          final tools = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Group header
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      _groupIcon(groupLabel),
                      size: 16,
                      color: Utils.kDarkBlue.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      groupLabel,
                      style: Utils.getTextStyle(
                        baseSize: 13,
                        isBold: true,
                        color: Utils.kDarkBlue.withValues(alpha: 0.75),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Divider(color: Utils.kDarkBlue.withValues(alpha: 0.15), thickness: 1),
                    ),
                  ],
                ),
              ),

              // Tool rows
              ...tools.map((toolKey) {
                final isChecked = checklist[toolKey] ?? false;
                return CheckboxListTile(
                  value: isChecked,
                  onChanged: (_) => provider.toggleChecklistItem(toolKey),
                  title: Text(
                    Utils.resolveChecklistLabel(toolKey, l10n),
                    style: Utils.getTextStyle(baseSize: 14, isBold: false, color: Utils.kDarkBlue),
                  ),
                  secondary: Icon(
                    _toolIcon(toolKey),
                    size: 20,
                    color: isChecked ? Utils.kDarkBlue : Colors.grey.shade400,
                  ),
                  activeColor: Utils.kDarkBlue,
                  checkColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                  dense: true,
                );
              }),
            ],
          );
        }),
      ],
    );
  }

  /// Splits the flat checklist keys into labelled groups using the job entries
  /// from [OnboardingDataService] (backed by checklist_tools.json).
  Map<String, List<String>> _buildGroups(List<String> allKeys) {
    final svc = OnboardingDataService.instance;
    final result = <String, List<String>>{};
    final assigned = <String>{};

    for (final jobName in provider.selectedSpecificJobs) {
      // Resolve EN display name → NL JSON key if needed
      final nlKey = OnboardingDataService.resolveJobKeyStatic(jobName);
      final jobEntry = svc.checklistConfigForJob(nlKey);
      if (jobEntry == null) continue;

      final jobTools = _allToolsFromEntry(jobEntry);
      final matched = allKeys.where((k) => jobTools.contains(k)).toList();
      if (matched.isEmpty) continue;

      result[jobName] = matched;
      assigned.addAll(matched);
    }

    // Remaining tools (global defaults / extras) go into a fallback bucket.
    final remaining = allKeys.where((k) => !assigned.contains(k)).toList();
    if (remaining.isNotEmpty) {
      final label = provider.selectedSpecificJobs.isEmpty ? l10n.onboardingToolsCheck : 'Overig';
      result[label] = remaining;
    }

    // If nothing was grouped, show everything under one header.
    if (result.isEmpty) {
      result[l10n.onboardingToolsCheck] = allKeys;
    }

    return result;
  }


  /// Collects every tool key from a job config entry,
  /// including all conditional branches.
  List<String> _allToolsFromEntry(Map<String, dynamic> entry) {
    final tools = <String>{};

    final defaultList = entry['_default'];
    if (defaultList is List) tools.addAll(defaultList.cast<String>());

    final conditions = entry['conditions'];
    if (conditions is List) {
      for (final cond in conditions) {
        if (cond is! Map<String, dynamic>) continue;
        for (final value in cond.values) {
          if (value is List) tools.addAll(value.cast<String>());
        }
      }
    }

    return tools.toList();
  }

  /// Returns an icon suitable for a checklist group header.
  IconData _groupIcon(String groupLabel) {
    final lower = groupLabel.toLowerCase();
    if (lower.contains('vloer') || lower.contains('laminaat')) {
      return Icons.layers;
    }
    if (lower.contains('deur')) return Icons.door_front_door_outlined;
    if (lower.contains('plint')) return Icons.border_bottom;
    if (lower.contains('trap')) return Icons.stairs;
    if (lower.contains('wand') || lower.contains('muur')) return Icons.wallet;
    if (lower.contains('saus') || lower.contains('schild')) {
      return Icons.format_paint;
    }
    if (lower.contains('behang')) return Icons.grid_4x4;
    if (lower.contains('tegel') || lower.contains('voeg')) {
      return Icons.grid_on;
    }
    if (lower.contains('kit')) return Icons.water_drop_outlined;
    if (lower.contains('kraan') ||
        lower.contains('leiding') ||
        lower.contains('toilet') ||
        lower.contains('cv')) {
      return Icons.plumbing;
    }
    if (lower.contains('schutting') ||
        lower.contains('bestrating') ||
        lower.contains('snoeien') ||
        lower.contains('gazon') ||
        lower.contains('overkapping')) {
      return Icons.yard_outlined;
    }
    if (lower.contains('stopcontact') ||
        lower.contains('verlichting') ||
        lower.contains('stroom') ||
        lower.contains('kabelgoot') ||
        lower.contains('rookmelder')) {
      return Icons.electrical_services;
    }
    return Icons.build_outlined;
  }

  /// Returns a contextual icon for an individual tool item.
  IconData _toolIcon(String key) {
    final lower = key.toLowerCase();
    if (lower.contains('waterpas')) return Icons.straighten;
    if (lower.contains('rolmaat') || lower.contains('meetlint')) {
      return Icons.straighten;
    }
    if (lower.contains('zaag')) return Icons.carpenter;
    if (lower.contains('hamer') || lower.contains('slagblok')) {
      return Icons.hardware;
    }
    if (lower.contains('laminaat') || lower.contains('starterkit') || lower.contains('starter')) {
      return Icons.layers;
    }
    if (lower.contains('boor') || lower.contains('schroefboormachine')) {
      return Icons.electric_bolt_outlined;
    }
    if (lower.contains('spons') || lower.contains('doek')) {
      return Icons.cleaning_services_outlined;
    }
    if (lower.contains('verf') ||
        lower.contains('kwast') ||
        lower.contains('kwasten') ||
        lower.contains('roller')) {
      return Icons.format_paint;
    }
    if (lower.contains('tape') || lower.contains('afplak')) {
      return Icons.layers_clear;
    }
    if (lower.contains('kitpistool')) return Icons.water_drop_outlined;
    if (lower.contains('potlood')) return Icons.edit_outlined;
    if (lower.contains('tegel')) return Icons.grid_on;
    if (lower.contains('waterpomptang') ||
        lower.contains('tang') ||
        lower.contains('moersleutel') ||
        lower.contains('sleutel')) {
      return Icons.plumbing;
    }
    if (lower.contains('emmer')) return Icons.water_outlined;
    if (lower.contains('trapje') || lower.contains('steiger')) {
      return Icons.stairs;
    }
    if (lower.contains('schuur')) return Icons.grain;
    if (lower.contains('striptang') ||
        lower.contains('geisoleer') ||
        lower.contains('spanningstester')) {
      return Icons.electrical_services;
    }
    if (lower.contains('handschoen') || lower.contains('kniebescherm')) {
      return Icons.back_hand_outlined;
    }
    if (lower.contains('snoeischaar') ||
        lower.contains('heggenschaar') ||
        lower.contains('snoeizaag') ||
        lower.contains('kettingzaag')) {
      return Icons.yard_outlined;
    }
    if (lower.contains('spade') ||
        lower.contains('kruiwagen') ||
        lower.contains('hark') ||
        lower.contains('grondboor')) {
      return Icons.landscape_outlined;
    }
    return Icons.build_outlined;
  }
}
