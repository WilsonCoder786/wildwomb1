import 'dart:math';

import 'package:easy_four_diy/core/app_navigator.dart';
import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/calculation_engine.dart';
import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:easy_four_diy/core/services/material_catalog_repository.dart';
import 'package:easy_four_diy/core/services/onboarding_data_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/models/calculation_result_model.dart';
import 'package:easy_four_diy/models/job_model.dart';
import 'package:easy_four_diy/modules/root/root_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentStep = 1;
  int get currentStep => _currentStep;

  bool _isPremium = false;

  String _deurLocatie = 'Binnen';
  String get deurLocatie => _deurLocatie;

  String _deurType = 'Stomp';
  String get deurType => _deurType;

  String _deurBuitenType = 'Voordeur';
  String get deurBuitenType => _deurBuitenType;

  String? _selectedDuration;
  String? get selectedDuration => _selectedDuration;

  String _selectedMeasurementType = 'Vloer (lxb)';
  String get selectedMeasurementType => _selectedMeasurementType;

  String? _selectedJob;
  String? _selectedJobId = 'carpenter';
  String? get selectedJob => _selectedJob;
  String? get selectedJobId => _selectedJobId;

  double _customLength = 1.20;
  double _customDepth = 0.30;
  double _customHeight = 2.10;
  int _customCount = 1;
  String _customMaterial = 'Hout';

  double get customLength => _customLength;
  double get customDepth => _customDepth;
  double get customHeight => _customHeight;
  int get customCount => _customCount;
  String get customMaterial => _customMaterial;

  double _length = 5.0;
  double _width = 4.0;
  double _height = 2.4;
  bool _includeExtra = true;
  CalculationResultModel? _calcResult;

  String _deurKozijn = 'Bestaand';
  String get deurKozijn => _deurKozijn;

  double get length => _length;
  double get width => _width;
  double get height => _height;
  bool get includeExtra => _includeExtra;
  CalculationResultModel? get calcResult => _calcResult;

  double _trapTredeDiepte = 0.30;
  double get trapTredeDiepte => _trapTredeDiepte;

  final Map<String, bool> _checklist = {
    'checklistDecoupeerzaag': false,
    'checklistRolmaat': false,
    'checklistPlintenknipper': false,
    'checklistKitpistool': false,
    'checklistPotlood': false,
    'checklistWaterpas': false,
  };

  Map<String, bool> get checklist => _checklist;

  String _deurBehandeling = 'Gegrond';
  String get deurBehandeling => _deurBehandeling;

  String _deurUitvoering = 'Board';
  String get deurUitvoering => _deurUitvoering;
  String get deurFinish => _deurUitvoering;

  bool _deurGlas = false;
  bool get deurGlas => _deurGlas;
  String get deurGlassChoice => _deurGlas ? 'Yes' : 'No';

  String _deurGlasMontage = 'Glaslatten';
  String get deurGlasMontage => _deurGlasMontage;

  String _deurBeslagType = 'Krukstel';
  String get deurBeslagType => _deurBeslagType;

  // Door dimensions
  bool _deurStandaardMaat = true; // true = standard, false = custom
  bool get deurStandaardMaat => _deurStandaardMaat;
  double _deurHoogte = 2.015; // standard NL door height in metres
  double get deurHoogte => _deurHoogte;
  double _deurBreedte = 0.830; // standard NL door width in metres
  double get deurBreedte => _deurBreedte;
  double _deurDikte = 0.040; // standard door thickness in metres
  double get deurDikte => _deurDikte;

  void setDeurStandaardMaat(bool v) {
    _deurStandaardMaat = v;
    if (v) {
      _deurHoogte = 2.015;
      _deurBreedte = 0.830;
      _deurDikte = 0.040;
    }
    notifyListeners();
  }

  void setDeurHoogte(double v) {
    _deurHoogte = v;
    notifyListeners();
  }

  void setDeurBreedte(double v) {
    _deurBreedte = v;
    notifyListeners();
  }

  void setDeurDikte(double v) {
    _deurDikte = v;
    notifyListeners();
  }

  final List<String> _selectedSpecificJobs = [];
  List<String> get selectedSpecificJobs => _selectedSpecificJobs;

  final Set<String> _reportedSafetyStopPoints = {};
  bool get hasReportedSafetyStopPoint => _reportedSafetyStopPoints.isNotEmpty;

  bool isSafetyStopPointSelected(String id) =>
      _reportedSafetyStopPoints.contains(id);

  void setSafetyStopPointSelected(String id, bool applies) {
    if (applies) {
      _reportedSafetyStopPoints.add(id);
    } else {
      _reportedSafetyStopPoints.remove(id);
    }
    notifyListeners();
  }

  String _trapBekledingType = 'Tapijt';
  String get trapBekledingType => _trapBekledingType;

  bool _trapInclusiefSnijverlies = true;
  bool get trapInclusiefSnijverlies => _trapInclusiefSnijverlies;

  /// Calculated surface area of treads: N * D * W
  double get trapTredenOppervlakte => double.parse(
    (_trapAantalTreden * _trapTredeDiepte * _trapBreedte).toStringAsFixed(2),
  );

  /// Calculated surface area of risers: N * H * W (if closed staircase)
  double get trapStootbordenOppervlakte => isTrapDicht
      ? double.parse(
          (_trapAantalTreden * _trapStootbordHoogte * _trapBreedte)
              .toStringAsFixed(2),
        )
      : 0.0;

  /// Net surface area (Treads + Risers)
  double get trapNettoOppervlakte => double.parse(
    (trapTredenOppervlakte + trapStootbordenOppervlakte).toStringAsFixed(2),
  );

  /// Total surface area (including optional +10% reserve)
  double get trapTotaalOppervlakte => _trapInclusiefSnijverlies
      ? double.parse((trapNettoOppervlakte * 1.10).toStringAsFixed(2))
      : trapNettoOppervlakte;

  /// Realistic estimated labor hours: ~0.55h per tread, minimum 6 hours (approx 1 full working day for 14 treads)
  int get trapEstimatedHours => max(6, (_trapAantalTreden * 0.55).ceil());

  String _trapType = 'Dicht';
  String get trapType => _trapType;
  bool get isTrapDicht {
    final lower = _trapType.toLowerCase();
    return lower == 'dicht' ||
        lower == 'closed' ||
        lower == 'dichte trap' ||
        lower == 'with risers';
  }

  /// Returns true when current job is 'Trap bekleden' / 'Covering the stairs' / etc.
  bool get isTrapBekleden {
    if (_selectedSpecificJobs.isEmpty) return false;
    final job = _selectedSpecificJobs.first.toLowerCase();
    return job.contains('trap bekleden') ||
        job.contains('trap renoveren') ||
        job.contains('trapbekleding') ||
        job.contains('covering the stairs') ||
        job.contains('cover staircase') ||
        job.contains('staircase covering') ||
        job.contains('staircase renovation') ||
        job.contains('stair covering') ||
        (_selectedJobId == 'carpenter' &&
            (job.contains('trap') || job.contains('stair')));
  }

  /// Returns true when the current job is 'Deur plaatsen' / 'Door installation'
  bool get isDeurPlaatsen => _selectedSpecificJobs.any(
    (j) =>
        j.contains('Deur plaatsen') ||
        j.contains('Door installation') ||
        j.contains('Install Door'),
  );

  List<Map<String, dynamic>> get customInputConfig {
    final job = _selectedSpecificJobs.isNotEmpty
        ? _selectedSpecificJobs.first
        : '';

    if (job.contains('Plank ophangen') || job.contains('Shelf hanging')) {
      return [
        {
          'key': 'length',
          'label': 'Lengte plank (m)',
          'labelEn': 'Shelf length (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'depth',
          'label': 'Diepte plank (m)',
          'labelEn': 'Shelf depth (m)',
          'type': 'decimal',
          'value': _customDepth,
        },
        {
          'key': 'count',
          'label': 'Aantal planken',
          'labelEn': 'Number of shelves',
          'type': 'integer',
          'value': _customCount,
        },
        {
          'key': 'material',
          'label': 'Materiaal',
          'labelEn': 'Material',
          'type': 'dropdown',
          'value': _customMaterial,
          'options': ['Hout', 'MDF', 'Spaanplaat', 'Staal', 'Glas'],
          'optionsEn': ['Wood', 'MDF', 'Chipboard', 'Steel', 'Glass'],
        },
      ];
    } else if (job.contains('Trap') ||
        job.contains('Staircase') ||
        isTrapBekleden) {
      // Trap bekleden / renoveren custom input:
      return [
        {
          'key': 'count',
          'label': 'Aantal treden',
          'labelEn': 'Number of treads',
          'type': 'integer',
          'value': _trapAantalTreden,
        },
        {
          'key': 'depth',
          'label': 'Diepte trede (m)',
          'labelEn': 'Tread depth (m)',
          'type': 'decimal',
          'value': _trapTredeDiepte,
        },
        {
          'key': 'height',
          'label': 'Hoogte stootbord (m)',
          'labelEn': 'Riser height (m)',
          'type': 'decimal',
          'value': _trapStootbordHoogte,
        },
        {
          'key': 'length',
          'label': 'Breedte trap (m)',
          'labelEn': 'Staircase width (m)',
          'type': 'decimal',
          'value': _trapBreedte,
        },
      ];
    } else if (job.contains('Deur plaatsen') ||
        job.contains('Door installation') ||
        job.contains('Install Door')) {
      // For 'Deur plaatsen', the full conditional question tree is rendered
      // directly in the view (_buildStepDeurPlaatsen). This config only
      // provides basic dimension fields used when calculateFromCustomInputs is called.
      return [
        {
          'key': 'count',
          'label': 'Aantal deuren',
          'labelEn': 'Number of doors',
          'type': 'integer',
          'value': _customCount,
        },
      ];
    } else if (job.contains('Kozijn plaatsen') ||
        job.contains('Raamkozijn') ||
        job.contains('Window frame')) {
      return [
        {
          'key': 'length',
          'label': 'Breedte kozijn (m)',
          'labelEn': 'Frame width (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'height',
          'label': 'Hoogte kozijn (m)',
          'labelEn': 'Frame height (m)',
          'type': 'decimal',
          'value': _customHeight,
        },
        {
          'key': 'count',
          'label': 'Aantal kozijnen',
          'labelEn': 'Number of frames',
          'type': 'integer',
          'value': _customCount,
        },
        {
          'key': 'material',
          'label': 'Materiaal',
          'labelEn': 'Material',
          'type': 'dropdown',
          'value': _customMaterial,
          'options': ['Hout', 'Kunststof', 'Staal', 'Aluminium'],
          'optionsEn': ['Wood', 'Plastic / PVC', 'Steel', 'Aluminium'],
        },
      ];
    } else if (job.contains('Kast') ||
        job.contains('kast') ||
        job.contains('Cabinet building') ||
        job.contains('cabinet')) {
      return [
        {
          'key': 'length',
          'label': 'Breedte kast (m)',
          'labelEn': 'Cabinet width (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'height',
          'label': 'Hoogte kast (m)',
          'labelEn': 'Cabinet height (m)',
          'type': 'decimal',
          'value': _customHeight,
        },
        {
          'key': 'depth',
          'label': 'Diepte kast (m)',
          'labelEn': 'Cabinet depth (m)',
          'type': 'decimal',
          'value': _customDepth,
        },
        {
          'key': 'count',
          'label': 'Aantal deuren',
          'labelEn': 'Number of doors',
          'type': 'integer',
          'value': _customCount,
        },
        {
          'key': 'material',
          'label': 'Materiaal',
          'labelEn': 'Material',
          'type': 'dropdown',
          'value': _customMaterial,
          'options': ['MDF', 'Spaanplaat', 'Massief hout', 'Multiplex'],
          'optionsEn': ['MDF', 'Chipboard', 'Solid wood', 'Plywood'],
        },
      ];
    } else if (job.contains('TV meubel') || job.contains('TV unit')) {
      return [
        {
          'key': 'length',
          'label': 'Breedte meubel (m)',
          'labelEn': 'Unit width (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'height',
          'label': 'Hoogte meubel (m)',
          'labelEn': 'Unit height (m)',
          'type': 'decimal',
          'value': _customHeight,
        },
        {
          'key': 'count',
          'label': 'Aantal stuks',
          'labelEn': 'Quantity',
          'type': 'integer',
          'value': _customCount,
        },
      ];
    } else if (job.contains('Badmeubel') ||
        job.contains('Bathroom furniture')) {
      return [
        {
          'key': 'length',
          'label': 'Breedte meubel (m)',
          'labelEn': 'Unit width (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'height',
          'label': 'Hoogte meubel (m)',
          'labelEn': 'Unit height (m)',
          'type': 'decimal',
          'value': _customHeight,
        },
        {
          'key': 'count',
          'label': 'Aantal stuks',
          'labelEn': 'Quantity',
          'type': 'integer',
          'value': _customCount,
        },
      ];
    } else if (job.contains('Plint') ||
        job.contains('plint') ||
        job.contains('Skirting board')) {
      return [
        {
          'key': 'length',
          'label': 'Totale lengte (m)',
          'labelEn': 'Total length (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'count',
          'label': 'Aantal kamers',
          'labelEn': 'Number of rooms',
          'type': 'integer',
          'value': _customCount,
        },
        {
          'key': 'material',
          'label': 'Materiaal',
          'labelEn': 'Material',
          'type': 'dropdown',
          'value': _customMaterial,
          'options': ['Hout', 'MDF', 'Kunststof'],
          'optionsEn': ['Wood', 'MDF', 'Plastic / PVC'],
        },
      ];
    } else if (job.contains('Keukenblok') ||
        job.contains('keukenblok') ||
        job.contains('Kitchen unit installation')) {
      return [
        {
          'key': 'length',
          'label': 'Breedte keuken (m)',
          'labelEn': 'Kitchen width (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'count',
          'label': 'Aantal vakken',
          'labelEn': 'Number of compartments',
          'type': 'integer',
          'value': _customCount,
        },
      ];
    } else if (job.contains('Koof') ||
        job.contains('koof') ||
        job.contains('Coving') ||
        job.contains('Bulkhead')) {
      return [
        {
          'key': 'length',
          'label': 'Lengte koof (m)',
          'labelEn': 'Coving length (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'height',
          'label': 'Hoogte / Diepte koof (m)',
          'labelEn': 'Coving height / depth (m)',
          'type': 'decimal',
          'value': _customHeight,
        },
        {
          'key': 'count',
          'label': 'Aantal koven',
          'labelEn': 'Number of covings',
          'type': 'integer',
          'value': _customCount,
        },
        {
          'key': 'material',
          'label': 'Materiaal bekleding',
          'labelEn': 'Cladding material',
          'type': 'dropdown',
          'value':
              _customMaterial.contains('Gips') ||
                  _customMaterial.contains('MDF') ||
                  _customMaterial.contains('Multiplex') ||
                  _customMaterial.contains('Stuc')
              ? _customMaterial
              : 'Gipsplaat / Metal stud',
          'options': [
            'Gipsplaat / Metal stud',
            'MDF / Hout',
            'Multiplex / Hout',
            'Stucplaat',
          ],
          'optionsEn': [
            'Plasterboard / Metal stud',
            'MDF / Wood',
            'Plywood / Wood',
            'Plaster baseboard',
          ],
        },
      ];
    } else if (job.contains('Dakkapel') || job.contains('Dormer window')) {
      return [
        {
          'key': 'length',
          'label': 'Breedte dakkapel (m)',
          'labelEn': 'Dormer width (m)',
          'type': 'decimal',
          'value': _customLength,
        },
        {
          'key': 'height',
          'label': 'Hoogte dakkapel (m)',
          'labelEn': 'Dormer height (m)',
          'type': 'decimal',
          'value': _customHeight,
        },
        {
          'key': 'count',
          'label': 'Aantal',
          'labelEn': 'Quantity',
          'type': 'integer',
          'value': _customCount,
        },
      ];
    } else if (job.contains('Deurbel') ||
        job.contains('deurbel') ||
        job.contains('Doorbell') ||
        job.contains('doorbell')) {
      return [
        {
          'key': 'count',
          'label': 'Aantal deurbellen',
          'labelEn': 'Number of doorbells',
          'type': 'integer',
          'value': _customCount,
        },
        {
          'key': 'material',
          'label': 'Type deurbel',
          'labelEn': 'Doorbell type',
          'type': 'dropdown',
          'value':
              _customMaterial.contains('Draadloos') ||
                  _customMaterial.contains('Bedraad') ||
                  _customMaterial.contains('Video')
              ? _customMaterial
              : 'Draadloze deurbel (batterij)',
          'options': [
            'Draadloze deurbel (batterij)',
            'Bedrade deurbel met trafo',
            'Slimme videodeurbel',
          ],
          'optionsEn': [
            'Wireless doorbell (battery)',
            'Wired doorbell with transformer',
            'Smart video doorbell',
          ],
        },
      ];
    } else if (job.contains('Verlichting') ||
        job.contains('Lamp') ||
        job.contains('Lighting') ||
        _selectedJobId == 'electrician') {
      if (job.contains('Stopcontact') || job.contains('Outlet')) {
        return [
          {
            'key': 'count',
            'label': 'Aantal stopcontacten',
            'labelEn': 'Number of electrical outlets',
            'type': 'integer',
            'value': _customCount,
          },
        ];
      } else if (job.contains('Schakelaar') || job.contains('Switch')) {
        return [
          {
            'key': 'count',
            'label': 'Aantal schakelaars',
            'labelEn': 'Number of light switches',
            'type': 'integer',
            'value': _customCount,
          },
        ];
      } else if (job.contains('Rookmelder') || job.contains('Smoke')) {
        return [
          {
            'key': 'count',
            'label': 'Aantal rookmelders',
            'labelEn': 'Number of smoke detectors',
            'type': 'integer',
            'value': _customCount,
          },
        ];
      } else if (job.contains('Stroomleiding') ||
          job.contains('Power cable') ||
          job.contains('Cable laying')) {
        // Job 28: per meter
        return [
          {
            'key': 'length',
            'label': 'Leidinglengte (m)',
            'labelEn': 'Cable run length (m)',
            'type': 'decimal',
            'value': _customLength,
          },
        ];
      } else if (job.contains('Kabelgoot') || job.contains('Cable trunking')) {
        // Job 29: per meter
        return [
          {
            'key': 'length',
            'label': 'Lengte kabelgoot (m)',
            'labelEn': 'Cable trunking length (m)',
            'type': 'decimal',
            'value': _customLength,
          },
        ];
      } else {
        // Default electrician / lamp / lighting
        return [
          {
            'key': 'count',
            'label': 'Aantal lampen / armaturen',
            'labelEn': 'Number of lamps / fixtures',
            'type': 'integer',
            'value': _customCount,
          },
        ];
      }
    } else if (_selectedJobId == 'tiler') {
      final normalizedJob = job.toLowerCase();
      if (normalizedJob.contains('repareren') ||
          normalizedJob.contains('repair')) {
        return [
          {
            'key': 'count',
            'label': 'Aantal tegels',
            'labelEn': 'Number of tiles',
            'type': 'integer',
            'value': _customCount,
          },
        ];
      } else if (normalizedJob.contains('kit') ||
          normalizedJob.contains('sealant')) {
        return [
          {
            'key': 'length',
            'label': 'Lengte (m)',
            'labelEn': 'Length (m)',
            'type': 'decimal',
            'value': _customLength,
          },
        ];
      }
    } else if (_selectedJobId == 'gardener') {
      if (job.contains('Schutting') || job.contains('Fence')) {
        return [
          {
            'key': 'count',
            'label': 'Aantal panelen (180x180 cm)',
            'labelEn': 'Number of panels (180x180 cm)',
            'type': 'integer',
            'value': _customCount,
          },
          {
            'key': 'length',
            'label': 'Totale lengte schutting (m)',
            'labelEn': 'Total fence length (m)',
            'type': 'decimal',
            'value': _customLength,
          },
        ];
      } else if (job.contains('Bestrating') ||
          job.contains('Paving') ||
          job.contains('Terras') ||
          job.contains('Patio')) {
        return [
          {
            'key': 'length',
            'label': 'Lengte (m)',
            'labelEn': 'Length (m)',
            'type': 'decimal',
            'value': _customLength,
          },
          {
            'key': 'depth',
            'label': 'Breedte (m)',
            'labelEn': 'Width (m)',
            'type': 'decimal',
            'value': _customDepth,
          },
        ];
      } else if (job.contains('Snoeien') ||
          job.contains('Pruning') ||
          job.contains('Hagen') ||
          job.contains('Hedge')) {
        return [
          {
            'key': 'count',
            'label': 'Aantal bomen / heesters',
            'labelEn': 'Number of trees / shrubs',
            'type': 'integer',
            'value': _customCount,
          },
        ];
      } else if (job.contains('Overkapping') ||
          job.contains('Carport') ||
          job.contains('Pergola') ||
          job.contains('Afdak')) {
        return [
          {
            'key': 'length',
            'label': 'Breedte overkapping (m)',
            'labelEn': 'Canopy width (m)',
            'type': 'decimal',
            'value': _customLength,
          },
          {
            'key': 'depth',
            'label': 'Diepte overkapping (m)',
            'labelEn': 'Canopy depth (m)',
            'type': 'decimal',
            'value': _customDepth,
          },
        ];
      } else if (job.contains('Gazon') ||
          job.contains('Lawn') ||
          job.contains('Gras') ||
          job.contains('Grass')) {
        return [
          {
            'key': 'length',
            'label': 'Lengte gazon (m)',
            'labelEn': 'Lawn length (m)',
            'type': 'decimal',
            'value': _customLength,
          },
          {
            'key': 'depth',
            'label': 'Breedte gazon (m)',
            'labelEn': 'Lawn width (m)',
            'type': 'decimal',
            'value': _customDepth,
          },
        ];
      }
    }
    // Generic fallback
    return [
      {
        'key': 'length',
        'label': 'Lengte (m)',
        'labelEn': 'Length (m)',
        'type': 'decimal',
        'value': _customLength,
      },
      {
        'key': 'count',
        'label': 'Aantal stuks',
        'labelEn': 'Quantity',
        'type': 'integer',
        'value': _customCount,
      },
    ];
  }

  void calculateFromCustomInputs() {
    final job = _selectedSpecificJobs.isNotEmpty
        ? _selectedSpecificJobs.first
        : '';

    int packs;
    double materialCost;
    double? customProMaterialCost;
    int laborHours;
    double proHours = 0.0;
    double klusserHours = 0.0;

    if (_selectedJobId == 'painter' && isFramePainting) {
      packs = _customCount;
      materialCost = _customCount * 18.50;
      customProMaterialCost = _customCount * 12.50;
      proHours = _customCount * 1.50;
      klusserHours = _customCount * 3.50;
      laborHours = max(1, klusserHours.ceil());
    } else if (_selectedJobId == 'painter' && isRadiator) {
      packs = _customCount;
      materialCost = _customCount * 12.50;
      customProMaterialCost = _customCount * 8.50;
      proHours = _customCount * 0.75;
      klusserHours = _customCount * 2.0;
      laborHours = max(1, klusserHours.ceil());
    } else if (job.contains('Plank ophangen') ||
        job.contains('Shelf hanging')) {
      packs = _customCount;
      materialCost = _customCount * 58.50;
      laborHours = _customCount;
      proHours = _customCount * 1.0;
      klusserHours = _customCount * 1.5;
    } else if (job.contains('Koof') ||
        job.contains('koof') ||
        job.contains('Coving') ||
        job.contains('Bulkhead')) {
      packs = _customCount;
      final length = _customLength > 0 ? _customLength : 3.0;
      materialCost = _customCount * (length * 28.0 + 35.0);
      laborHours = (_customCount * length * 0.75).ceil();
      proHours = _customCount * length * 0.75;
      klusserHours = _customCount * length * 1.5;
    } else if (job.contains('Trap') ||
        job.contains('Staircase') ||
        isTrapBekleden) {
      final int aantalTreden = _trapAantalTreden > 0 ? _trapAantalTreden : 14;
      packs = aantalTreden;

      // Document 5 – Klus 4: standaard rekenmateriaal per trede €41,60 C / €28,50 P
      materialCost = double.parse((aantalTreden * 41.60).toStringAsFixed(2));
      customProMaterialCost = double.parse(
        (aantalTreden * 28.50).toStringAsFixed(2),
      );

      laborHours = trapEstimatedHours;
      // Document 5 – Klus 4: Pro-tijd 0,75 u/trede, Klusser-tijd 2,0 u/trede
      proHours = aantalTreden * 0.75;
      klusserHours = aantalTreden * 2.0;
    } else if (job.contains('Deur plaatsen') ||
        job.contains('Door installation') ||
        job.contains('Install Door')) {
      packs = _customCount;
      materialCost = deurTotalPrijs;
      customProMaterialCost = deurTotalPrijsPro;
      final bool isOut = _deurLocatie == 'Buiten' || _deurLocatie == 'Outside';
      final bool isNewF =
          _deurKozijn == 'Nieuw' ||
          _deurKozijn == 'New' ||
          _deurKozijn == 'New frame';
      laborHours = _customCount * (isOut ? 3 : 2);
      if (isNewF) laborHours += _customCount;

      // Document 5 – Klus 2: Pro-tijd 2,5 u/deur, Klusser-tijd 7,0 u/deur (binnendeur)
      proHours = _customCount * 2.5;
      klusserHours = _customCount * 7.0;
      if (isOut) {
        proHours += _customCount * 1.0;
        klusserHours += _customCount * 2.0;
      }
      if (isNewF) {
        proHours += _customCount * 0.5;
        klusserHours += _customCount * 1.0;
      }
    } else if (job.contains('Kozijn') ||
        job.contains('Raamkozijn') ||
        job.contains('Window frame')) {
      packs = _customCount;
      materialCost =
          _customCount * 65.0 +
          ((_customCount / 2).ceil() * 16.0) +
          ((_customCount / 3).ceil() * 11.50) +
          ((_customCount / 4).ceil() * 14.50);
      laborHours = _customCount * 3;
      proHours = _customCount * 3.0;
      klusserHours = _customCount * 6.0;
    } else if (job.contains('Kast') ||
        job.contains('kast') ||
        job.contains('Cabinet building') ||
        job.contains('cabinet')) {
      packs = _customCount;
      materialCost = _customLength * _customHeight * _customDepth * 80.0;
      laborHours = 4 + (_customCount * 2);
      proHours = laborHours.toDouble();
      klusserHours = laborHours * 1.5;
    } else if (job.contains('TV meubel') ||
        job.contains('Badmeubel') ||
        job.contains('TV unit') ||
        job.contains('Bathroom furniture')) {
      packs = _customCount;
      materialCost = _customCount * 60.0;
      laborHours = _customCount;
      proHours = _customCount * 1.0;
      klusserHours = _customCount * 2.0;
    } else if (job.contains('Plint') ||
        job.contains('plint') ||
        job.contains('Skirting board')) {
      final meters = _customLength > 0 ? _customLength : 2.0;
      final metersCount = meters.ceil();
      packs = metersCount;
      if (isPlakplinten) {
        // Document 5 – Klus 3: standaard rekenmateriaal per meter €15 C / €9,50 P
        materialCost = double.parse((meters * 15.00).toStringAsFixed(2));
        customProMaterialCost = double.parse(
          (meters * 9.50).toStringAsFixed(2),
        );
      } else {
        final tubesKit = (metersCount / 10).ceil();
        final dozenSchroeven = (metersCount / 25).ceil();
        final setsPluggen = (metersCount / 25).ceil();
        final tubesAcrylaat = (metersCount / 15).ceil();
        final stuksProfiel = (metersCount / 5).ceil();
        materialCost =
            (metersCount * 8.00) +
            (tubesKit * 8.50) +
            (dozenSchroeven * 5.50) +
            (setsPluggen * 3.50) +
            (tubesAcrylaat * 3.50) +
            (stuksProfiel * 3.50) +
            5.00 +
            12.50;
        customProMaterialCost = materialCost * 0.75;
      }
      laborHours = (metersCount / 5).ceil();
      // Document 5 – Klus 3: Pro-tijd 0,10 u/m, Klusser-tijd 0,30 u/m
      proHours = meters * 0.10;
      klusserHours = meters * 0.30;
    } else if (job.contains('Keukenblok') ||
        job.contains('keukenblok') ||
        job.contains('Kitchen unit installation')) {
      packs = _customCount;
      materialCost = _customLength * 180.0;
      laborHours = 4;
      proHours = 4.0;
      klusserHours = 8.0;
    } else if (job.contains('Dakkapel') || job.contains('Dormer window')) {
      packs = _customCount;
      materialCost =
          _customCount * 2500.0 + (_customLength * _customHeight * 120.0);
      laborHours = 16;
      proHours = 16.0;
      klusserHours = 32.0;
    } else if (job.contains('Verlichting') ||
        job.contains('Lamp') ||
        job.contains('Lighting') ||
        _selectedJobId == 'electrician') {
      packs = _customCount;
      if (job.contains('Stopcontact') || job.contains('Outlet')) {
        materialCost = _customCount * 28.00;
        customProMaterialCost = _customCount * 17.50;
        proHours = _customCount * 0.75;
        klusserHours = _customCount * 1.90;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('Schakelaar') || job.contains('Switch')) {
        materialCost = _customCount * 14.50;
        proHours = _customCount * 0.50;
        klusserHours = _customCount * 1.25;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('Rookmelder') || job.contains('Smoke')) {
        materialCost = _customCount * 25.50;
        customProMaterialCost = _customCount * 18.35;
        proHours = _customCount * 0.25;
        klusserHours = _customCount * 0.60;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('Stroomleiding') ||
          job.contains('Power cable') ||
          job.contains('Cable laying')) {
        final meters = _customLength > 0 ? _customLength : 5.0;
        materialCost = meters * 3.50;
        customProMaterialCost = meters * 2.50;
        proHours = meters * 0.10;
        klusserHours = meters * 0.25;
        laborHours = max(1, klusserHours.ceil());
        packs = meters.ceil();
      } else if (job.contains('Kabelgoot') || job.contains('Cable trunking')) {
        final meters = _customLength > 0 ? _customLength : 3.0;
        materialCost = meters * 4.00;
        customProMaterialCost = meters * 2.75;
        proHours = meters * 0.07;
        klusserHours = meters * 0.17;
        laborHours = max(1, klusserHours.ceil());
        packs = meters.ceil();
      } else if (job.contains('Verlichting') ||
          job.contains('Lamp') ||
          job.contains('Lighting')) {
        materialCost = _customCount * 41.00;
        customProMaterialCost = _customCount * 28.65;
        proHours = _customCount * 0.50;
        klusserHours = _customCount * 1.25;
        laborHours = max(1, klusserHours.ceil());
      } else {
        materialCost = _customCount * 38.50;
        proHours = _customCount * 0.50;
        klusserHours = _customCount * 1.25;
        laborHours = max(1, proHours.ceil());
      }
    } else if (_selectedJobId == 'plumber') {
      packs = _customCount;
      if (job.contains('Kraan') ||
          job.contains('Keukenkraan') ||
          job.contains('Tap') ||
          job.contains('Faucet') ||
          job.contains('Kitchen tap') ||
          job.contains('kraan') ||
          job.contains('tap')) {
        materialCost = _customCount * 115.00;
        customProMaterialCost = _customCount * 78.00;
        proHours = _customCount * 1.0;
        klusserHours = _customCount * 2.5;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('Toilet') ||
          job.contains('WC') ||
          job.contains('toilet') ||
          job.contains('wc')) {
        materialCost = _customCount * 347.00;
        customProMaterialCost = _customCount * 254.00;
        proHours = _customCount * 2.5;
        klusserHours = _customCount * 5.0;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('CV') ||
          job.contains('CV-installatie') ||
          job.contains('Refill central heating') ||
          job.contains('Central heating') ||
          job.contains('cv')) {
        materialCost = _customCount * 18.00;
        customProMaterialCost = _customCount * 12.00;
        proHours = _customCount * 0.25;
        klusserHours = _customCount * 0.5;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('Ontstoppen') ||
          job.contains('Afvoer') ||
          job.contains('Unclog') ||
          job.contains('Drain') ||
          job.contains('Blockage') ||
          job.contains('unblock') ||
          job.contains('ontstoppen')) {
        materialCost = _customCount * 15.00;
        customProMaterialCost = _customCount * 10.00;
        proHours = _customCount * 0.75;
        klusserHours = _customCount * 1.5;
        laborHours = max(1, klusserHours.ceil());
      } else if (job.contains('Leiding aanleggen') ||
          job.contains('Waterleiding') ||
          job.contains('Water pipe') ||
          job.contains('Pipe') ||
          job.contains('Plumbing installation') ||
          job.contains('Leiding leggen') ||
          job.contains('pipe') ||
          job.contains('leiding')) {
        materialCost = _customLength * 8.50;
        customProMaterialCost = _customLength * 5.50;
        proHours = _customLength * 0.15;
        klusserHours = _customLength * 0.30;
        laborHours = max(1, klusserHours.ceil());
        packs = _customLength.ceil();
      } else {
        materialCost = _customCount * 45.00;
        proHours = _customCount * 1.0;
        klusserHours = _customCount * 2.5;
        laborHours = max(1, proHours.ceil());
      }
    } else if (_selectedJobId == 'tiler') {
      final normalizedJob = job.toLowerCase();
      if (normalizedJob.contains('repareren') ||
          normalizedJob.contains('repair')) {
        packs = _customCount;
        materialCost = _customCount * 14.50;
        customProMaterialCost = _customCount * 9.95;
        proHours = _customCount * 0.50;
        klusserHours = _customCount * 1.25;
        laborHours = max(1, klusserHours.ceil());
      } else if (normalizedJob.contains('kit') ||
          normalizedJob.contains('sealant')) {
        final meters = _customLength > 0 ? _customLength : 5.0;
        packs = meters.ceil();
        materialCost = meters * 4.70;
        customProMaterialCost = meters * 2.95;
        proHours = meters * 0.05;
        klusserHours = meters * 0.125;
        laborHours = max(1, klusserHours.ceil());
      } else {
        packs = _customCount > 0 ? _customCount : 1;
        materialCost = _customCount * 10.00;
        proHours = _customCount * 0.50;
        klusserHours = _customCount * 1.00;
        laborHours = max(1, proHours.ceil());
      }
    } else if (_selectedJobId == 'gardener') {
      packs = _customCount;
      if (job.contains('Schutting') || job.contains('Fence')) {
        final meters = _customLength > 0 ? _customLength : _customCount * 1.8;
        materialCost = meters * 47.0;
        customProMaterialCost = meters * 34.0;
        proHours = meters * 0.50;
        klusserHours = meters;
        laborHours = max(1, klusserHours.ceil());
        packs = meters.ceil();
      } else if (job.contains('Bestrating') ||
          job.contains('Paving') ||
          job.contains('Terras') ||
          job.contains('Patio')) {
        final areaM2 = (_customLength > 0 && _customDepth > 0)
            ? _customLength * _customDepth
            : (_customCount > 0 ? _customCount.toDouble() : 10.0);
        materialCost = areaM2 * 48.0;
        customProMaterialCost = areaM2 * 33.0;
        proHours = areaM2 * 0.30;
        klusserHours = areaM2 * 0.75;
        laborHours = max(1, klusserHours.ceil());
        packs = areaM2.ceil();
      } else if (job.contains('Snoeien') ||
          job.contains('Pruning') ||
          job.contains('Hagen') ||
          job.contains('Hedge')) {
        materialCost = 4.0;
        customProMaterialCost = 2.50;
        proHours = _customCount * 1.0;
        klusserHours = _customCount * 2.5;
        laborHours = max(1, klusserHours.ceil());
        packs = _customCount;
      } else if (job.contains('Overkapping') ||
          job.contains('Carport') ||
          job.contains('Pergola') ||
          job.contains('Afdak')) {
        final areaM2 = (_customLength > 0 && _customDepth > 0)
            ? _customLength * _customDepth
            : (_customCount > 0 ? _customCount.toDouble() : 12.0);
        materialCost = areaM2 * 123.0;
        customProMaterialCost = areaM2 * 116.0;
        proHours = areaM2 * 0.80;
        klusserHours = areaM2 * 2.0;
        laborHours = max(1, klusserHours.ceil());
        packs = areaM2.ceil();
      } else if (job.contains('Gazon') ||
          job.contains('Lawn') ||
          job.contains('Gras') ||
          job.contains('Grass')) {
        final areaM2 = (_customLength > 0 && _customDepth > 0)
            ? _customLength * _customDepth
            : (_customCount > 0 ? _customCount.toDouble() : 20.0);
        materialCost = areaM2 * 41.60;
        customProMaterialCost = areaM2 * 28.50;
        proHours = areaM2 * 0.10;
        klusserHours = areaM2 * 0.25;
        laborHours = max(1, klusserHours.ceil());
        packs = areaM2.ceil();
      } else {
        materialCost = _customCount * _customLength * 15.0;
        proHours = _customCount * 1.0;
        klusserHours = _customCount * 2.5;
        laborHours = max(1, proHours.ceil());
      }
    } else {
      packs = _customCount;
      materialCost = _customCount * _customLength * 15.0;
      laborHours = _customCount;
      proHours = _customCount * 1.0;
      klusserHours = _customCount * 2.5;
    }

    double hourlyRate = 45.0;
    if (_selectedJobId == 'plumber' || _selectedJobId == 'electrician') {
      hourlyRate = 55.0;
    } else if (_selectedJobId == 'gardener') {
      hourlyRate = 40.0;
    }

    final effectiveProMaterial = customProMaterialCost ?? materialCost;
    final outsourcingCost = effectiveProMaterial + (proHours * hourlyRate);
    // Normalize laborHours to DIY hours (klusserHours ceiling) for consistency with engine
    if (klusserHours > 0) {
      laborHours = max(1, klusserHours.ceil());
    }
    final savings =
        outsourcingCost - materialCost; // what you save by not hiring a pro
    final savingsPercent = outsourcingCost > 0
        ? ((savings / outsourcingCost) * 100).round()
        : 0;

    _calcResult = CalculationResultModel(
      area: isTrapBekleden
          ? trapNettoOppervlakte
          : _customLength * (_customDepth > 0 ? _customDepth : 1.0),
      reserveArea: isTrapBekleden ? trapTotaalOppervlakte : 0.0,
      packs: packs,
      paintLiters: 0,
      laborHours: laborHours,
      proHours: proHours,
      klusserHours: klusserHours,
      materialCost: materialCost,
      laborCost: 0.0,
      outsourcingCost: outsourcingCost,
      savings: savings,
      savingsPercent: savingsPercent,
    );
    notifyListeners();
  }

  void nextStep(BuildContext context) {
    if (_currentStep == 3 && hasReportedSafetyStopPoint) return;
    if (_currentStep == 4 && !needsAreaCalculation) {
      calculateFromCustomInputs();
    }
    if (_currentStep < totalSteps) {
      // Only show interstitial ads for non-premium users
      if (!_isPremium && (_currentStep == 4 || _currentStep == 7)) {
        //   AdService.showInterstitialAd(context);
      }
      _currentStep++;
      notifyListeners();
    } else {
      _saveJob(context);
      AppNavigator.offAllName(context: context, page: const RootView());
    }
  }

  void _saveJob(BuildContext context) {
    if (_calcResult == null) {
      _calculate();
    }
    if (_calcResult == null) return;
    final appUser = context.read<AppService>().appUser;
    if (appUser == null) return;

    final job = JobModel(
      id: const Uuid().v4(),
      userId: appUser.email,
      jobName: _selectedJob ?? 'Nieuwe Klus',
      date: DateTime.now(),
      calculationResult: _calcResult!,
      isCompleted:
          false, // We assume onboarding completion means they did the job (or saved it).
    );

    HiveService.saveJob(job);
    // Also mark trial as used
    appUser.freeTrialUsed = true;
    context.read<AppService>().setProfile(appUser);
  }

  void previousStep() {
    if (_currentStep > 1) {
      _currentStep--;
      notifyListeners();
    }
  }

  void updateMeasurements({
    double? length,
    double? width,
    double? height,
    bool? includeExtra,
  }) {
    if (length != null) _length = length;
    if (width != null) _width = width;
    if (height != null) _height = height;
    if (includeExtra != null) _includeExtra = includeExtra;
    _calculate();
    notifyListeners();
  }

  // Keep for backward compatibility (not used in UI)
  void toggleSpecificJob(String job) => selectSpecificJob(job);

  /// Convenient helper to set specific jobs list (used in tests & programmatic setup)
  void setSpecificJobs(List<String> jobs) {
    if (jobs.isEmpty) {
      _selectedSpecificJobs.clear();
    } else {
      selectSpecificJob(jobs.first);
      if (jobs.length > 1) {
        _selectedSpecificJobs.addAll(jobs.sublist(1));
      }
    }
  }

  /// Jobs that do NOT need an m² surface-area calculation — loaded from
  /// assets/data/jobs.json via [OnboardingDataService].
  Set<String> get _noAreaJobs => OnboardingDataService.instance.noAreaJobs;

  /// Returns true when the currently selected specific job requires an m²
  /// measurement screen. Returns false for fixed-count / linear jobs.
  bool get needsAreaCalculation {
    if (_isDeurbel) return false;
    if (isTrapBekleden) return false;
    if (isDeurPlaatsen) return false;
    if (_selectedJobId == 'painter' && (isFramePainting || isRadiator)) {
      return false;
    }
    if (_selectedJobId == 'plumber' &&
        _selectedSpecificJobs.any(
          (j) =>
              j.toLowerCase().contains('leiding aanleggen') ||
              j.toLowerCase().contains('water pipe'),
        )) {
      return false;
    }
    if (_selectedJobId == 'tiler' &&
        _selectedSpecificJobs.any((job) {
          final normalizedJob = job.toLowerCase();
          return normalizedJob.contains('repair') ||
              normalizedJob.contains('repareren') ||
              normalizedJob.contains('sealant') ||
              normalizedJob.contains('kit');
        })) {
      return false;
    }
    if (_selectedJobId == 'electrician') return false;
    if (_selectedSpecificJobs.isNotEmpty) {
      final job = _selectedSpecificJobs.first;
      if (_noAreaJobs.any((j) => job.contains(j))) return false;
    }
    if (_selectedJobId != 'carpenter') return true;
    if (_selectedSpecificJobs.isEmpty) return true;
    final job = _selectedSpecificJobs.first;
    return !_noAreaJobs.any((j) => job.contains(j));
  }

  String _overkappingRoofMaterial = 'Polycarbonaat kanaalplaten (16mm)';
  String get overkappingRoofMaterial => _overkappingRoofMaterial;
  void setOverkappingRoofMaterial(String v) {
    _overkappingRoofMaterial = v;
    notifyListeners();
  }

  String _plintenType = 'plakplinten';
  String get plintenType => _plintenType;
  void setPlintenType(String v) {
    _plintenType = v;
    _calculate();
    _updateChecklistForJob();
    notifyListeners();
  }

  bool get isOverkapping => _selectedSpecificJobs.any(
    (j) =>
        j.contains('Overkapping') ||
        j.contains('Canopy') ||
        j.contains('Carport'),
  );

  bool get isGipswand => _selectedSpecificJobs.any(
    (j) =>
        j.contains('Gipswand') ||
        j.contains('gipswand') ||
        j.contains('Plasterboard') ||
        j.contains('plasterboard') ||
        j.contains('Wand plaatsen') ||
        j.contains('Wall installation') ||
        j.contains('Scheidingswand') ||
        j.contains('Partition wall'),
  );

  bool get isPlakplinten => _plintenType == 'plakplinten';

  bool get isHogePlintenLijm =>
      _plintenType == 'hoge_plinten_lijm' ||
      _plintenType == 'hoge_plinten' ||
      _plintenType == 'lijmen';

  bool get isHogePlintenSchroeven =>
      _plintenType == 'hoge_plinten_schroeven' || _plintenType == 'schroeven';

  int _radiatorAantal = 1;
  int get radiatorAantal => _radiatorAantal;
  void setRadiatorAantal(int v) {
    _radiatorAantal = v < 1 ? 1 : v;
    _calculate();
    notifyListeners();
  }

  bool get isRadiator =>
      _selectedJobId == 'painter' &&
      _selectedSpecificJobs.any(
        (j) => j.contains('Radiator') || j.contains('radiator'),
      );

  bool get isFramePainting =>
      _selectedJobId == 'painter' &&
      _selectedSpecificJobs.any(
        (j) =>
            j.toLowerCase().contains('kozijn/deur schilderen') ||
            j.toLowerCase().contains('window frame/door painting'),
      );

  double get radiatorSingleOppervlakte => totalArea;
  double get radiatorTotaalOppervlakte => double.parse(
    (radiatorSingleOppervlakte * _radiatorAantal).toStringAsFixed(2),
  );
  int get radiatorVerfLiters =>
      max(1, (radiatorTotaalOppervlakte / 5.5).ceil());

  /// Computed total price for door placement using Basisprijs + Toeslagen model.
  double get deurTotalPrijs {
    final surcharges = deurSurcharges;
    final double surchargeSum = surcharges.values.fold(
      0.0,
      (sum, val) => sum + val,
    );
    return double.parse(
      ((deurBasePrijs + surchargeSum) * _customCount).toStringAsFixed(2),
    );
  }

  /// Base price for standard hollow-core interior door — from door_options.json.
  double get deurBasePrijs => OnboardingDataService.instance.deurBasePrice;

  /// Base price for standard interior door pro outsourcing — from door_options.json.
  double get deurBasePrijsPro =>
      OnboardingDataService.instance.deurBasePricePro;

  /// Computed total pro price for door placement using Basisprijs + Toeslagen model.
  double get deurTotalPrijsPro {
    final surcharges = deurSurcharges;
    final double surchargeSum = surcharges.values.fold(
      0.0,
      (sum, val) => sum + val,
    );
    return double.parse(
      ((deurBasePrijsPro + surchargeSum) * _customCount).toStringAsFixed(2),
    );
  }

  /// Number of treads (Aantal treden) - Standard Dutch staircase is 14 treads
  int _trapAantalTreden = 14;
  int get trapAantalTreden => _trapAantalTreden;
  double _trapBreedte = 0.90;
  double get trapBreedte => _trapBreedte;
  double _trapStootbordHoogte = 0.18;
  double get trapStootbordHoogte => _trapStootbordHoogte;

  /// Update the premium flag. Call this whenever [IAPService.isPremium] changes.
  void setIsPremium(bool value) {
    if (_isPremium == value) return;
    _isPremium = value;
    notifyListeners();
  }

  /// Surcharge amounts are loaded from assets/data/door_options.json.
  Map<String, double> get deurSurcharges {
    final s = OnboardingDataService.instance.deurSurchargeValues;
    final bool isOutside =
        _deurLocatie == 'Buiten' || _deurLocatie == 'Outside';
    final bool isSolid =
        _deurUitvoering == 'Massief' || _deurUitvoering == 'Solid';
    final bool isWithTransom =
        _deurUitvoering == 'Met bovenlicht' ||
        _deurUitvoering.toLowerCase().contains('transom');
    final bool isWithGlass =
        _deurUitvoering == 'Met glas' ||
        _deurUitvoering == 'With glass' ||
        _deurUitvoering == 'With Glass';
    final bool isNewFrame =
        _deurKozijn == 'Nieuw' ||
        _deurKozijn == 'New' ||
        _deurKozijn == 'New frame';

    double glassSurcharge = 0.0;
    if (isWithTransom) {
      glassSurcharge = s['transom_glass'] ?? 75.00;
    } else if (isWithGlass) {
      glassSurcharge = s['glass'] ?? 60.00;
    } else if (_deurGlas) {
      glassSurcharge = s['manual_glass'] ?? 45.00;
    }

    return {
      'outside': isOutside ? (s['outside'] ?? 150.00) : 0.0,
      'solid': isSolid ? (s['solid'] ?? 80.00) : 0.0,
      'glass': glassSurcharge,
      'new_frame': isNewFrame ? (s['new_frame'] ?? 120.00) : 0.0,
    };
  }

  /// Total onboarding steps. Step 9 (subscription card) is hidden for premium users.
  int get totalSteps => _isPremium ? 8 : 9;

  void setDeurKozijn(String v) {
    final lower = v.toLowerCase();
    if (lower == 'new' || lower == 'nieuw' || lower == 'new frame') {
      _deurKozijn = 'Nieuw';
    } else {
      _deurKozijn = 'Bestaand';
    }
    _updateChecklistForJob();
    notifyListeners();
  }

  // void nextStep() {
  //   if (_currentStep < totalSteps) {
  //     _currentStep++;
  //     notifyListeners();
  //   }
  // }

  void setDeurBeslagType(String v) {
    final lower = v.toLowerCase();
    if (lower.contains('knob') || lower.contains('knop')) {
      _deurBeslagType = 'Deurknop';
    } else {
      _deurBeslagType = 'Krukstel';
    }
    notifyListeners();
  }

  void setDeurUitvoering(String v) {
    final lower = v.toLowerCase();
    if (lower == 'solid' || lower == 'solid wood' || lower == 'massief') {
      _deurUitvoering = 'Massief';
      _deurGlas = false;
    } else if (lower == 'solid-core' ||
        lower == 'volspaan' ||
        lower == 'solid core') {
      _deurUitvoering = 'Volspaan';
      _deurGlas = false;
    } else if (lower == 'hollow-core' ||
        lower == 'honingraat' ||
        lower == 'board') {
      _deurUitvoering = 'Honingraat';
      _deurGlas = false;
    } else if (lower == 'particleboard' ||
        lower == 'spaanplaat' ||
        lower == 'mdf') {
      _deurUitvoering = 'Spaanplaat';
      _deurGlas = false;
    } else if (lower == 'with glass' ||
        lower == 'met glas' ||
        lower == 'glass') {
      _deurUitvoering = 'Met glas';
      _deurGlas = true;
    } else if (lower.contains('transom') || lower.contains('bovenlicht')) {
      _deurUitvoering = 'Met bovenlicht';
      _deurGlas = true;
    } else {
      _deurUitvoering = v;
      if (v == 'Met glas' || v == 'Met bovenlicht') _deurGlas = true;
    }
    _updateChecklistForJob();
    notifyListeners();
  }

  void setDeurFinish(String v) => setDeurUitvoering(v);

  /// Step 3b: Glass? (Yes / No)

  void setDeurGlas(bool v) {
    _deurGlas = v;
    _updateChecklistForJob();
    notifyListeners();
  }

  /// Step 3c: Glass installation method - 'Glaslatten' (Glazing beads) or 'Direct in deur' (Directly in door)

  void setDeurGlasMontage(String v) {
    final lower = v.toLowerCase();
    if (lower.contains('bead') || lower.contains('glaslat')) {
      _deurGlasMontage = 'Glaslatten';
    } else {
      _deurGlasMontage = 'Direct in deur';
    }
    notifyListeners();
  }

  void reset() {
    _currentStep = 1;
    _selectedJob = null;
    _selectedJobId = 'carpenter';
    _selectedSpecificJobs.clear();
    _selectedMeasurementType = 'Vloer (lxb)';
    _length = 0.0;
    _width = 0.0;
    _height = 0.0;
    _includeExtra = false;
    _calcResult = null;
    _updateChecklistForJob();
    _selectedPlan = 'YEARLY';
    _selectedDuration = null;
    // Custom input fields
    _customLength = 1.20;
    _customDepth = 0.30;
    _customHeight = 2.10;
    _customCount = 1;
    _customMaterial = 'Hout';
    // Door-specific conditional fields
    _deurLocatie = 'Binnen';
    _deurType = 'Stomp';
    _deurUitvoering = 'Board';
    _deurGlas = false;
    _deurKozijn = 'Bestaand';
    // Staircase-specific conditional fields
    _trapAantalTreden = 14;
    _trapTredeDiepte = 0.30;
    _trapStootbordHoogte = 0.18;
    _trapBreedte = 0.90;
    _trapType = 'Dicht';
    _trapBekledingType = 'Tapijt';
    _trapInclusiefSnijverlies = true;
    // Radiator-specific fields
    _radiatorAantal = 1;
    _plintenType = 'plakplinten';
    notifyListeners();
  }

  bool get _isBehangen =>
      _selectedJobId == 'painter' &&
      (_selectedSpecificJobs.contains('Behangen') ||
          _selectedSpecificJobs.contains('Wallpapering'));

  bool get _isTerras =>
      _selectedJobId == 'gardener' &&
      _selectedSpecificJobs.any(
        (j) =>
            j.contains('Terras') ||
            j.contains('terras') ||
            j.contains('Bestrating') ||
            j.contains('bestrating') ||
            j.contains('Paving') ||
            j.contains('Patio'),
      );

  bool get _isLaminaat =>
      _selectedJobId == 'carpenter' &&
      _selectedSpecificJobs.any(
        (j) =>
            j.contains('Laminaat') ||
            j.contains('laminaat') ||
            j.contains('Laminate') ||
            j.contains('laminate') ||
            j.contains('Vloer leggen') ||
            j.contains('vloer leggen') ||
            j.contains('Floor installation') ||
            j.contains('Floor laying') ||
            j.contains('Laying flooring') ||
            j.contains('Laying floor'),
      );

  bool get _isDeurbel =>
      _selectedJobId == 'electrician' &&
      _selectedSpecificJobs.any(
        (j) =>
            j.contains('Deurbel') ||
            j.contains('deurbel') ||
            j.contains('Doorbell') ||
            j.contains('doorbell'),
      );

  /// Step 1: Locatie - 'Binnen' (Inside) or 'Buiten' (Outside)
  void setDeurLocatie(String v) {
    if (v.toLowerCase() == 'outside' || v.toLowerCase() == 'buiten') {
      _deurLocatie = 'Buiten';
    } else {
      _deurLocatie = 'Binnen';
    }
    _updateChecklistForJob();
    notifyListeners();
  }

  /// Step 1b: If Outside - 'Voordeur' (Front door), 'Achterdeur' (Back door), 'Balkondeur' (Balcony/patio door)

  void setDeurBuitenType(String v) {
    final lower = v.toLowerCase();
    if (lower == 'front door' || lower == 'voordeur') {
      _deurBuitenType = 'Voordeur';
    } else if (lower == 'back door' || lower == 'achterdeur') {
      _deurBuitenType = 'Achterdeur';
    } else if (lower == 'balcony door' ||
        lower == 'balkondeur' ||
        lower == 'tuindeur') {
      _deurBuitenType = 'Balkondeur';
    } else {
      _deurBuitenType = v;
    }
    notifyListeners();
  }

  /// Step 2: Construction Type (Door System) - 'Stomp' (Flush), 'Opdek' (Surface-mounted), 'Inleg' (Recessed)

  void setDeurType(String v) {
    final lower = v.toLowerCase();
    if (lower == 'flush' || lower == 'stomp') {
      _deurType = 'Stomp';
    } else if (lower == 'surface-mounted' ||
        lower == 'opdek' ||
        lower == 'overlay') {
      _deurType = 'Opdek';
    } else if (lower == 'recessed' || lower == 'inleg' || lower == 'inset') {
      _deurType = 'Inleg';
    } else {
      _deurType = v;
    }
    notifyListeners();
  }

  // Step 2: Selected Job

  void selectJob(String job, String id) {
    _selectedJob = job;
    _selectedJobId = id;
    _selectedSpecificJobs.clear();
    _reportedSafetyStopPoints.clear();
    _updateChecklistForJob();
    _calculate(); // recalculate in case isPainting changed
    notifyListeners();
  }

  // Step 3: Specific Jobs

  void selectSpecificJob(String job) {
    // Single-select: replace any previously selected job with the new one.
    _selectedSpecificJobs
      ..clear()
      ..add(job);
    _reportedSafetyStopPoints.clear();
    if (job.contains('Plint') ||
        job.contains('plint') ||
        job.contains('Skirting board')) {
      if (_customLength == 1.20 || _customLength <= 0) {
        _customLength = 2.0;
      }
    }
    if (job.contains('Behangen') ||
        job.contains('Wallpapering') ||
        job.contains('Binnenmuur') ||
        job.contains('Interior wall') ||
        job.contains('Muur') ||
        job.contains('Wall') ||
        job.contains('Wandtegel') ||
        job.contains('wandtegel') ||
        job.contains('wall tile') ||
        isGipswand) {
      _selectedMeasurementType = 'Muur (lxh)';
      if (_height <= 0) {
        _height = 2.40;
      }
    } else if (job.contains('Terras') ||
        job.contains('Bestrating') ||
        job.contains('Paving') ||
        job.contains('Patio') ||
        job.contains('Laminaat') ||
        job.contains('Laminate') ||
        job.contains('Vloer leggen') ||
        job.contains('Floor installation') ||
        job.contains('Floor laying') ||
        job.contains('Laying flooring') ||
        job.contains('Laying floor') ||
        job.contains('Vloertegel') ||
        job.contains('vloertegel') ||
        job.contains('floor tile')) {
      _selectedMeasurementType = 'Vloer (lxb)';
    }
    _updateChecklistForJob();
    _calculate();
    notifyListeners();
  }

  // Step 3: Measurements

  void setMeasurementType(String type) {
    _selectedMeasurementType = type;
    _calculate();
    notifyListeners();
  }

  // Step 4: Materials
  List<Map<String, dynamic>> get materials {
    if (_calcResult == null) return [];

    if (_selectedJobId == 'painter') {
      final packs = _calcResult!.packs;
      final cost = _calcResult!.materialCost;
      return _materialsForPainter(packs, cost);
    } else if (_selectedJobId == 'gardener') {
      final packs = _calcResult!.packs;
      final cost = _calcResult!.materialCost;
      return _materialsForGardener(packs, cost);
    } else if (_selectedJobId == 'carpenter') {
      final packs = _calcResult!.packs;
      final cost = _calcResult!.materialCost;
      return _materialsForCarpenter(packs, cost);
    } else if (_selectedJobId == 'plumber') {
      final packs = _calcResult!.packs;
      final cost = _calcResult!.materialCost;
      return _materialsForPlumber(packs, cost);
    } else if (_selectedJobId == 'electrician') {
      final packs = _calcResult!.packs;
      final cost = _calcResult!.materialCost;
      return _materialsForElectrician(packs, cost);
    } else if (_selectedJobId == 'tiler') {
      final packs = _calcResult!.packs;
      final cost = _calcResult!.materialCost;
      return _materialsForTiler(packs, cost);
    } else {
      return [
        {
          'name': 'Materiaal (Pakketten)',
          'qty': '${_calcResult!.packs} pak',
          'price': 'â‚¬ ${_calcResult!.materialCost.toStringAsFixed(2)}',
          'icon': Icons.layers,
        },
      ];
    }
  }

  // Step 4: Duration estimate

  void selectDuration(String duration) {
    _selectedDuration = duration;
    notifyListeners();
  }

  // Step 5: Checklist (dynamically populated based on selected job)
  void toggleChecklistItem(String item) {
    _checklist[item] = !(_checklist[item] ?? false);
    notifyListeners();
  }

  // Step 8: Subscription
  String _selectedPlan = 'YEARLY';
  String get selectedPlan => _selectedPlan;
  void selectPlan(String plan) {
    _selectedPlan = plan;
    notifyListeners();
  }

  /// Configures all door choices at once with support for both EN and NL terms
  void setDeurChoices({
    String? location,
    String? outsideType,
    String? type,
    String? finish,
    String? material,
    dynamic glass,
    String? glassMounting,
    String? treatment,
    String? handleType,
    String? frame,
    int? count,
  }) {
    if (location != null) setDeurLocatie(location);
    if (outsideType != null) setDeurBuitenType(outsideType);
    if (type != null) setDeurType(type);
    final fin = finish ?? material;
    if (fin != null) setDeurUitvoering(fin);
    if (glass != null) {
      if (glass is bool) {
        setDeurGlas(glass);
      } else if (glass is String) {
        final gLower = glass.toLowerCase();
        setDeurGlas(gLower == 'yes' || gLower == 'ja' || gLower == 'true');
      }
    }
    if (glassMounting != null) setDeurGlasMontage(glassMounting);
    if (treatment != null) setDeurBehandeling(treatment);
    if (handleType != null) setDeurBeslagType(handleType);
    if (frame != null) setDeurKozijn(frame);
    if (count != null) setCustomCount(count);
    _updateChecklistForJob();
    notifyListeners();
  }

  void setDeurBehandeling(String v) {
    final lower = v.toLowerCase();
    if (lower == 'primed' || lower == 'gegrond') {
      _deurBehandeling = 'Gegrond';
    } else if (lower == 'untreated' || lower == 'onbehandeld') {
      _deurBehandeling = 'Onbehandeld';
    } else if (lower.contains('natural') || lower.contains('blank')) {
      _deurBehandeling = 'Blank hout';
    } else {
      _deurBehandeling = v;
    }
    notifyListeners();
  }

  void _updateChecklistForJob() {
    _checklist.clear();

    // â”€â”€ Wallpaper special case â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    if (_isBehangen) {
      final cfg = OnboardingDataService.instance.checklistConfigForJob(
        'Behangen',
      );
      final tools = cfg?['_default'];
      if (tools is List) {
        _checklist.addAll({for (final t in tools.cast<String>()) t: false});
      }
      return;
    }

    // â”€â”€ All other jobs: delegate to OnboardingDataService â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    final resolved = OnboardingDataService.instance.resolveChecklist(
      jobId: _selectedJobId,
      selectedSpecificJobs: _selectedSpecificJobs,
      isPlakplinten: isPlakplinten,
      isHogePlintenSchroeven: isHogePlintenSchroeven,
      isHogePlintenLijm: isHogePlintenLijm,
      deurLocatie: _deurLocatie,
      deurKozijn: _deurKozijn,
    );
    _checklist.addAll(resolved);

    // Always include dustpan and brush on indoor non-lawn jobs
    final isLawn = _selectedSpecificJobs.any(
      (j) =>
          j.contains('Gazon') ||
          j.contains('Lawn') ||
          j.contains('Kunstgras') ||
          j.contains('Artificial grass') ||
          j.contains('Gras'),
    );
    if (!isLawn && _selectedJobId != 'gardener') {
      _checklist[OnboardingDataService.instance.alwaysIndoorExtra] = false;
    }
  }

  void _calculate() {
    if (!needsAreaCalculation) {
      calculateFromCustomInputs();
      return;
    }
    // For Vloer, Plafond, Terras, Laminaat the area is length Ã— width.
    // Pass height=0 so CalculationEngine uses the floor branch (length Ã— width).
    // For Muur pass the actual height so the engine uses length Ã— height.
    final bool isMuur =
        (_selectedMeasurementType == 'Muur (lxh)' ||
            _isBehangen ||
            isGipswand) &&
        !_isTerras &&
        !_isLaminaat;
    _calcResult = CalculationEngine.calculate(
      length: _length,
      width: _width,
      height: isMuur ? _height : 0.0,
      isPainting: _selectedJobId == 'painter',
      isBehangen: _isBehangen,
      isTerras: _isTerras,
      isLaminaat: _isLaminaat,
      isDeurbel: _isDeurbel,
      isOverkapping: isOverkapping,
      isArtificialGrass:
          _selectedJobId == 'gardener' &&
          _selectedSpecificJobs.any(
            (j) =>
                j.toLowerCase().contains('gazon') ||
                j.toLowerCase().contains('lawn') ||
                j.toLowerCase().contains('grass'),
          ),
      isGipswand: isGipswand,
      isPlakplinten:
          _selectedJobId == 'carpenter' &&
          _selectedSpecificJobs.any(
            (j) => j.contains('Plint') || j.contains('plint'),
          ) &&
          isPlakplinten,
      isTiler: _selectedJobId == 'tiler',
      isTilerWall:
          _selectedJobId == 'tiler' &&
          _selectedSpecificJobs.any(
            (j) =>
                j.toLowerCase().contains('wand') ||
                j.toLowerCase().contains('wall'),
          ),
      isTilerGrouting:
          _selectedJobId == 'tiler' &&
          _selectedSpecificJobs.any(
            (j) =>
                j.toLowerCase().contains('voegen') ||
                j.toLowerCase().contains('grout'),
          ),
      isPlumber: _selectedJobId == 'plumber',
      includeExtra: _includeExtra,
    );
  }

  /// Helper to configure all staircase parameters in one call
  void setStaircaseChoices({
    int? count,
    double? depth,
    double? height,
    double? width,
    String? type,
    String? material,
    bool? includeReserve,
  }) {
    if (count != null) setTrapAantalTreden(count);
    if (depth != null) setTrapTredeDiepte(depth);
    if (height != null) setTrapStootbordHoogte(height);
    if (width != null) setTrapBreedte(width);
    if (type != null) setTrapType(type);
    if (material != null) setTrapBekledingType(material);
    if (includeReserve != null) setTrapInclusiefSnijverlies(includeReserve);
  }

  /// Returns materials for the 'painter' job based on selected specific job(s),
  /// loaded dynamically from assets/data/painter_materials.json.
  List<Map<String, dynamic>> _materialsForPainter(int packs, double cost) {
    final jobs = _selectedSpecificJobs;

    final int liters = (_calcResult != null && _calcResult!.paintLiters > 0)
        ? _calcResult!.paintLiters
        : 2;
    final double safeCost = cost > 0 ? cost : (liters * 25.0 + 35.0);

    if (OnboardingDataService.instance.isInitialized) {
      final config = OnboardingDataService.instance.painterMaterials;
      final categories = config['categories'] as List?;

      if (categories != null) {
        for (final cat in categories) {
          if (cat is! Map<String, dynamic>) continue;
          final matchTerms = cat['match'] as List?;
          if (matchTerms == null) continue;

          final matches = jobs.any(
            (j) => matchTerms.any((term) => j.contains(term as String)),
          );

          if (matches) {
            final items = cat['items'] as List?;
            if (items != null) {
              final int packsCount =
                  (_calcResult != null && _calcResult!.packs > 0)
                  ? _calcResult!.packs
                  : 6;
              final int gluePacks = (packsCount / 3).ceil();
              final int verfLiters = radiatorVerfLiters;

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final costFactor = (item['cost_factor'] as num?)?.toDouble();

                // Resolve price
                String price;
                final priceType = item['price_type'] as String?;
                if (priceType == 'wallpaper_rolls_price') {
                  price = '€ ${(packsCount * 18.0).toStringAsFixed(2)}';
                } else if (priceType == 'wallpaper_glue_price') {
                  price = '€ ${(gluePacks * 12.0).toStringAsFixed(2)}';
                } else if (priceType == 'wallpaper_primer_price') {
                  price =
                      '€ ${((packsCount / 6).ceil() * 8.0).toStringAsFixed(2)}';
                } else if (priceType == 'radiator_paint_price') {
                  price = '€ ${(verfLiters * 18.0).toStringAsFixed(2)}';
                } else if (priceType == 'radiator_primer_price') {
                  price = '€ ${(verfLiters * 12.0).toStringAsFixed(2)}';
                } else if (priceType == 'latex_paint_price') {
                  price = '€ ${(liters * 15.0).toStringAsFixed(2)}';
                } else if (priceType == 'voorstrijk_price') {
                  price = '€ ${((liters / 2).ceil() * 8.0).toStringAsFixed(2)}';
                } else if (priceType == 'kozijn_paint_price') {
                  price = '€ ${(liters * 12.0).toStringAsFixed(2)}';
                } else if (priceType == 'kozijn_primer_price') {
                  price =
                      '€ ${((liters / 2).ceil() * 10.0).toStringAsFixed(2)}';
                } else if (costFactor != null) {
                  price = '€ ${(safeCost * costFactor).toStringAsFixed(2)}';
                } else if (item['unit_price_c'] != null) {
                  final unitC = (item['unit_price_c'] as num).toDouble();
                  final unitQty = item['qty_type'] as String?;
                  final units = unitQty == 'liters_L'
                      ? liters.toDouble()
                      : unitQty == 'wallpaper_rolls'
                      ? packsCount.toDouble()
                      : 1.0;
                  price = '€ ${(units * unitC).toStringAsFixed(2)}';
                } else {
                  price = item['price'] as String? ?? '€ 0.00';
                }

                // Resolve qty and qtyEn
                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                final qtyType = item['qty_type'] as String?;
                final qtyEnType = item['qtyEn_type'] as String?;

                if (qtyType == 'liters_L') {
                  qty = '$liters L';
                } else if (qtyType == 'half_liters_ceil_L') {
                  qty = '${(liters / 2).ceil()} L';
                } else if (qtyType == 'wallpaper_rolls') {
                  qty = '$packsCount rollen';
                } else if (qtyType == 'wallpaper_glue_qty') {
                  qty = '$gluePacks ${gluePacks == 1 ? 'pak' : 'pakken'}';
                } else if (qtyType == 'wallpaper_primer_qty') {
                  qty = '${(packsCount / 6).ceil()} L';
                } else if (qtyType == 'radiator_liters_L') {
                  qty = '$verfLiters L';
                } else if (qtyType == 'radiator_primer_liters_L') {
                  qty = '$verfLiters L';
                }

                if (qtyEnType == 'wallpaper_glue_qtyEn') {
                  qtyEn = '$gluePacks ${gluePacks == 1 ? 'pack' : 'packs'}';
                } else if (qtyEnType == 'wallpaper_primer_qty') {
                  qtyEn = '${(packsCount / 6).ceil()} L';
                } else if (qtyEnType == 'radiator_liters_L') {
                  qtyEn = '$verfLiters L';
                } else if (qtyEnType == 'radiator_primer_liters_L') {
                  qtyEn = '$verfLiters L';
                }

                // Resolve name & nameEn (handling {packsCount} placeholder)
                String name = item['name'] as String;
                String? nameEn = item['nameEn'] as String?;
                if (name.contains('{packsCount}')) {
                  name = name.replaceAll('{packsCount}', '$packsCount');
                }
                if (nameEn != null && nameEn.contains('{packsCount}')) {
                  nameEn = nameEn.replaceAll('{packsCount}', '$packsCount');
                }

                return <String, dynamic>{
                  'name': name,
                  'nameEn': ?nameEn,
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolvePainterIcon(item['icon'] as String?),
                };
              }).toList();
            }
          }
        }
      }

      // Default generic painter materials from JSON
      final defaultItems = config['default_items'] as List?;
      if (defaultItems != null) {
        return defaultItems.map((raw) {
          final item = raw as Map<String, dynamic>;
          final costFactor = (item['cost_factor'] as num?)?.toDouble() ?? 1.0;
          return <String, dynamic>{
            'name': item['name'],
            'qty': '$liters L',
            'price': '€ ${(safeCost * costFactor).toStringAsFixed(2)}',
            'icon': Utils.resolvePainterIcon(item['icon'] as String?),
          };
        }).toList();
      }
    }

    // Fallback
    return [
      {
        'name': 'Verf (Liters)',
        'qty': '$liters L',
        'price': '€ ${safeCost.toStringAsFixed(2)}',
        'icon': Icons.format_paint,
      },
    ];
  }

  List<Map<String, dynamic>> _materialsForPlumber(int packs, double cost) {
    final jobs = _selectedSpecificJobs;

    if (OnboardingDataService.instance.isInitialized) {
      final config = OnboardingDataService.instance.plumberMaterials;
      final categories = config['categories'] as List?;

      if (categories != null) {
        for (final cat in categories) {
          if (cat is! Map<String, dynamic>) continue;
          final matchTerms = cat['match'] as List?;
          if (matchTerms == null) continue;

          final matches = jobs.any(
            (j) => matchTerms.any(
              (term) =>
                  j.toLowerCase().contains((term as String).toLowerCase()),
            ),
          );

          if (matches) {
            final items = cat['items'] as List?;
            if (items != null) {
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final costFactor = (item['cost_factor'] as num?)?.toDouble();
                final price = costFactor != null
                    ? '€ ${(cost * costFactor).toStringAsFixed(2)}'
                    : (item['price'] as String? ?? '€ 0.00');

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': item['qty'],
                  if (item.containsKey('qtyEn')) 'qtyEn': item['qtyEn'],
                  'price': price,
                  'icon': Utils.resolvePlumberIcon(item['icon'] as String?),
                };
              }).toList();
            }
          }
        }
      }

      // Default generic plumber materials from JSON
      final defaultItems = config['default_items'] as List?;
      if (defaultItems != null) {
        return defaultItems.map((raw) {
          final item = raw as Map<String, dynamic>;
          final costFactor = (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
          final price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
          final qtyType = item['qty_type'] as String?;

          String qty = item['qty'] as String? ?? '';
          String? qtyEn = item['qtyEn'] as String?;

          if (qtyType == 'packs_x_2_meter') {
            qty = '${packs * 2} meter';
            qtyEn = '${packs * 2} meters';
          } else if (qtyType == 'packs_half_ceil_pieces') {
            qty = '${(packs / 2).ceil()} stuks';
            qtyEn = '${(packs / 2).ceil()} pieces';
          } else if (qtyType == 'packs_meter') {
            qty = '$packs meter';
            qtyEn = '$packs meters';
          }

          return <String, dynamic>{
            'name': item['name'],
            if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
            'qty': qty,
            'qtyEn': ?qtyEn,
            'price': price,
            'icon': Utils.resolvePlumberIcon(item['icon'] as String?),
          };
        }).toList();
      }
    }

    // Fallback if service not initialized
    return [
      {
        'name': 'Leidingbuizen (PEX/koper)',
        'nameEn': 'Pipe tubes (PEX/copper)',
        'qty': '${packs * 2} meter',
        'qtyEn': '${packs * 2} meters',
        'price': '€ ${(cost * 0.45).toStringAsFixed(2)}',
        'icon': Icons.horizontal_rule,
      },
      {
        'name': 'Koppelingen & fittingen',
        'nameEn': 'Couplings & fittings',
        'qty': '1 set',
        'qtyEn': '1 set',
        'price': '€ ${(cost * 0.25).toStringAsFixed(2)}',
        'icon': Icons.settings_input_component,
      },
      {
        'name': 'Afsluitkranen',
        'nameEn': 'Shut-off valves',
        'qty': '${(packs / 2).ceil()} stuks',
        'qtyEn': '${(packs / 2).ceil()} pieces',
        'price': '€ ${(cost * 0.15).toStringAsFixed(2)}',
        'icon': Icons.water,
      },
      {
        'name': 'Teflon tape & kit',
        'nameEn': 'Teflon tape & sealant',
        'qty': '1 set',
        'qtyEn': '1 set',
        'price': '€ ${(cost * 0.08).toStringAsFixed(2)}',
        'icon': Icons.layers,
      },
      {
        'name': 'Isolatiemateriaal',
        'nameEn': 'Pipe insulation material',
        'qty': '$packs meter',
        'qtyEn': '$packs meters',
        'price': '€ ${(cost * 0.07).toStringAsFixed(2)}',
        'icon': Icons.thermostat,
      },
    ];
  }

  List<Map<String, dynamic>> _materialsForElectrician(int packs, double cost) {
    final jobs = _selectedSpecificJobs;

    if (OnboardingDataService.instance.isInitialized) {
      final config = OnboardingDataService.instance.electricianMaterials;
      final categories = config['categories'] as List?;

      if (categories != null) {
        final itemCount = packs > 0
            ? packs
            : (_customCount > 0 ? _customCount : 1);

        for (final cat in categories) {
          if (cat is! Map<String, dynamic>) continue;
          final matchTerms = cat['match'] as List?;
          if (matchTerms == null) continue;

          final matches = jobs.any(
            (j) => matchTerms.any((term) => j.contains(term as String)),
          );

          if (matches) {
            final items = cat['items'] as List?;
            if (items != null) {
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final costFactor = (item['cost_factor'] as num?)?.toDouble();
                final unitPrice = (item['unit_price'] as num?)?.toDouble();
                final dynamicQty = item['dynamic_qty'] as String?;
                final dynamicType = item['dynamic_type'] as String?;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price;

                if (dynamicType == 'clips_kabeltrekken') {
                  final beugelsCount = packs > 0 ? packs * 2 : 10;
                  qty = '$beugelsCount stuks';
                  qtyEn = '$beugelsCount pieces';
                  price = '€ ${(beugelsCount * 0.60).toStringAsFixed(2)}';
                } else if (dynamicType == 'clips_kabelgoot') {
                  final beugelsCount = packs > 0 ? packs * 2 : 8;
                  qty = '$beugelsCount stuks';
                  qtyEn = '$beugelsCount pieces';
                  price = '€ ${(beugelsCount * 0.60).toStringAsFixed(2)}';
                } else if (dynamicType == 'kabelgoot_meter') {
                  // Job 29: kabelgoot €2.50/m
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 3.0);
                  qty = '${meters.toStringAsFixed(1)} m';
                  qtyEn = '${meters.toStringAsFixed(1)} m';
                  price = '€ ${(meters * 2.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'kabelgoot_beugels') {
                  // Job 29: beugels €0.40/50cm
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 3.0);
                  final beugels = (meters / 0.5).ceil();
                  qty = '$beugels stuks (per 50 cm)';
                  qtyEn = '$beugels pieces (per 50 cm)';
                  price = '€ ${(beugels * 0.40).toStringAsFixed(2)}';
                } else if (dynamicType == 'kabelgoot_schroeven') {
                  // Job 29: schroeven €4.00/2m
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 3.0);
                  final sets = (meters / 2.0).ceil();
                  qty = '$sets set(s) (per 2 m)';
                  qtyEn = '$sets set(s) (per 2 m)';
                  price = '€ ${(sets * 4.00).toStringAsFixed(2)}';
                } else if (dynamicType == 'stroomleiding_draad') {
                  // Job 28: draad €0.90/m
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 5.0);
                  qty = '${meters.toStringAsFixed(0)} m';
                  qtyEn = '${meters.toStringAsFixed(0)} m';
                  price = '€ ${(meters * 0.90).toStringAsFixed(2)}';
                } else if (dynamicType == 'stroomleiding_goot') {
                  // Job 28: kabelgoot €2.50/5m
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 5.0);
                  final stukken = (meters / 5.0).ceil();
                  qty = '$stukken stuks (à 5 m)';
                  qtyEn = '$stukken pieces (5 m each)';
                  price = '€ ${(stukken * 2.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'stroomleiding_buis') {
                  // Job 28: buis €1.20/50cm
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 5.0);
                  final stukken = (meters / 0.5).ceil();
                  qty = '$stukken stuks (à 50 cm)';
                  qtyEn = '$stukken pieces (50 cm each)';
                  price = '€ ${(stukken * 1.20).toStringAsFixed(2)}';
                } else if (dynamicType == 'stroomleiding_klemmen') {
                  // Job 28: klemmen €0.30 each
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 5.0);
                  final klemmen = meters.ceil();
                  qty = '$klemmen stuks';
                  qtyEn = '$klemmen pieces';
                  price = '€ ${(klemmen * 0.30).toStringAsFixed(2)}';
                } else if (dynamicType == 'stroomleiding_beugels') {
                  // Job 28: beugels €0.40/50cm
                  final meters = _customLength > 0
                      ? _customLength
                      : (packs > 0 ? packs.toDouble() : 5.0);
                  final beugels = (meters / 0.5).ceil();
                  qty = '$beugels stuks (per 50 cm)';
                  qtyEn = '$beugels pieces (per 50 cm)';
                  price = '€ ${(beugels * 0.40).toStringAsFixed(2)}';
                } else if (dynamicType == 'length_x5_meter') {
                  // For stopcontact/verlichting: 5m wire per item
                  final unitPrice2 =
                      (item['unit_price'] as num?)?.toDouble() ?? 0.90;
                  qty = '${itemCount * 5} meter';
                  qtyEn = '${itemCount * 5} meters';
                  price =
                      '€ ${(itemCount * 5 * unitPrice2).toStringAsFixed(2)}';
                } else {
                  if (dynamicQty == 'item_count') {
                    qty = '$itemCount ${itemCount == 1 ? 'stuk' : 'stuks'}';
                    qtyEn = '$itemCount ${itemCount == 1 ? 'piece' : 'pieces'}';
                  } else if (dynamicQty == 'panel_count') {
                    final panelCount = packs > 0 ? packs : 1;
                    qty = '$panelCount stuks';
                    qtyEn = '$panelCount panels';
                  } else if (dynamicQty == 'packs_times_5_meter') {
                    qty = '${packs * 5} meter';
                    qtyEn = '${packs * 5} meters';
                  }

                  if (unitPrice != null) {
                    price = '€ ${(itemCount * unitPrice).toStringAsFixed(2)}';
                  } else if (costFactor != null) {
                    price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
                  } else {
                    price = item['price'] as String? ?? '€ 0.00';
                  }
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveElectricianIcon(item['icon'] as String?),
                };
              }).toList();
            }
          }
        }
      }

      // Default generic electrician materials from JSON
      final defaultItems = config['default_items'] as List?;
      if (defaultItems != null) {
        return defaultItems.map((raw) {
          final item = raw as Map<String, dynamic>;
          final costFactor = (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
          final price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
          final qtyType = item['qty_type'] as String?;

          String qty = item['qty'] as String? ?? '';
          String? qtyEn = item['qtyEn'] as String?;

          if (qtyType == 'packs_times_5_meter') {
            qty = '${packs * 5} meter';
            qtyEn = '${packs * 5} meters';
          } else if (qtyType == 'packs_stuks') {
            qty = '$packs stuks';
            qtyEn = '$packs pieces';
          } else if (qtyType == 'packs_half_ceil_pieces') {
            qty = '${(packs / 2).ceil()} stuks';
            qtyEn = '${(packs / 2).ceil()} pieces';
          }

          return <String, dynamic>{
            'name': item['name'],
            if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
            'qty': qty,
            'qtyEn': ?qtyEn,
            'price': price,
            'icon': Utils.resolveElectricianIcon(item['icon'] as String?),
          };
        }).toList();
      }
    }

    // Fallback if service not initialized
    return [
      {
        'name': 'Elektrakabel (2,5 mm²)',
        'nameEn': 'Electrical cable (2.5 mm²)',
        'qty': '${packs * 5} meter',
        'qtyEn': '${packs * 5} meters',
        'price': '€ ${(cost * 0.35).toStringAsFixed(2)}',
        'icon': Icons.electric_bolt,
      },
      {
        'name': 'Stopcontacten / schakelaars',
        'nameEn': 'Sockets / switches',
        'qty': '$packs stuks',
        'qtyEn': '$packs pieces',
        'price': '€ ${(cost * 0.30).toStringAsFixed(2)}',
        'icon': Icons.power,
      },
      {
        'name': 'Verbindingsdozen',
        'nameEn': 'Junction boxes',
        'qty': '${(packs / 2).ceil()} stuks',
        'qtyEn': '${(packs / 2).ceil()} pieces',
        'price': '€ ${(cost * 0.15).toStringAsFixed(2)}',
        'icon': Icons.developer_board,
      },
      {
        'name': 'Isolatietape & krimpkous',
        'nameEn': 'Insulation tape & heat-shrink tubing',
        'qty': '1 set',
        'qtyEn': '1 set',
        'price': '€ ${(cost * 0.10).toStringAsFixed(2)}',
        'icon': Icons.wrap_text,
      },
      {
        'name': 'Bevestigingsmateriaal',
        'nameEn': 'Mounting hardware / fixings',
        'qty': '1 set',
        'qtyEn': '1 set',
        'price': '€ ${(cost * 0.10).toStringAsFixed(2)}',
        'icon': Icons.hardware,
      },
    ];
  }

  List<Map<String, dynamic>> _materialsForCarpenter(int packs, double cost) {
    final jobs = _selectedSpecificJobs;

    // Check repository-backed jobs first
    final isGardenStructure = jobs.any(
      (j) => j.contains('Overkapping') || j.contains('Canopy construction'),
    );
    if (isGardenStructure) {
      final double b = _width > 0 ? _width : (_length > 0 ? _length : 6.0);
      final double d = (_width > 0 && _length > 0)
          ? (_length < _width ? _length : _width)
          : (_height > 0 ? _height : 2.0);
      return MaterialCatalogRepository.getOverkappingMaterials(
        width: b,
        depth: d,
        includeExtra: _includeExtra,
      ).map((e) => e.toMap()).toList();
    }

    final isGipswand = jobs.any(
      (j) =>
          j.contains('Gipswand') ||
          j.contains('Voorzetwand') ||
          j.contains('Plasterboard') ||
          j.contains('Stud wall') ||
          j.contains('Wand plaatsen') ||
          j.contains('Wall installation') ||
          j.contains('Scheidingswand') ||
          j.contains('Partition wall'),
    );
    if (isGipswand) {
      return MaterialCatalogRepository.getGipswandMaterials(
        length: _length > 0 ? _length : 4.0,
        height: _height > 0 ? _height : 2.5,
        includeExtra: _includeExtra,
      ).map((e) => e.toMap()).toList();
    }

    final isPlinten = jobs.any(
      (j) =>
          j.contains('Plint') ||
          j.contains('plint') ||
          j.contains('Skirting board'),
    );
    if (isPlinten && isPlakplinten) {
      final double perimeter = packs > 0
          ? packs.toDouble()
          : (_customLength > 0
                ? _customLength
                : (_length > 0 && _width > 0
                      ? (2 * (_length + _width) - 1.8)
                      : 12.0));
      return MaterialCatalogRepository.getPlakplintenMaterials(
        perimeterMeters: perimeter,
        includeExtra: _includeExtra,
      ).map((e) => e.toMap()).toList();
    }

    // Specialized staircase logic
    final isStairs =
        isTrapBekleden ||
        jobs.any(
          (j) =>
              j.contains('Trap') ||
              j.contains('Staircase') ||
              j.contains('stairs') ||
              j.contains('Stairs'),
        );
    if (isStairs) {
      final int aantalTreden = _trapAantalTreden > 0
          ? _trapAantalTreden
          : (packs > 0 ? packs : 14);
      final double oppM2 = trapTotaalOppervlakte > 0
          ? trapTotaalOppervlakte
          : aantalTreden *
                (_trapTredeDiepte +
                    (isTrapDicht ? _trapStootbordHoogte : 0.0)) *
                _trapBreedte *
                (_trapInclusiefSnijverlies ? 1.10 : 1.0);
      final double oppM2Str = double.parse(oppM2.toStringAsFixed(2));

      final List<Map<String, dynamic>> items = [
        {
          // Document 2 – Klus 4: Trapbekleding laminaat: €35 C / €25 P per trede
          'name': 'Trapbekleding laminaat (overzettreden)',
          'nameEn': 'Laminate stair cladding step covers',
          'qty': '$aantalTreden treden (${oppM2Str.toStringAsFixed(1)} m²)',
          'qtyEn': '$aantalTreden treads (${oppM2Str.toStringAsFixed(1)} m²)',
          'price': '€ ${(aantalTreden * 35.0).toStringAsFixed(2)}',
          'icon': Icons.stairs,
        },
        {
          // Document 2 – Klus 4: Traplijm €1,60 C per trede
          'name': 'Traplijm',
          'nameEn': 'Stair adhesive',
          'qty': '$aantalTreden treden',
          'qtyEn': '$aantalTreden steps',
          'price': '€ ${(aantalTreden * 1.60).toStringAsFixed(2)}',
          'icon': Icons.format_paint,
        },
        {
          'name': 'Potlood',
          'nameEn': 'Pencil',
          'qty': '1 stuk',
          'qtyEn': '1 piece',
          'price': '€ 1.00',
          'icon': Icons.edit,
        },
        {
          'name': 'Puinzakken',
          'nameEn': 'Rubble bags',
          'qty': '1 rol',
          'qtyEn': '1 roll',
          'price': '€ 4.00',
          'icon': Icons.delete_outline,
        },
      ];

      return items;
    }

    // Specialized door logic
    final isDoor = jobs.any(
      (j) =>
          j.contains('Deur') ||
          j.contains('Door installation') ||
          j.contains('door'),
    );
    if (isDoor) {
      final bool isOutside =
          _deurLocatie == 'Buiten' || _deurLocatie == 'Outside';
      final bool isSolid =
          _deurUitvoering == 'Massief' || _deurUitvoering == 'Solid';
      final bool isSolidCore =
          _deurUitvoering == 'Volspaan' || _deurUitvoering == 'Solid-core';
      final bool isHollowCore =
          _deurUitvoering == 'Honingraat' || _deurUitvoering == 'Hollow-core';
      final bool isParticleBoard =
          _deurUitvoering == 'Spaanplaat' || _deurUitvoering == 'Particleboard';
      final bool isBoard = _deurUitvoering == 'Board';
      final bool isPaneel =
          _deurUitvoering == 'Paneel' || _deurUitvoering == 'Panel';
      final bool isWithTransom =
          _deurUitvoering == 'Met bovenlicht' ||
          _deurUitvoering.toLowerCase().contains('transom');
      final bool isWithGlass =
          _deurUitvoering == 'Met glas' ||
          _deurUitvoering == 'With glass' ||
          _deurUitvoering == 'With Glass' ||
          isWithTransom ||
          _deurGlas;
      final bool isNewFrame =
          _deurKozijn == 'Nieuw' ||
          _deurKozijn == 'New' ||
          _deurKozijn == 'New frame';

      final List<Map<String, dynamic>> items = [];

      // 1. Door main item
      // Doc 2 prices (C/consumer): interior flush/overlay €80–180 (mid €130), exterior €140–450 (mid €170/230), glass door €200–500 (mid €200)
      if (isOutside) {
        if (isSolid) {
          items.add({
            'name': _deurBuitenType == 'Voordeur'
                ? 'Massief houten voordeur (SKG***)'
                : 'Massief houten buitendeur',
            'nameEn': _deurBuitenType == 'Voordeur'
                ? 'Solid wood front door (high security)'
                : 'Solid wood exterior door',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 295.0).toStringAsFixed(2)}', // Doc2: €140–450 exterior, solid = high end ~€295 mid
            'icon': Icons.door_back_door,
          });
        } else if (isWithGlass) {
          items.add({
            'name': 'Buitendeur met isolatieglas',
            'nameEn': 'Exterior door with insulated glass',
            'qty': '$packs stuks',
            'qtyEn': '$packs pieces',
            'price':
                '€ ${(packs * 350.0).toStringAsFixed(2)}', // Doc2: glass door €200–500 mid = €350
            'icon': Icons.door_back_door,
          });
        } else {
          items.add({
            'name': _deurBuitenType == 'Voordeur'
                ? 'Voordeur op maat'
                : (_deurBuitenType == 'Balkondeur'
                      ? 'Balkon-/tuindeur'
                      : 'Achterdeur op maat'),
            'nameEn': _deurBuitenType == 'Voordeur'
                ? 'Custom front door'
                : (_deurBuitenType == 'Balkondeur'
                      ? 'Balcony/patio door'
                      : 'Custom back door'),
            'qty': '$packs stuks',
            'qtyEn': '$packs pieces',
            'price':
                '€ ${(packs * 195.0).toStringAsFixed(2)}', // Doc2: exterior €140–450 mid = €195
            'icon': Icons.door_back_door,
          });
        }
      } else {
        // Doc 2: Interior door flush/overlay €80–180 (C). Mid = €130.
        if (isSolid) {
          items.add({
            'name': 'Massief houten deur',
            'nameEn': 'Solid wood door',
            'qty': '$packs stuks',
            'qtyEn': '$packs pieces',
            'price':
                '€ ${(packs * 160.0).toStringAsFixed(2)}', // Doc2: interior solid = upper range
            'icon': Icons.door_back_door,
          });
        } else if (isSolidCore) {
          items.add({
            'name': 'Volspaan deur',
            'nameEn': 'Solid-core door',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 130.0).toStringAsFixed(2)}', // Doc2: interior mid €130
            'icon': Icons.door_back_door,
          });
        } else if (isWithGlass) {
          items.add({
            'name': isWithTransom ? 'Deur met bovenlicht' : 'Deur met glas',
            'nameEn': isWithTransom
                ? 'Door with transom / glass panels'
                : 'Door with glass',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * (isWithTransom ? 200.0 : 180.0)).toStringAsFixed(2)}', // Doc2: glass door €200–500
            'icon': Icons.door_back_door,
          });
        } else if (isParticleBoard) {
          items.add({
            'name': 'Spaanplaat / MDF deur',
            'nameEn': 'Particleboard / MDF door',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 100.0).toStringAsFixed(2)}', // Doc2: interior mid range
            'icon': Icons.door_back_door,
          });
        } else if (isHollowCore) {
          items.add({
            'name': 'Honingraat board binnendeur',
            'nameEn': 'Hollow-core interior door',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 80.0).toStringAsFixed(2)}', // Doc2: interior lower €80
            'icon': Icons.door_back_door,
          });
        } else if (isBoard) {
          items.add({
            'name': 'Board deur (vlak/glad)',
            'nameEn': 'Board door (flat / smooth finish)',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 110.0).toStringAsFixed(2)}', // Doc2: interior mid
            'icon': Icons.door_back_door,
          });
        } else if (isPaneel) {
          items.add({
            'name': 'Paneeldeur (klassiek)',
            'nameEn': 'Panel door (traditional)',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 120.0).toStringAsFixed(2)}', // Doc2: interior mid
            'icon': Icons.door_back_door,
          });
        } else {
          items.add({
            'name': 'Binnendeur stomp',
            'nameEn': 'Interior door (flush / stomp)',
            'qty': packs == 1 ? '1 stuk' : '$packs stuks',
            'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
            'price':
                '€ ${(packs * 130.0).toStringAsFixed(2)}', // Doc2: binnendeur stomp €130 C / €90 P
            'icon': Icons.door_back_door,
          });
        }
      }

      // 2. Glass accessories if with glass
      if (isWithGlass) {
        if (_deurGlasMontage == 'Glaslatten' || isWithTransom) {
          items.add({
            'name': 'Glaslatten',
            'nameEn': 'Glazing beads',
            'qty': '${packs * 4} stuks',
            'qtyEn': '${packs * 4} pieces',
            'price': '€ ${(packs * 18.00).toStringAsFixed(2)}',
            'icon': Icons.horizontal_rule,
          });
        }
        items.add({
          'name': 'Glasplaat',
          'nameEn': 'Glass pane',
          'qty': '$packs stuks',
          'qtyEn': '$packs pieces',
          'price': '€ ${(packs * 42.00).toStringAsFixed(2)}',
          'icon': Icons.crop_square,
        });
        if (isWithTransom) {
          items.add({
            'name': 'Bovenlicht profielen & glas',
            'nameEn': 'Transom profiles & glass',
            'qty': '$packs set',
            'qtyEn': '$packs set',
            'price': '€ ${(packs * 35.00).toStringAsFixed(2)}',
            'icon': Icons.view_headline,
          });
        }
      }

      // 3. Hinges — Doc 2: €24/set (3 stuks)
      if (_deurType == 'Opdek') {
        items.add({
          'name': 'Paumelle scharnieren (inboorpennen)',
          'nameEn': 'Lift-off paumelle hinges (set of 3)',
          'qty': packs == 1 ? '3 stuks' : '${packs * 3} stuks',
          'qtyEn': packs == 1 ? '3 pieces' : '${packs * 3} pieces',
          'price':
              '€ ${(packs * 24.0).toStringAsFixed(2)}', // Doc2: scharnierset €24 C / €15 P
          'icon': Icons.settings,
        });
      } else if (_deurType == 'Inleg') {
        items.add({
          'name': 'Inleg scharnieren & aanslagstrips',
          'nameEn': 'Recessed hinges & rebate strips (set of 3)',
          'qty': packs == 1 ? '3 stuks' : '${packs * 3} stuks',
          'qtyEn': packs == 1 ? '3 pieces' : '${packs * 3} pieces',
          'price':
              '€ ${(packs * 24.0).toStringAsFixed(2)}', // Doc2: scharnierset €24 C / €15 P
          'icon': Icons.settings,
        });
      } else {
        items.add({
          'name': 'Scharnierset, 3 stuks',
          'nameEn': 'Hinges set (3 pieces)',
          'qty': packs == 1 ? '1 set' : '$packs sets',
          'qtyEn': packs == 1 ? '1 set' : '$packs sets',
          'price':
              '€ ${(packs * 24.0).toStringAsFixed(2)}', // Doc2: scharnierset €24 C / €15 P
          'icon': Icons.settings,
        });
      }

      // 4. Hardware & Handle — Doc 2: kruk €12 C / €8 P
      if (_deurBeslagType == 'Deurknop') {
        items.add({
          'name': 'Deurbeslag (knop & rozet)',
          'nameEn': 'Door knob hardware set',
          'qty': packs == 1 ? '1 set' : '$packs sets',
          'qtyEn': packs == 1 ? '1 set' : '$packs sets',
          'price': '€ ${(packs * 12.0).toStringAsFixed(2)}', // Doc2: handle €12
          'icon': Icons.hardware,
        });
      } else {
        items.add({
          'name': 'Kruk (deurbeslag set)',
          'nameEn': 'Door handle & backplate set',
          'qty': packs == 1 ? '1 set' : '$packs sets',
          'qtyEn': packs == 1 ? '1 set' : '$packs sets',
          'price': '€ ${(packs * 12.0).toStringAsFixed(2)}', // Doc2: handle €12
          'icon': Icons.hardware,
        });
      }

      if (isOutside || isNewFrame) {
        items.add({
          'name': 'Schroeven & pluggen',
          'nameEn': 'Screws & plugs',
          'qty': '1 doos',
          'qtyEn': '1 box',
          'price': '€ 8.50',
          'icon': Icons.construction,
        });
      }

      // 5. Outdoor vs Indoor — Doc 2: slot €15 C / €10 P, kit €7 C / €4,50 P
      if (isOutside) {
        items.add({
          'name': 'Tochtstrip',
          'nameEn': 'Draught Strip',
          'qty': '${packs * 5} meter',
          'qtyEn': '${packs * 5} meters',
          'price':
              '€ ${(packs * 6.0).toStringAsFixed(2)}', // Doc2: draught strip €6/piece
          'icon': Icons.linear_scale,
        });
        items.add({
          'name': 'RVS slot / Veiligheidsslot',
          'nameEn': 'Stainless Steel Lock / Security lock',
          'qty': packs == 1 ? '1 stuk' : '$packs stuks',
          'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
          'price': '€ ${(packs * 15.0).toStringAsFixed(2)}', // Doc2: lock €15
          'icon': Icons.lock,
        });
        items.add({
          'name': 'Waterdichte kit',
          'nameEn': 'Waterproof Sealant',
          'qty': packs == 1 ? '1 tube' : '$packs tubes',
          'qtyEn': packs == 1 ? '1 tube' : '$packs tubes',
          'price': '€ ${(packs * 7.0).toStringAsFixed(2)}', // Doc2: sealant €7
          'icon': Icons.water_drop,
        });
        items.add({
          'name': 'Deurdranger / Montageset',
          'nameEn': 'Door closer / Mounting kit',
          'qty': packs == 1 ? '1 stuk' : '$packs stuks',
          'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
          'price':
              '€ ${(packs * 15.0).toStringAsFixed(2)}', // Doc2: closer kit €15
          'icon': Icons.door_sliding,
        });
      } else {
        items.add({
          'name': 'Slot (insteekslot)',
          'nameEn': 'Door lock (mortise lock)',
          'qty': packs == 1 ? '1 stuk' : '$packs stuks',
          'qtyEn': packs == 1 ? '1 piece' : '$packs pieces',
          'price':
              '€ ${(packs * 15.0).toStringAsFixed(2)}', // Doc2: slot €15 C / €10 P
          'icon': Icons.lock,
        });
        items.add({
          'name': 'Kit (montage / afdichting)',
          'nameEn': 'Sealant',
          'qty': packs == 1 ? '1 tube' : '$packs tubes',
          'qtyEn': packs == 1 ? '1 tube' : '$packs tubes',
          'price':
              '€ ${(packs * 7.00).toStringAsFixed(2)}', // Doc2: kit €7 C / €4,50 P
          'icon': Icons.water_drop,
        });
      }

      // 6. New Frame vs Existing Frame items
      if (isNewFrame) {
        items.add({
          'name': 'Kozijnhout',
          'nameEn': 'Frame Wood',
          'qty': packs == 1 ? '1 set' : '$packs sets',
          'qtyEn': packs == 1 ? '1 set' : '$packs sets',
          'price': '€ ${(packs * 55.00).toStringAsFixed(2)}',
          'icon': Icons.border_all,
        });
        items.add({
          'name': 'Kozijnankers',
          'nameEn': 'Anchors',
          'qty': '${packs * 6} stuks',
          'qtyEn': '${packs * 6} pieces',
          'price': '€ ${(packs * 14.00).toStringAsFixed(2)}',
          'icon': Icons.anchor,
        });
        items.add({
          'name': 'Montageschuim (low expansion)',
          'nameEn': 'PU Expanding foam',
          'qty': '$packs bus',
          'qtyEn': '$packs can',
          'price': '€ ${(packs * 11.50).toStringAsFixed(2)}',
          'icon': Icons.cloud,
        });
        items.add({
          'name': 'Omlijsting / Architraaf',
          'nameEn': 'Architrave trim',
          'qty': packs == 1 ? '1 set' : '$packs sets',
          'qtyEn': packs == 1 ? '1 set' : '$packs sets',
          'price': '€ ${(packs * 18.50).toStringAsFixed(2)}',
          'icon': Icons.crop_free,
        });
      }

      return items;
    }

    if (OnboardingDataService.instance.isInitialized) {
      final config = OnboardingDataService.instance.carpenterMaterials;
      final categories = config['categories'] as List?;

      if (categories != null) {
        for (final cat in categories) {
          if (cat is! Map<String, dynamic>) continue;
          final catId = cat['id'] as String?;
          final matchTerms = cat['match'] as List?;
          if (matchTerms == null) continue;

          bool matches = false;
          if (catId == 'pvc') {
            matches = jobs.any(
              (j) =>
                  j.contains('PVC vloer') ||
                  j.contains('PVC floor') ||
                  (j.contains('PVC') &&
                      !j.contains('kozijn') &&
                      !j.contains('Kozijn')),
            );
          } else if (catId == 'frame') {
            matches = jobs.any(
              (j) =>
                  (j.contains('Kozijn') && !j.contains('Raamkozijn')) ||
                  j.contains('Window frame installation'),
            );
          } else {
            matches = jobs.any(
              (j) => matchTerms.any((term) => j.contains(term as String)),
            );
          }

          if (matches) {
            if (catId == 'laminaat') {
              final double totalArea =
                  _calcResult?.reserveArea ?? (packs * 2.4);
              final int underlayRolls = max(1, (totalArea / 10.0).ceil());

              final List<Map<String, dynamic>> res = [];
              final baseItems = cat['base_items'] as List? ?? [];
              for (final raw in baseItems) {
                final item = raw as Map<String, dynamic>;
                final qtyType = item['qty_type'] as String?;
                final costFactor =
                    (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
                String qty = '';
                String qtyEn = '';
                if (qtyType == 'packs_pak') {
                  qty = '$packs pak';
                  qtyEn = '$packs packs';
                } else if (qtyType == 'underlay_rolls') {
                  qty =
                      '$underlayRolls ${underlayRolls == 1 ? 'rol' : 'rollen'}';
                  qtyEn =
                      '$underlayRolls ${underlayRolls == 1 ? 'roll' : 'rolls'}';
                }
                final unitC = (item['doc2_unit_c'] as num?)?.toDouble();
                res.add({
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': qtyEn,
                  'price': unitC != null
                      ? '€ ${(totalArea * unitC).toStringAsFixed(2)}'
                      : '€ ${(cost * costFactor).toStringAsFixed(2)}',
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                });
              }

              // Klus 1 includes pencil and rubble bags. Skirting, degreaser,
              // and the transition profile belong to other jobs or are optional.
              res.addAll([
                {
                  'name': 'Potlood',
                  'nameEn': 'Pencil',
                  'qty': '1 stuk',
                  'qtyEn': '1 piece',
                  'price': '€ 1.00',
                  'icon': Icons.edit,
                },
                {
                  'name': 'Puinzakken',
                  'nameEn': 'Rubble bags',
                  'qty': '1 rol',
                  'qtyEn': '1 roll',
                  'price': '€ 4.00',
                  'icon': Icons.delete_outline,
                },
              ]);

              return res;
            }

            if (catId == 'pvc') {
              final double totalArea =
                  _calcResult?.reserveArea ?? (packs * 2.4);
              final int pvcUnderlayRolls = max(1, (totalArea / 10.0).ceil());
              final items = cat['items'] as List? ?? [];

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final qtyType = item['qty_type'] as String?;
                final costFactor =
                    (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;

                if (qtyType == 'packs_pak') {
                  qty = '$packs pak';
                  qtyEn = '$packs packs';
                } else if (qtyType == 'pvc_underlay_rolls') {
                  qty =
                      '$pvcUnderlayRolls ${pvcUnderlayRolls == 1 ? 'rol' : 'rollen'}';
                  qtyEn =
                      '$pvcUnderlayRolls ${pvcUnderlayRolls == 1 ? 'roll' : 'rolls'}';
                } else if (qtyType == 'packs_times_2_meter') {
                  qty = '${(packs * 2)} meter';
                  qtyEn = '${(packs * 2)} meters';
                } else if (qtyType == 'packs_div_10_ceil_pieces') {
                  final pieces = (packs / 10).ceil();
                  qty = '$pieces stuks';
                  qtyEn = '$pieces pieces';
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': '€ ${(cost * costFactor).toStringAsFixed(2)}',
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'frame') {
              final foamCans = (packs / 2).ceil();
              final kitTubes = (packs / 2).ceil();
              final screwBoxes = (packs / 3).ceil();
              final foilRolls = (packs / 4).ceil();
              final items = cat['items'] as List? ?? [];

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;
                final unitPrice =
                    (item['unit_price'] as num?)?.toDouble() ?? 0.0;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'packs_pieces') {
                  qty = '$packs stuks';
                  qtyEn = '$packs pieces';
                  price = '€ ${(packs * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'packs_sets') {
                  qty = '$packs sets';
                  qtyEn = '$packs sets';
                  price = '€ ${(packs * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'packs_times_5_meters') {
                  qty = '${packs * 5} meter';
                  qtyEn = '${packs * 5} meters';
                  price = '€ ${(packs * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'foam_cans') {
                  qty = '$foamCans bussen';
                  qtyEn = '$foamCans cans';
                  price = '€ ${(foamCans * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'kit_tubes') {
                  qty = '$kitTubes tubes';
                  qtyEn = '$kitTubes tubes';
                  price = '€ ${(kitTubes * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'screw_boxes') {
                  qty = '$screwBoxes doos';
                  qtyEn = '$screwBoxes box';
                  price = '€ ${(screwBoxes * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'screw_boxes_times_4_50') {
                  price = '€ ${(screwBoxes * 4.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'packs_times_2_pieces') {
                  qty = '${packs * 2} stuks';
                  qtyEn = '${packs * 2} pieces';
                  price = '€ ${(packs * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'foil_rolls') {
                  qty = '$foilRolls rol';
                  qtyEn = '$foilRolls roll';
                  price = '€ ${(foilRolls * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'packs_times_6_50') {
                  price = '€ ${(packs * 6.50).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'koof') {
              final length = _customLength > 0 ? _customLength : (packs * 3.0);
              final isMdf = _customMaterial.contains('MDF');
              final isMultiplex = _customMaterial.contains('Multiplex');
              final sheetName = isMdf
                  ? 'MDF platen (12mm dikte)'
                  : isMultiplex
                  ? 'Multiplex platen (12mm dikte)'
                  : 'Gipsplaten (9.5mm / 12.5mm dikte)';
              final sheetNameEn = isMdf
                  ? 'MDF boards (12mm thickness)'
                  : isMultiplex
                  ? 'Plywood boards (12mm thickness)'
                  : 'Plasterboards (9.5mm / 12.5mm thickness)';

              final items = cat['items'] as List? ?? [];
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;

                String name = item['name'] as String;
                String? nameEn = item['nameEn'] as String?;
                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'koof_framing') {
                  qty = '${(length * 2.5).ceil()} meter';
                  qtyEn = '${(length * 2.5).ceil()} meters';
                  price = '€ ${(length * 6.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'koof_sheet') {
                  name = name.replaceAll('{sheetName}', sheetName);
                  nameEn = nameEn?.replaceAll('{sheetNameEn}', sheetNameEn);
                  qty = '${(length / 2.0).ceil()} stuks';
                  qtyEn = '${(length / 2.0).ceil()} pieces';
                  price = '€ ${(length * 12.00).toStringAsFixed(2)}';
                } else if (dynamicType == 'koof_brackets') {
                  qty = '${(length * 2).ceil()} stuks';
                  qtyEn = '${(length * 2).ceil()} pieces';
                } else if (dynamicType == 'koof_finishing') {
                  qty = '${(length / 2.5).ceil()} stuks';
                  qtyEn = '${(length / 2.5).ceil()} pieces';
                  price = '€ ${(length * 3.50).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': name,
                  'nameEn': ?nameEn,
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'plank_ophangen') {
              final matName = _customMaterial.isNotEmpty
                  ? _customMaterial
                  : 'hout, spaanplaat of MDF';
              final items = cat['items'] as List? ?? [];

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;
                final unitPrice =
                    (item['unit_price'] as num?)?.toDouble() ?? 0.0;

                String name = (item['name'] as String).replaceAll(
                  '{matName}',
                  matName,
                );
                String? nameEn = (item['nameEn'] as String?)?.replaceAll(
                  '{matName}',
                  matName,
                );
                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'packs_pieces') {
                  qty = '$packs stuks';
                  qtyEn = '$packs ${packs == 1 ? 'piece' : 'pieces'}';
                  price = '€ ${(packs * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'packs_times_2_pieces') {
                  qty = '${(packs * 2)} stuks';
                  qtyEn = '${(packs * 2)} pieces';
                  price = '€ ${(packs * unitPrice).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': name,
                  'nameEn': ?nameEn,
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'plinten') {
              final meters = packs > 0
                  ? packs
                  : (_customLength > 0 ? _customLength.ceil() : 2);
              final tubesKit = (meters / 10).ceil();
              final dozenSchroeven = (meters / 25).ceil();
              final setsPluggen = (meters / 25).ceil();
              final tubesAcrylaat = (meters / 15).ceil();
              final stuksProfiel = (meters / 5).ceil();

              final items = cat['items'] as List? ?? [];
              final List<Map<String, dynamic>> res = [];

              for (final raw in items) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;

                if (isHogePlintenSchroeven && dynamicType == 'plinten_lijm') {
                  continue;
                }
                if (!isHogePlintenSchroeven &&
                    (dynamicType == 'plinten_schroeven' ||
                        dynamicType == 'plinten_pluggen')) {
                  continue;
                }

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'plinten_base') {
                  qty = '$meters meter';
                  qtyEn = '$meters ${meters == 1 ? 'meter' : 'meters'}';
                  price = '€ ${(meters * 4.00).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_schroeven') {
                  qty = '$dozenSchroeven doos';
                  qtyEn =
                      '$dozenSchroeven ${dozenSchroeven == 1 ? 'box' : 'boxes'}';
                  price = '€ ${(dozenSchroeven * 5.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_pluggen') {
                  qty = '$setsPluggen set';
                  qtyEn = '$setsPluggen ${setsPluggen == 1 ? 'set' : 'sets'}';
                  price = '€ ${(setsPluggen * 3.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_lijm') {
                  qty = '$tubesKit tube';
                  qtyEn = '$tubesKit ${tubesKit == 1 ? 'tube' : 'tubes'}';
                  price = '€ ${(tubesKit * 8.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_acrylaat') {
                  qty = '$tubesAcrylaat tube';
                  qtyEn =
                      '$tubesAcrylaat ${tubesAcrylaat == 1 ? 'tube' : 'tubes'}';
                  price = '€ ${(tubesAcrylaat * 3.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_profielen') {
                  qty = '$stuksProfiel stuk';
                  qtyEn =
                      '$stuksProfiel ${stuksProfiel == 1 ? 'piece' : 'pieces'}';
                  price = '€ ${(stuksProfiel * 3.50).toStringAsFixed(2)}';
                }

                res.add({
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                });
              }

              return res;
            }

            // Standard categories (cabinet, window_repair, dormer, deck, tv, badmeubel, garden_hut, cladding, fence, keukenblok, balkon)
            final items = cat['items'] as List?;
            if (items != null) {
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final costFactor = (item['cost_factor'] as num?)?.toDouble();
                final qtyType = item['qty_type'] as String?;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;

                if (qtyType == 'packs_m2') {
                  qty = '$packs m²';
                  qtyEn = '$packs m²';
                } else if (qtyType == 'packs_meter') {
                  qty = '$packs meter';
                  qtyEn = '$packs meters';
                } else if (qtyType == 'packs_pieces') {
                  qty = '$packs stuks';
                  qtyEn = '$packs pieces';
                } else if (qtyType == 'packs_pak') {
                  qty = '$packs pak';
                  qtyEn = '$packs packs';
                }

                final price = costFactor != null
                    ? '€ ${(cost * costFactor).toStringAsFixed(2)}'
                    : (item['price'] as String? ?? '€ 0.00');

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
                };
              }).toList();
            }
          }
        }
      }

      // Default generic carpenter materials from JSON
      final defaultItems = config['default_items'] as List?;
      if (defaultItems != null) {
        return defaultItems.map((raw) {
          final item = raw as Map<String, dynamic>;
          final costFactor = (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
          final price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
          final qtyType = item['qty_type'] as String?;

          String qty = item['qty'] as String? ?? '';
          String? qtyEn = item['qtyEn'] as String?;

          if (qtyType == 'packs_pieces') {
            qty = '$packs stuks';
            qtyEn = '$packs pieces';
          }

          return <String, dynamic>{
            'name': item['name'],
            if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
            'qty': qty,
            'qtyEn': ?qtyEn,
            'price': price,
            'icon': Utils.resolveCarpenterIcon(item['icon'] as String?),
          };
        }).toList();
      }
    }

    // Fallback if JSON service not yet initialized
    return [
      {
        'name': 'Hout / Constructiemateriaal',
        'nameEn': 'Timber / construction material',
        'qty': '$packs stuks',
        'qtyEn': '$packs pieces',
        'price': '€ ${(cost * 0.50).toStringAsFixed(2)}',
        'icon': Icons.layers,
      },
      {
        'name': 'Schroeven & pluggen',
        'nameEn': 'Screws & wall plugs',
        'qty': '1 doos',
        'qtyEn': '1 box',
        'price': '€ ${(cost * 0.20).toStringAsFixed(2)}',
        'icon': Icons.hardware,
      },
      {
        'name': 'Lijm / Kit',
        'nameEn': 'Adhesive / sealant',
        'qty': '1 tube',
        'qtyEn': '1 tube',
        'price': '€ ${(cost * 0.15).toStringAsFixed(2)}',
        'icon': Icons.compress,
      },
      {
        'name': 'Afwerkmateriaal',
        'nameEn': 'Finishing materials',
        'qty': '1 set',
        'qtyEn': '1 set',
        'price': '€ ${(cost * 0.15).toStringAsFixed(2)}',
        'icon': Icons.format_paint,
      },
    ];
  }

  List<Map<String, dynamic>> _materialsForGardener(int packs, double cost) {
    final jobs = _selectedSpecificJobs;

    if (OnboardingDataService.instance.isInitialized) {
      final config = OnboardingDataService.instance.gardenerMaterials;
      final categories = config['categories'] as List?;

      if (categories != null) {
        for (final cat in categories) {
          if (cat is! Map<String, dynamic>) continue;
          final catId = cat['id'] as String?;
          final matchTerms = cat['match'] as List?;
          if (matchTerms == null) continue;

          final matches = jobs.any(
            (j) => matchTerms.any((term) => j.contains(term as String)),
          );

          if (matches) {
            if (catId == 'overkapping') {
              // Job 24: Overkapping bouwen
              final areaM2 =
                  _calcResult?.area ?? (packs > 0 ? packs.toDouble() : 12.0);
              final lengthM = _length > 0
                  ? _length
                  : (_width > 0 ? _width : 4.0);
              final int staanders = ((lengthM / 2.0).ceil() * 2).clamp(4, 100);
              final int balken = staanders;
              final int dakPlaten = areaM2.ceil();
              final int trimMeters = (lengthM * 2).ceil();
              final int hoekVerbinders = staanders * 2;

              final items = cat['items'] as List? ?? [];
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;
                final unitPrice =
                    (item['unit_price_c'] as num?)?.toDouble() ??
                    (item['unit_price'] as num?)?.toDouble() ??
                    0.0;
                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'overkapping_staanders') {
                  qty = '$staanders stuks';
                  qtyEn = '$staanders pieces';
                  price = '€ ${(staanders * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'overkapping_balken') {
                  qty = '$balken stuks';
                  qtyEn = '$balken pieces';
                  price = '€ ${(balken * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'overkapping_dakplaten') {
                  qty = '$dakPlaten platen (≈${areaM2.toStringAsFixed(1)} m²)';
                  qtyEn =
                      '$dakPlaten panels (≈${areaM2.toStringAsFixed(1)} m²)';
                  price = '€ ${(dakPlaten * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'overkapping_dakbedekking') {
                  qty = '${areaM2.toStringAsFixed(1)} m²';
                  qtyEn = '${areaM2.toStringAsFixed(1)} m²';
                  price = '€ ${(areaM2 * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'overkapping_poeren') {
                  qty = '$staanders stuks';
                  qtyEn = '$staanders pieces';
                  price = '€ ${(staanders * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'overkapping_hoekverbinders') {
                  qty = '$hoekVerbinders stuks';
                  qtyEn = '$hoekVerbinders pieces';
                  price =
                      '€ ${(hoekVerbinders * unitPrice).toStringAsFixed(2)}';
                } else if (dynamicType == 'overkapping_daktrim') {
                  qty = '$trimMeters meter';
                  qtyEn = '$trimMeters meters';
                  price = '€ ${(trimMeters * unitPrice).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveGardenerIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'paving') {
              final areaM2 = _calcResult?.area ?? (packs * 2.4);
              final totalPavingM2 =
                  _calcResult?.reserveArea.ceil() ?? (areaM2 * 1.10).ceil();
              final perimeter = (_length > 0 && _width > 0)
                  ? ((_length + _width) * 2)
                  : (areaM2 > 0 ? areaM2 * 0.75 : 10.0);
              final opsluitMeters = perimeter.ceil();
              final double zandM3Val = areaM2 * 0.15;
              final String zandM3 = zandM3Val.toStringAsFixed(1);
              final int zandBigbags = (zandM3Val * 1.1).ceil();
              final int zandZakken = ((zandM3Val * 1600) / 25).ceil();

              final double stabM3Val = areaM2 * 0.05;
              final String stabM3 = stabM3Val.toStringAsFixed(1);
              final int stabBigbags = (stabM3Val * 1.5).ceil();
              final int stabZakken = ((stabM3Val * 1500) / 25).ceil();

              final items = cat['items'] as List? ?? [];
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;

                String name = item['name'] as String;
                String? nameEn = item['nameEn'] as String?;
                String qty = '';
                String? qtyEn;
                String price = '';

                if (dynamicType == 'paving_tiles') {
                  qty = '$totalPavingM2 m² (incl. 10% reserve)';
                  price = '€ ${(totalPavingM2 * 21.00).toStringAsFixed(2)}';
                } else if (dynamicType == 'paving_sand') {
                  qty =
                      '$zandM3 m³ (ca. $zandBigbags bigbags / los gestort of $zandZakken zakken à 25kg)';
                  price = '€ ${(zandBigbags * 35.00).toStringAsFixed(2)}';
                } else if (dynamicType == 'paving_stab') {
                  qty =
                      '$stabM3 m³ (ca. $stabBigbags bigbags / los gestort of $stabZakken zakken à 25kg)';
                  price = '€ ${(stabBigbags * 42.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'paving_inveeg') {
                  final zakken = (areaM2 / 10).ceil();
                  qty = '$zakken zakken (à 20kg)';
                  price = '€ ${(zakken * 7.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'paving_opsluit') {
                  qty = '$opsluitMeters stuks (meter)';
                  price = '€ ${(opsluitMeters * 3.75).toStringAsFixed(2)}';
                } else if (dynamicType == 'paving_snelbeton') {
                  final zakken = (opsluitMeters / 4).ceil();
                  qty = '$zakken zakken';
                  price = '€ ${(zakken * 8.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'paving_worteldoek') {
                  qty = '$totalPavingM2 m²';
                  qtyEn = '$totalPavingM2 m²';
                  price = '€ ${(totalPavingM2 * 0.80).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': name,
                  'nameEn': ?nameEn,
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveGardenerIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'sloot') {
              final items = cat['items'] as List? ?? [];
              final meters = packs > 0 ? packs : 5;

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'sloot_oever') {
                  qty = '$meters meter';
                  qtyEn = '$meters meters';
                  price = '€ ${(meters * 4.50).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveGardenerIcon(item['icon'] as String?),
                };
              }).toList();
            }

            // Other matching gardener categories (lawn, deck, pond, fence, snoei, border, winter)
            final items = cat['items'] as List?;
            if (items != null) {
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final costFactor = (item['cost_factor'] as num?)?.toDouble();
                final qtyType = item['qty_type'] as String?;
                final dynamicType = item['dynamic_type'] as String?;
                final unitC =
                    (item['unit_price_c'] as num?)?.toDouble() ??
                    (item['unit_price'] as num?)?.toDouble();

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;

                final areaM2 = (_calcResult?.reserveArea ?? 0) > 0
                    ? _calcResult!.reserveArea
                    : ((_calcResult?.area ?? 0) > 0
                          ? _calcResult!.area
                          : (packs > 0 ? packs.toDouble() : 1.0));
                final fenceMeters = _customLength > 0
                    ? _customLength
                    : (packs > 0 ? packs.toDouble() : 1.8);
                final fencePanels = max(1, (fenceMeters / 1.8).ceil());
                final fencePosts = fencePanels + 1;
                double? pricedUnits;

                if (dynamicType == 'lawn_kunstgras' ||
                    dynamicType == 'lawn_worteldoek') {
                  qty = '${areaM2.toStringAsFixed(1)} m²';
                  qtyEn = '${areaM2.toStringAsFixed(1)} m²';
                  pricedUnits = areaM2;
                } else if (dynamicType == 'lawn_zand') {
                  final m3 = areaM2 * 0.05;
                  qty = '${m3.toStringAsFixed(2)} m³';
                  qtyEn = '${m3.toStringAsFixed(2)} m³';
                  pricedUnits = m3;
                } else if (dynamicType == 'fence_panels' ||
                    dynamicType == 'fence_concrete_panels') {
                  qty = '$fencePanels stuks';
                  qtyEn = '$fencePanels pieces';
                  pricedUnits = fencePanels.toDouble();
                } else if (dynamicType == 'fence_posts' ||
                    dynamicType == 'fence_post_protection' ||
                    dynamicType == 'fence_post_caps') {
                  qty = '$fencePosts stuks';
                  qtyEn = '$fencePosts pieces';
                  pricedUnits = fencePosts.toDouble();
                } else if (dynamicType == 'fence_brackets') {
                  final brackets = fencePosts * 2;
                  qty = '$brackets stuks';
                  qtyEn = '$brackets pieces';
                  pricedUnits = brackets.toDouble();
                } else if (dynamicType == 'fence_concrete') {
                  qty = '$fencePosts zak';
                  qtyEn = '$fencePosts bags';
                  pricedUnits = fencePosts.toDouble();
                } else if (qtyType == 'packs_m2') {
                  qty = '$packs m²';
                  qtyEn = '$packs m²';
                } else if (qtyType == 'packs_pieces') {
                  qty = '$packs stuks';
                  qtyEn = '$packs pieces';
                } else if (qtyType == 'packs_half_ceil_pieces') {
                  final stuks = (packs / 2).ceil();
                  qty = '$stuks stuks';
                  qtyEn = '$stuks pieces';
                } else if (qtyType == 'packs_half_ceil_bags') {
                  final zakken = (packs / 2).ceil();
                  qty = '$zakken zakken';
                  qtyEn = '$zakken bags';
                } else if (qtyType == 'packs_div_3_ceil_pieces') {
                  final stuks = (packs / 3).ceil();
                  qty = '$stuks stuks';
                  qtyEn = '$stuks pieces';
                } else if (qtyType == 'packs_div_3_ceil_bags') {
                  final zakken = (packs / 3).ceil();
                  qty = '$zakken zakken';
                  qtyEn = '$zakken bags';
                } else if (qtyType == 'packs_div_4_ceil_pieces') {
                  final stuks = (packs / 4).ceil();
                  qty = '$stuks stuks';
                  qtyEn = '$stuks pieces';
                } else if (qtyType == 'packs_div_4_ceil_zak') {
                  final zakken = (packs / 4).ceil();
                  qty = '$zakken zak';
                  qtyEn = '$zakken bags';
                } else if (qtyType == 'packs_div_4_ceil_bags') {
                  final zakken = (packs / 4).ceil();
                  qty = '$zakken zak';
                  qtyEn = '$zakken bags';
                } else if (qtyType == 'packs_div_5_ceil_bags') {
                  final zakken = (packs / 5).ceil();
                  qty = '$zakken zak';
                  qtyEn = '$zakken bags';
                } else if (qtyType == 'packs_div_10_ceil_zak') {
                  final zakken = (packs / 10).ceil();
                  qty = '$zakken zak';
                  qtyEn = '$zakken bags';
                }

                final price = pricedUnits != null && unitC != null
                    ? '€ ${(pricedUnits * unitC).toStringAsFixed(2)}'
                    : costFactor != null
                    ? '€ ${(cost * costFactor).toStringAsFixed(2)}'
                    : (item['price'] as String? ?? '€ 0.00');

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveGardenerIcon(item['icon'] as String?),
                };
              }).toList();
            }
          }
        }
      }

      // Default generic garden materials from JSON
      final defaultItems = config['default_items'] as List?;
      if (defaultItems != null) {
        return defaultItems.map((raw) {
          final item = raw as Map<String, dynamic>;
          final costFactor = (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
          final price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
          final qtyType = item['qty_type'] as String?;

          String qty = item['qty'] as String? ?? '';
          String? qtyEn = item['qtyEn'] as String?;

          if (qtyType == 'packs_div_4_ceil_bags') {
            final zakken = (packs / 4).ceil();
            qty = '$zakken zak';
            qtyEn = '$zakken bags';
          } else if (qtyType == 'packs_pieces') {
            qty = '$packs stuks';
            qtyEn = '$packs pieces';
          }

          return <String, dynamic>{
            'name': item['name'],
            if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
            'qty': qty,
            'qtyEn': ?qtyEn,
            'price': price,
            'icon': Utils.resolveGardenerIcon(item['icon'] as String?),
          };
        }).toList();
      }
    }

    // Fallback if JSON service not yet initialized
    return [
      {
        'name': 'Potgrond / Teelaarde',
        'nameEn': 'Potting compost / topsoil',
        'qty': '${(packs / 4).ceil()} zak',
        'qtyEn': '${(packs / 4).ceil()} bags',
        'price': '€ ${(cost * 0.35).toStringAsFixed(2)}',
        'icon': Icons.terrain,
      },
      {
        'name': 'Planten / Struiken',
        'nameEn': 'Plants / shrubs',
        'qty': '$packs stuks',
        'qtyEn': '$packs pieces',
        'price': '€ ${(cost * 0.40).toStringAsFixed(2)}',
        'icon': Icons.spa,
      },
      {
        'name': 'Meststof',
        'nameEn': 'Fertiliser',
        'qty': '1 zak',
        'qtyEn': '1 bag',
        'price': '€ ${(cost * 0.15).toStringAsFixed(2)}',
        'icon': Icons.eco,
      },
      {
        'name': 'Onkruidfolie',
        'nameEn': 'Weed barrier membrane',
        'qty': '1 rol',
        'qtyEn': '1 roll',
        'price': '€ ${(cost * 0.10).toStringAsFixed(2)}',
        'icon': Icons.layers,
      },
    ];
  }

  List<Map<String, dynamic>> _materialsForTiler(int packs, double cost) {
    final jobs = _selectedSpecificJobs;
    final double tileArea =
        _calcResult?.reserveArea ?? (packs > 0 ? packs * 1.0 : 1.0);
    final int tileM2Ceil = max(1, tileArea.ceil());
    final String tileQtyStr = '$tileM2Ceil m²';
    final int glueBags = max(1, (tileArea / 3.0).ceil());
    final int groutBags = max(1, (tileArea / 5.0).ceil());

    // Spec calculations (Jobs 11-15):
    // 11. Vloertegels: 4kg/m² glue in 25kg bags, 0.5kg/m² grout in 5kg bags
    final int glueBagsFloor = max(1, ((tileArea * 4.0) / 25.0).ceil());
    final int groutBagsFloor = max(1, ((tileArea * 0.5) / 5.0).ceil());
    // 12. Wandtegels: 3kg/m² glue in 25kg bags, 0.4kg/m² grout in 5kg bags
    final int glueBagsWall = max(1, ((tileArea * 3.0) / 25.0).ceil());
    final int groutBagsWall = max(1, ((tileArea * 0.4) / 5.0).ceil());
    // Primer: 1 flacon per 5m²
    final int primerUnits = max(1, (tileArea / 5.0).ceil());
    // 13. Tegels repareren: per tegel (default 3 if unspecified)
    final int repairPieces = packs > 0 ? packs : 3;
    // 14. Voegen buiten: 0.6kg/m² in 25kg bags
    final int outdoorBags = max(1, ((tileArea * 0.6) / 25.0).ceil());

    final isPlinten = jobs.any(
      (j) => j.contains('Plinten') || j.contains('skirting'),
    );
    if (isPlinten && isPlakplinten) {
      final double perimeter = packs > 0
          ? packs.toDouble()
          : (_customLength > 0
                ? _customLength
                : (_length > 0 && _width > 0
                      ? (2 * (_length + _width) - 1.8)
                      : 12.0));
      return MaterialCatalogRepository.getPlakplintenMaterials(
        perimeterMeters: perimeter,
        includeExtra: _includeExtra,
      ).map((e) => e.toMap()).toList();
    }

    if (OnboardingDataService.instance.isInitialized) {
      final config = OnboardingDataService.instance.tilerMaterials;
      final categories = config['categories'] as List?;

      if (categories != null) {
        for (final cat in categories) {
          if (cat is! Map<String, dynamic>) continue;
          final catId = cat['id'] as String?;
          final matchTerms = cat['match'] as List?;
          if (matchTerms == null) continue;

          bool matches = false;
          if (catId == 'mozaiek') {
            matches = jobs.any(
              (j) =>
                  (j.contains('Mozaïek') || j.contains('mosaic')) &&
                  !j.contains('Glazen') &&
                  !j.contains('glass'),
            );
          } else {
            matches = jobs.any(
              (j) => matchTerms.any((term) => j.contains(term as String)),
            );
          }

          if (matches) {
            if (catId == 'kit_aanbrengen') {
              final int kitMeters = packs > 0 ? packs : 10;
              final int kitTubes = max(1, (kitMeters / 10).ceil());
              final items = cat['items'] as List? ?? [];

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'kit_tubes_dynamic') {
                  qty =
                      '$kitTubes ${kitTubes == 1 ? 'tube' : 'tubes'} (per ~10 m)';
                  qtyEn =
                      '$kitTubes ${kitTubes == 1 ? 'tube' : 'tubes'} (per ~10 m)';
                  price = '€ ${(kitTubes * 7.00).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveTilerIcon(item['icon'] as String?),
                };
              }).toList();
            }

            if (catId == 'plinten') {
              final meters = packs > 0 ? packs : 2;
              final tubesKit = (meters / 10).ceil();
              final dozenSchroeven = (meters / 25).ceil();
              final setsPluggen = (meters / 25).ceil();
              final tubesAcrylaat = (meters / 15).ceil();
              final stuksProfiel = (meters / 5).ceil();
              final items = cat['items'] as List? ?? [];

              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final dynamicType = item['dynamic_type'] as String?;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;
                String price = item['price'] as String? ?? '';

                if (dynamicType == 'plinten_base') {
                  qty = '$meters meter';
                  price = '€ ${(meters * 4.00).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_kit') {
                  qty = '$tubesKit tube';
                  price = '€ ${(tubesKit * 8.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_schroeven') {
                  qty = '$dozenSchroeven doos';
                  price = '€ ${(dozenSchroeven * 5.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_pluggen') {
                  qty = '$setsPluggen set';
                  price = '€ ${(setsPluggen * 3.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_acrylaat') {
                  qty = '$tubesAcrylaat tube';
                  price = '€ ${(tubesAcrylaat * 3.50).toStringAsFixed(2)}';
                } else if (dynamicType == 'plinten_profielen') {
                  qty = '$stuksProfiel stuk';
                  price = '€ ${(stuksProfiel * 3.50).toStringAsFixed(2)}';
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveTilerIcon(item['icon'] as String?),
                };
              }).toList();
            }

            final items = cat['items'] as List?;
            if (items != null) {
              return items.map((raw) {
                final item = raw as Map<String, dynamic>;
                final costFactor = (item['cost_factor'] as num?)?.toDouble();
                final qtyType = item['qty_type'] as String?;
                final priceType = item['price_type'] as String?;

                String qty = item['qty'] as String? ?? '';
                String? qtyEn = item['qtyEn'] as String?;

                if (qtyType == 'tile_area_m2') {
                  qty = tileQtyStr;
                  qtyEn = tileQtyStr;
                } else if (qtyType == 'glue_bags_floor') {
                  qty = '$glueBagsFloor zak (25 kg)';
                  qtyEn =
                      '$glueBagsFloor ${glueBagsFloor == 1 ? 'bag' : 'bags'} (25 kg)';
                } else if (qtyType == 'grout_bags_floor') {
                  qty = '$groutBagsFloor zak (5 kg)';
                  qtyEn =
                      '$groutBagsFloor ${groutBagsFloor == 1 ? 'bag' : 'bags'} (5 kg)';
                } else if (qtyType == 'primer_units_5m2') {
                  qty = '$primerUnits flacon';
                  qtyEn =
                      '$primerUnits ${primerUnits == 1 ? 'bottle' : 'bottles'}';
                } else if (qtyType == 'glue_bags_wall') {
                  qty = '$glueBagsWall zak (25 kg)';
                  qtyEn =
                      '$glueBagsWall ${glueBagsWall == 1 ? 'bag' : 'bags'} (25 kg)';
                } else if (qtyType == 'grout_bags_wall') {
                  qty = '$groutBagsWall zak (5 kg)';
                  qtyEn =
                      '$groutBagsWall ${groutBagsWall == 1 ? 'bag' : 'bags'} (5 kg)';
                } else if (qtyType == 'repair_tiles_qty') {
                  qty = '$repairPieces stuks';
                  qtyEn = '$repairPieces pieces';
                } else if (qtyType == 'repair_glue_qty') {
                  qty = '$repairPieces kg';
                  qtyEn = '$repairPieces kg';
                } else if (qtyType == 'repair_grout_qty') {
                  qty = '${(repairPieces * 0.3).toStringAsFixed(1)} kg';
                  qtyEn = '${(repairPieces * 0.3).toStringAsFixed(1)} kg';
                } else if (qtyType == 'grout_mortar_outdoor') {
                  qty = '$outdoorBags zak (25 kg)';
                  qtyEn =
                      '$outdoorBags ${outdoorBags == 1 ? 'bag' : 'bags'} (25 kg)';
                } else if (qtyType == 'glue_bags') {
                  qty = '$glueBags zak';
                  qtyEn = '$glueBags ${glueBags == 1 ? 'bag' : 'bags'}';
                } else if (qtyType == 'grout_bags') {
                  qty = '$groutBags zak';
                  qtyEn = '$groutBags ${groutBags == 1 ? 'bag' : 'bags'}';
                } else if (qtyType == 'packs_m2') {
                  qty = '$packs m²';
                  qtyEn = '$packs m²';
                } else if (qtyType == 'packs_pieces') {
                  qty = '$packs stuks';
                  qtyEn = '$packs pieces';
                } else if (qtyType == 'packs_pieces_min_1') {
                  final pieces = packs > 0 ? packs : 1;
                  qty = '$pieces stuks';
                  qtyEn = '$pieces pieces';
                } else if (qtyType == 'packs_div_3_ceil_bags') {
                  final bags = (packs / 3).ceil();
                  qty = '$bags zak';
                  qtyEn = '$bags bags';
                } else if (qtyType == 'packs_div_5_ceil_bags') {
                  final bags = (packs / 5).ceil();
                  qty = '$bags zak';
                  qtyEn = '$bags bags';
                }

                // Resolve price
                String price;
                if (priceType == 'floor_tiles_price') {
                  price = '€ ${(tileM2Ceil * 25.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_glue_floor_price') {
                  price = '€ ${(glueBagsFloor * 15.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_grout_floor_price') {
                  price = '€ ${(groutBagsFloor * 12.00).toStringAsFixed(2)}';
                } else if (priceType == 'wall_tiles_price') {
                  price = '€ ${(tileM2Ceil * 25.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_glue_wall_price') {
                  price = '€ ${(glueBagsWall * 12.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_grout_wall_price') {
                  price = '€ ${(groutBagsWall * 10.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_primer_price') {
                  price = '€ ${(primerUnits * 8.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_repair_tiles_price') {
                  price = '€ ${(repairPieces * 5.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_repair_glue_price') {
                  price = '€ ${(repairPieces * 2.00).toStringAsFixed(2)}';
                } else if (priceType == 'tile_repair_grout_price') {
                  price = '€ ${(repairPieces * 1.00).toStringAsFixed(2)}';
                } else if (priceType == 'voegen_indoor_price') {
                  price = '€ ${(groutBagsFloor * 12.00).toStringAsFixed(2)}';
                } else if (priceType == 'voegen_outdoor_price') {
                  price = '€ ${(outdoorBags * 18.00).toStringAsFixed(2)}';
                } else if (costFactor != null) {
                  price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
                } else {
                  final unitC =
                      (item['unit_price_c'] as num?)?.toDouble() ??
                      _firstAmount(item['price_consumer']) ??
                      (item['unit_price'] as num?)?.toDouble();
                  if (unitC != null) {
                    final units = switch (qtyType) {
                      'tile_area_m2' => tileM2Ceil.toDouble(),
                      'glue_bags_floor' => glueBagsFloor.toDouble(),
                      'grout_bags_floor' => groutBagsFloor.toDouble(),
                      'primer_units_5m2' => primerUnits.toDouble(),
                      'glue_bags_wall' => glueBagsWall.toDouble(),
                      'grout_bags_wall' => groutBagsWall.toDouble(),
                      'repair_tiles_qty' ||
                      'repair_glue_qty' ||
                      'repair_grout_qty' => repairPieces.toDouble(),
                      'grout_mortar_outdoor' => outdoorBags.toDouble(),
                      'glue_bags' => glueBags.toDouble(),
                      'grout_bags' => groutBags.toDouble(),
                      _ => 1.0,
                    };
                    price = '€ ${(units * unitC).toStringAsFixed(2)}';
                  } else {
                    price = item['price'] as String? ?? '€ 0.00';
                  }
                }

                return <String, dynamic>{
                  'name': item['name'],
                  if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
                  'qty': qty,
                  'qtyEn': ?qtyEn,
                  'price': price,
                  'icon': Utils.resolveTilerIcon(item['icon'] as String?),
                };
              }).toList();
            }
          }
        }
      }

      // Default generic tiler materials from JSON
      final defaultItems = config['default_items'] as List?;
      if (defaultItems != null) {
        return defaultItems.map((raw) {
          final item = raw as Map<String, dynamic>;
          final costFactor = (item['cost_factor'] as num?)?.toDouble() ?? 0.0;
          final price = '€ ${(cost * costFactor).toStringAsFixed(2)}';
          final qtyType = item['qty_type'] as String?;

          String qty = item['qty'] as String? ?? '';
          String? qtyEn = item['qtyEn'] as String?;

          if (qtyType == 'packs_pak') {
            qty = '$packs pak';
            qtyEn = '$packs packs';
          } else if (qtyType == 'packs_div_3_ceil_bags') {
            final bags = (packs / 3).ceil();
            qty = '$bags zak';
            qtyEn = '$bags bags';
          } else if (qtyType == 'packs_div_5_ceil_bags') {
            final bags = (packs / 5).ceil();
            qty = '$bags zak';
            qtyEn = '$bags bags';
          }

          return <String, dynamic>{
            'name': item['name'],
            if (item.containsKey('nameEn')) 'nameEn': item['nameEn'],
            'qty': qty,
            'qtyEn': ?qtyEn,
            'price': price,
            'icon': Utils.resolveTilerIcon(item['icon'] as String?),
          };
        }).toList();
      }
    }

    // Fallback if JSON service not yet initialized
    return [
      {
        'name': 'Tegels',
        'nameEn': 'Tiles',
        'qty': '$packs pak',
        'qtyEn': '$packs packs',
        'price': '€ ${(cost * 0.55).toStringAsFixed(2)}',
        'icon': Icons.grid_on,
      },
      {
        'name': 'Tegellijm',
        'nameEn': 'Tile adhesive',
        'qty': '${(packs / 3).ceil()} zak',
        'qtyEn': '${(packs / 3).ceil()} bags',
        'price': '€ ${(cost * 0.20).toStringAsFixed(2)}',
        'icon': Icons.layers,
      },
      {
        'name': 'Voegmiddel',
        'nameEn': 'Tile grout',
        'qty': '${(packs / 5).ceil()} zak',
        'qtyEn': '${(packs / 5).ceil()} bags',
        'price': '€ ${(cost * 0.12).toStringAsFixed(2)}',
        'icon': Icons.grid_view,
      },
      {
        'name': 'Tegelkruisjes & wiggen',
        'nameEn': 'Tile spacers & levelling wedges',
        'qty': '1 set',
        'qtyEn': '1 set',
        'price': '€ ${(cost * 0.06).toStringAsFixed(2)}',
        'icon': Icons.add,
      },
    ];
  }

  double get totalArea {
    if ((_selectedMeasurementType == 'Muur (lxh)' || _isBehangen) &&
        !_isTerras &&
        !_isLaminaat) {
      return double.parse((_length * _height).toStringAsFixed(2));
    }
    return double.parse((_length * _width).toStringAsFixed(2));
  }

  void setCustomLength(double v) {
    _customLength = v;
    notifyListeners();
  }

  void setCustomDepth(double v) {
    _customDepth = v;
    notifyListeners();
  }

  void setCustomHeight(double v) {
    _customHeight = v;
    notifyListeners();
  }

  void setCustomCount(int v) {
    _customCount = v < 1 ? 1 : v;
    notifyListeners();
  }

  void setCustomMaterial(String v) {
    _customMaterial = v;
    notifyListeners();
  }

  void setTrapAantalTreden(int v) {
    _trapAantalTreden = v < 1 ? 1 : v;
    _customCount = _trapAantalTreden;
    _updateChecklistForJob();
    notifyListeners();
  }

  /// Tread depth in meters (Diepte trede) - Default 0.30 m (30 cm)

  void setTrapTredeDiepte(double v) {
    _trapTredeDiepte = v <= 0 ? 0.30 : v;
    _customDepth = _trapTredeDiepte;
    notifyListeners();
  }

  /// Riser height in meters (Hoogte stootbord) - Default 0.18 m (18 cm)
  void setTrapStootbordHoogte(double v) {
    _trapStootbordHoogte = v <= 0 ? 0.18 : v;
    _customHeight = _trapStootbordHoogte;
    notifyListeners();
  }

  /// Staircase width in meters (Breedte trap) - Default 0.90 m (90 cm)

  void setTrapBreedte(double v) {
    _trapBreedte = v <= 0 ? 0.90 : v;
    _customLength = _trapBreedte;
    notifyListeners();
  }

  void calculateArea() {
    _calculate();
    notifyListeners();
  }

  void setTrapType(String v) {
    final lower = v.toLowerCase();
    if (lower == 'open' || lower == 'open trap' || lower == 'without risers') {
      _trapType = 'Open';
    } else {
      _trapType = 'Dicht';
    }
    _updateChecklistForJob();
    notifyListeners();
  }

  /// Covering material type: 'Tapijt' (Carpet), 'PVC / Vinyl', 'Overzettreden'
  void setTrapBekledingType(String v) {
    _trapBekledingType = v;
    notifyListeners();
  }

  /// Include +10% cutting waste reserve

  void setTrapInclusiefSnijverlies(bool v) {
    _trapInclusiefSnijverlies = v;
    notifyListeners();
  }
}

/// First number in a price label such as "€27,50" or "€2–4".
double? _firstAmount(Object? raw) {
  if (raw == null) return null;
  final match = RegExp(r'(\d+)(?:[.,](\d+))?').firstMatch(raw.toString());
  if (match == null) return null;
  final whole = match.group(1)!;
  final fraction = match.group(2);
  return double.parse(fraction == null ? whole : '$whole.$fraction');
}
