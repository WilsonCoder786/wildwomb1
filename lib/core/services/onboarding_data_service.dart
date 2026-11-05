import 'dart:convert';

import 'package:flutter/services.dart';

/// Loads and caches static onboarding configuration from JSON files
/// under assets/data/. Call [init] once before the provider is created.
class OnboardingDataService {
  OnboardingDataService._();
  static final OnboardingDataService instance = OnboardingDataService._();

  late Map<String, dynamic> _checklistTools;
  late Map<String, dynamic> _jobs;
  late Map<String, dynamic> _doorOptions;
  late Map<String, dynamic> _laborRates;
  late Map<String, dynamic> _calculationRules;
  late Map<String, dynamic> _staircaseOptions;
  late Map<String, dynamic> _customInputs;
  late Map<String, dynamic> _onboardingUiOptions;
  late Map<String, dynamic> _plumberMaterials;
  late Map<String, dynamic> _painterMaterials;
  late Map<String, dynamic> _electricianMaterials;
  late Map<String, dynamic> _carpenterMaterials;
  late Map<String, dynamic> _gardenerMaterials;
  late Map<String, dynamic> _tilerMaterials;

  bool _initialized = false;
  bool get isInitialized => _initialized;

  Future<void> init() async {
    if (_initialized) return;
    final results = await Future.wait([
      rootBundle.loadString('assets/data/checklist_tools.json'),
      rootBundle.loadString('assets/data/jobs.json'),
      rootBundle.loadString('assets/data/door_options.json'),
      rootBundle.loadString('assets/data/labor_rates.json'),
      rootBundle.loadString('assets/data/calculation_rules.json'),
      rootBundle.loadString('assets/data/staircase_options.json'),
      rootBundle.loadString('assets/data/custom_inputs.json'),
      rootBundle.loadString('assets/data/onboarding_ui_options.json'),
      rootBundle.loadString('assets/data/plumber_materials.json'),
      rootBundle.loadString('assets/data/painter_materials.json'),
      rootBundle.loadString('assets/data/electrician_materials.json'),
      rootBundle.loadString('assets/data/carpenter_materials.json'),
      rootBundle.loadString('assets/data/gardener_materials.json'),
      rootBundle.loadString('assets/data/tiler_materials.json'),
    ]);
    _checklistTools = json.decode(results[0]) as Map<String, dynamic>;
    _jobs = json.decode(results[1]) as Map<String, dynamic>;
    _doorOptions = json.decode(results[2]) as Map<String, dynamic>;
    _laborRates = json.decode(results[3]) as Map<String, dynamic>;
    _calculationRules = json.decode(results[4]) as Map<String, dynamic>;
    _staircaseOptions = json.decode(results[5]) as Map<String, dynamic>;
    _customInputs = json.decode(results[6]) as Map<String, dynamic>;
    _onboardingUiOptions = json.decode(results[7]) as Map<String, dynamic>;
    _plumberMaterials = json.decode(results[8]) as Map<String, dynamic>;
    _painterMaterials = json.decode(results[9]) as Map<String, dynamic>;
    _electricianMaterials = json.decode(results[10]) as Map<String, dynamic>;
    _carpenterMaterials = json.decode(results[11]) as Map<String, dynamic>;
    _gardenerMaterials = json.decode(results[12]) as Map<String, dynamic>;
    _tilerMaterials = json.decode(results[13]) as Map<String, dynamic>;
    _initialized = true;
  }

  // ── jobs.json ────────────────────────────────────────────────────────────

  Set<String> get noAreaJobs {
    final raw = _jobs['no_area_jobs'];
    if (raw is List) return raw.cast<String>().toSet();
    return {};
  }

  // ── checklist_tools.json ─────────────────────────────────────────────────

  Map<String, dynamic>? checklistConfigForJob(String jobId) {
    final v = _checklistTools[jobId];
    if (v is Map<String, dynamic>) return v;
    return null;
  }

  List<String> get globalDefaultChecklist {
    final v = _checklistTools['_global_default'];
    if (v is List) return v.cast<String>();
    return [];
  }

  String get alwaysIndoorExtra =>
      (_checklistTools['_always_indoor_extra'] as String?) ?? 'checklistStofferEnBlik';

  /// EN display name → NL JSON key mapping for all 30 sub-jobs.
  static const Map<String, String> _enToNlJobName = {
    // Carpenter
    'Floor laying': 'Vloer leggen',
    'Laying flooring': 'Vloer leggen',
    'Laying floor': 'Vloer leggen',
    'Door installation': 'Deur plaatsen',
    'Install Door': 'Deur plaatsen',
    'Install door': 'Deur plaatsen',
    'Installing a door': 'Deur plaatsen',
    'Skirting board installation': 'Plinten monteren',
    'Installing baseboards': 'Plinten monteren',
    'Baseboard installation': 'Plinten monteren',
    'Stair renovation': 'Trap renoveren',
    'Staircase renovation': 'Trap renoveren',
    'Renovating stairs': 'Trap renoveren',
    'Stair renovation / stair cladding': 'Trap renoveren',
    'Wall installation': 'Wand plaatsen',
    'Building a wall': 'Wand plaatsen',
    'Partition wall': 'Wand plaatsen',
    // Painter
    'Wall plastering': 'Muur sauzen',
    'Ceiling plastering': 'Plafond sauzen',
    'Wallpapering': 'Behangen',
    'Window frame/door painting': 'Kozijn/deur schilderen',
    'Frame/door painting': 'Kozijn/deur schilderen',
    'Window frame painting': 'Kozijn schilderen',
    'Radiator painting': 'Radiator schilderen',
    // Tiler
    'Laying floor tiles': 'Vloertegels leggen',
    'Floor tile laying': 'Vloertegels leggen',
    'Installing wall tiles': 'Wandtegels plaatsen',
    'Wall tile installation': 'Wandtegels plaatsen',
    'Repairing tiles': 'Tegels repareren',
    'Tile repair': 'Tegels repareren',
    'Grouting': 'Voegen',
    'Applying sealant': 'Kit aanbrengen',
    'Sealant application': 'Kit aanbrengen',
    // Plumber
    'Tap replacement': 'Kraan vervangen',
    'Faucet replacement': 'Kraan vervangen',
    'Kitchen tap replacement': 'Keukenkraan vervangen',
    'Pipe unblocking': 'Leiding ontstoppen',
    'Pipe clearing': 'Leiding ontstoppen',
    'Drain unblocking': 'Afvoer ontstoppen',
    'Toilet installation': 'Toilet installeren',
    'Central heating refill': 'CV-installatie bijvullen',
    'Pipe laying': 'Leiding aanleggen',
    'Plumbing installation': 'Leiding aanleggen',
    'Water pipe installation (copper)': 'Waterleiding aanleggen (koper)',
    'Water pipe installation': 'Waterleiding aanleggen (koper)',
    // Gardener
    'Fence installation': 'Schutting plaatsen',
    'Paving installation': 'Bestrating aanleggen',
    'Paving': 'Bestrating aanleggen',
    'Pruning': 'Snoeien',
    'Canopy construction': 'Overkapping bouwen',
    'Canopy building': 'Overkapping bouwen',
    'Lawn laying': 'Gazon leggen',
    'Lawn installation': 'Gazon leggen',
    // Electrician
    'Outlet installation': 'Stopcontact plaatsen',
    'Lighting installation': 'Verlichting plaatsen',
    'Cable laying': 'Stroomleiding leggen',
    'Cable duct installation': 'Kabelgoot monteren',
    'Smoke detector installation': 'Rookmelder plaatsen',
  };

  /// Returns the NL JSON key for a job name that may be in EN or NL.
  String _resolveJobKey(String jobName) {
    // Direct match (NL users)
    if (_checklistTools.containsKey(jobName)) return jobName;
    // EN alias lookup
    final mapped = _enToNlJobName[jobName];
    if (mapped != null) return mapped;
    // Partial substring match against all known keys
    for (final key in _checklistTools.keys) {
      if (key.startsWith('_')) continue;
      if (jobName.toLowerCase().contains(key.toLowerCase()) ||
          key.toLowerCase().contains(jobName.toLowerCase())) {
        return key;
      }
    }
    return jobName; // give up — will return null from checklistConfigForJob
  }

  /// Static version of [_resolveJobKey] for use by widgets that don't have
  /// access to the private instance method (e.g. OnboardingStep5).
  static String resolveJobKeyStatic(String jobName) {
    // Direct match
    if (OnboardingDataService.instance._checklistTools.containsKey(jobName)) {
      return jobName;
    }
    // EN alias lookup
    final mapped = _enToNlJobName[jobName];
    if (mapped != null) return mapped;
    // Partial match
    for (final key in OnboardingDataService.instance._checklistTools.keys) {
      if (key.startsWith('_')) continue;
      if (jobName.toLowerCase().contains(key.toLowerCase()) ||
          key.toLowerCase().contains(jobName.toLowerCase())) {
        return key;
      }
    }
    return jobName;
  }

  Map<String, bool> resolveChecklist({
    required String? jobId,
    required List<String> selectedSpecificJobs,
    required bool isPlakplinten,
    required bool isHogePlintenSchroeven,
    required bool isHogePlintenLijm,
    required String deurLocatie,
    required String deurKozijn,
  }) {
    if (selectedSpecificJobs.isEmpty) {
      return {for (final t in globalDefaultChecklist) t: false};
    }

    final result = <String, bool>{};

    for (final rawJobName in selectedSpecificJobs) {
      final nlKey = _resolveJobKey(rawJobName);
      final jobConfig = checklistConfigForJob(nlKey);
      if (jobConfig == null) continue;

      final conditions = jobConfig['conditions'];

      // ── Jobs with conditional branches ────────────────────────────────────
      if (conditions is List) {
        for (final cond in conditions) {
          if (cond is! Map<String, dynamic>) continue;
          final matchTerms = cond['match'];
          if (matchTerms is! List) continue;
          final matches = selectedSpecificJobs.any(
            (j) => matchTerms.any((term) => j.contains(term as String)),
          );
          if (!matches) continue;

          if (cond.containsKey('plakplinten')) {
            final List<String> tools;
            if (isPlakplinten) {
              tools = (cond['plakplinten'] as List).cast<String>();
            } else if (isHogePlintenSchroeven) {
              tools = (cond['hoge_plinten_schroeven'] as List).cast<String>();
            } else {
              tools = (cond['hoge_plinten_lijm'] as List).cast<String>();
            }
            for (final t in tools) { result[t] = false; }
            break;
          }
          if (cond.containsKey('base')) {
            for (final t in (cond['base'] as List).cast<String>()) {
              result[t] = false;
            }
            if (isPlakplinten && cond.containsKey('plakplinten_extra')) {
              for (final t
                  in (cond['plakplinten_extra'] as List).cast<String>()) {
                result[t] = false;
              }
            } else if (isHogePlintenSchroeven &&
                cond.containsKey('hoge_plinten_schroeven_extra')) {
              for (final t in (cond['hoge_plinten_schroeven_extra'] as List)
                  .cast<String>()) {
                result[t] = false;
              }
            } else if (cond.containsKey('hoge_plinten_lijm_extra')) {
              for (final t in (cond['hoge_plinten_lijm_extra'] as List)
                  .cast<String>()) {
                result[t] = false;
              }
            }
            break;
          }
          if (cond.containsKey('conditional_outside') ||
              cond.containsKey('conditional_new_frame')) {
            final base = (cond['tools'] as List).cast<String>();
            for (final t in base) { result[t] = false; }
            if (deurLocatie == 'Buiten' &&
                cond.containsKey('conditional_outside')) {
              for (final t
                  in (cond['conditional_outside'] as List).cast<String>()) {
                result[t] = false;
              }
            }
            if (deurKozijn == 'Nieuw' &&
                cond.containsKey('conditional_new_frame')) {
              for (final t
                  in (cond['conditional_new_frame'] as List).cast<String>()) {
                result[t] = false;
              }
            }
            break;
          }
          final tools = cond['tools'];
          if (tools is List) {
            for (final t in tools.cast<String>()) { result[t] = false; }
            break;
          }
        }
        // If no condition matched, fall through to _default
        if (result.isNotEmpty) continue;
      }

      // ── Simple _default list ───────────────────────────────────────────────
      final defaultTools = jobConfig['_default'];
      if (defaultTools is List) {
        for (final t in defaultTools.cast<String>()) {
          result[t] = false;
        }
      }
    }

    // Fallback to global defaults only if nothing was resolved
    if (result.isEmpty) {
      return {for (final t in globalDefaultChecklist) t: false};
    }
    return result;
  }


  // ── door_options.json ────────────────────────────────────────────────────

  /// Base price for a standard interior door per Document 2 (€188 C / €127.50 P).
  double get deurBasePrice => (_doorOptions['base_price'] as num?)?.toDouble() ?? 193.0;

  /// Base professional price for a standard interior door per Document 2.
  double get deurBasePricePro => (_doorOptions['base_price_pro'] as num?)?.toDouble() ?? 130.50;

  /// Surcharge amounts keyed by type (outside, solid, glass, transom_glass,
  /// manual_glass, new_frame).
  Map<String, double> get deurSurchargeValues {
    final raw = _doorOptions['surcharges'] as Map<String, dynamic>?;
    if (raw == null) {
      return {
        'outside': 150.0,
        'solid': 80.0,
        'glass': 60.0,
        'transom_glass': 75.0,
        'manual_glass': 45.0,
        'new_frame': 120.0,
      };
    }
    return raw.map((k, v) => MapEntry(k, (v as num).toDouble()));
  }

  // ── labor_rates.json ─────────────────────────────────────────────────────

  /// Hourly labour rate (€/h) for a given job category.
  double laborRateForJob(String jobId) {
    final rate = _laborRates[jobId];
    if (rate is num) return rate.toDouble();
    final def = _laborRates['default'];
    return (def is num) ? def.toDouble() : 45.0;
  }

  // ── calculation_rules.json ───────────────────────────────────────────────

  /// All per-job material/labour cost parameters.
  Map<String, dynamic> get customJobCosts {
    return (_calculationRules['custom_job_costs'] as Map<String, dynamic>?) ?? {};
  }

  /// DIY baseline labour rate (€/h) used throughout calculations.
  double get diyLaborCostRate =>
      (_calculationRules['diy_labor_cost_rate'] as num?)?.toDouble() ?? 35.0;

  /// Convenience accessor for a single job-cost config block.
  Map<String, dynamic> jobCostConfig(String key) {
    final v = customJobCosts[key];
    if (v is Map<String, dynamic>) return v;
    return {};
  }

  // ── staircase_options.json ───────────────────────────────────────────────

  /// Default staircase dimensions / settings.
  Map<String, dynamic> get staircaseDefaults {
    return (_staircaseOptions['defaults'] as Map<String, dynamic>?) ?? {};
  }

  List<String> get staircaseTypes =>
      (_staircaseOptions['types'] as List?)?.cast<String>() ?? ['Dicht', 'Open'];

  List<String> get staircaseCoveringMaterials =>
      (_staircaseOptions['covering_materials'] as List?)?.cast<String>() ??
      ['Tapijt', 'PVC / Vinyl', 'Overzettreden'];

  Map<String, dynamic> get staircaseCalculation {
    return (_staircaseOptions['calculation'] as Map<String, dynamic>?) ?? {};
  }

  double get staircaseCuttingWasteFactor =>
      (staircaseCalculation['cutting_waste_factor'] as num?)?.toDouble() ?? 1.1;

  double get staircaseHoursPerTread =>
      (staircaseCalculation['estimated_hours_per_tread'] as num?)?.toDouble() ?? 0.55;

  int get staircaseMinimumHours => (staircaseCalculation['minimum_hours'] as num?)?.toInt() ?? 6;

  // ── custom_inputs.json ───────────────────────────────────────────────────

  /// Returns the NL material/type option list for a job type.
  List<String> customInputOptions(String jobType, String listKey) {
    final v = _customInputs[jobType];
    if (v is Map<String, dynamic>) {
      final opts = v[listKey];
      if (opts is List) return opts.cast<String>();
    }
    return [];
  }

  // ── onboarding_ui_options.json ───────────────────────────────────────────

  /// Quick tread count choices shown in the staircase stepper chip row.
  List<int> get staircaseTreadQuickChoices {
    final opts = _onboardingUiOptions['options'];
    if (opts is Map<String, dynamic>) {
      final raw = opts['staircase_tread_quick_choices'];
      if (raw is List) return raw.cast<int>();
    }
    return [12, 13, 14, 15, 16];
  }

  List<String> _uiList(String key, List<String> fallback) {
    final opts = _onboardingUiOptions['options'];
    if (opts is Map<String, dynamic>) {
      final raw = opts[key];
      if (raw is List) return raw.cast<String>();
    }
    return fallback;
  }

  List<String> get uiDoorLocation => _uiList('door_location', ['Binnen', 'Buiten']);

  List<String> get uiDoorOutsideType =>
      _uiList('door_outside_type', ['Voordeur', 'Achterdeur', 'Balkondeur']);

  List<String> get uiDoorConstruction => _uiList('door_construction', ['Stomp', 'Opdek', 'Inleg']);

  List<String> get uiDoorMaterial => _uiList('door_material', [
    'Massief',
    'Volspaan',
    'Honingraat',
    'Spaanplaat',
    'Board',
    'Paneel',
    'Met glas',
    'Met bovenlicht',
  ]);

  List<String> get uiDoorGlassMounting =>
      _uiList('door_glass_mounting', ['Glaslatten', 'Direct in deur']);

  List<String> get uiDoorTreatment =>
      _uiList('door_treatment', ['Gegrond', 'Onbehandeld', 'Blank hout']);

  List<String> get uiDoorHandle => _uiList('door_handle', ['Krukstel', 'Deurknop']);

  List<String> get uiDoorFrame => _uiList('door_frame', ['Bestaand', 'Nieuw']);

  List<String> get uiStaircaseTypes => _uiList('staircase_type', ['Dicht', 'Open']);

  List<String> get uiStaircaseCoveringMaterials =>
      _uiList('staircase_covering', ['Tapijt', 'PVC / Vinyl', 'Overzettreden']);

  // ── plumber_materials.json ───────────────────────────────────────────────

  Map<String, dynamic> get plumberMaterials => _plumberMaterials;

  // ── painter_materials.json ───────────────────────────────────────────────

  Map<String, dynamic> get painterMaterials => _painterMaterials;

  // ── electrician_materials.json ───────────────────────────────────────────

  Map<String, dynamic> get electricianMaterials => _electricianMaterials;

  // ── carpenter_materials.json ─────────────────────────────────────────────

  Map<String, dynamic> get carpenterMaterials => _carpenterMaterials;

  // ── gardener_materials.json ──────────────────────────────────────────────

  Map<String, dynamic> get gardenerMaterials => _gardenerMaterials;

  // ── tiler_materials.json ─────────────────────────────────────────────────

  Map<String, dynamic> get tilerMaterials => _tilerMaterials;
}
