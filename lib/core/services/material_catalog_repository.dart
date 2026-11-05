import 'package:flutter/material.dart';
import 'package:easy_four_diy/models/construction_material_item.dart';

/// Repository responsible for linking construction specifications to real hardware store catalogs:
/// - Gamma (Consumer retail benchmark)
/// - Hornbach (Project & hardware volume benchmark)
/// - Bouwmaat (B2B Contractor wholesaler benchmark)
/// - Jongeneel (Timber and specialized construction wholesaler benchmark)
class MaterialCatalogRepository {
  /// Universal Screw Calculation Helper
  /// Rule: Schroeflengte = 2,5 × houtdikte
  /// Rule: Buiten = RVS (A2/A4) met Torx. Binnen = Gegalvaniseerd / Verzinkt (of gefosfateerd voor gips).
  static String getScrewSpec({
    required double timberThicknessMm,
    required bool isOutdoor,
    bool isDrywall = false,
  }) {
    if (isDrywall) {
      return 'Snelbouwschroeven 3,5×25 mm / 35 mm (gefosfateerd, trompetkop)';
    }

    final double recommendedLengthMm = timberThicknessMm * 2.5;
    // Round to nearest standard trade lengths: 30, 40, 50, 60, 70, 80, 100, 120, 140, 160 mm
    final int standardLength;
    if (recommendedLengthMm <= 35) {
      standardLength = 35;
    } else if (recommendedLengthMm <= 45) {
      standardLength = 40;
    } else if (recommendedLengthMm <= 55) {
      standardLength = 50;
    } else if (recommendedLengthMm <= 65) {
      standardLength = 60;
    } else if (recommendedLengthMm <= 75) {
      standardLength = 70;
    } else if (recommendedLengthMm <= 85) {
      standardLength = 80;
    } else if (recommendedLengthMm <= 110) {
      standardLength = 100;
    } else if (recommendedLengthMm <= 130) {
      standardLength = 120;
    } else {
      standardLength = 140;
    }

    if (isOutdoor) {
      return 'RVS A2 Torx voldraadschroeven 5,0×$standardLength mm';
    } else {
      return 'Gegalvaniseerd Torx voldraadschroeven 4,5×$standardLength mm';
    }
  }

  /// ── Klus 1: Plakplinten bij laminaat ─────────────────────────────────────
  /// Stick-on skirting, pencil and rubble bags. Degreaser is optional and
  /// is not part of the standard calculation.
  static List<ConstructionMaterialItem> getPlakplintenMaterials({
    required double perimeterMeters,
    required bool includeExtra,
  }) {
    final double wastePct = 0.10;
    final double effectiveMeters = includeExtra
        ? perimeterMeters * (1.0 + wastePct)
        : perimeterMeters;
    const double standardStripLength = 2.40; // meters per plakplint
    final int totalStrips = (effectiveMeters / standardStripLength).ceil().clamp(1, 200);

    // Document 2 – Klus 3: Plakplint €10/m (C). Pencil and bags are included
    // in the €15/m standard rate and listed once per job.
    final double totalSkirtingCost = effectiveMeters * 10.00;

    return [
      ConstructionMaterialItem(
        id: 'plakplint_strips',
        category: 'plinten',
        nameNl: 'Zelfklevende plakplinten (bijpassend laminaat)',
        nameEn: 'Self-adhesive flat skirting strips (matching laminate)',
        standardTradeDimension: '240 × 2,4 × 0,5 cm',
        qty: '$totalStrips stuks (${(totalStrips * standardStripLength).toStringAsFixed(1)} m)',
        qtyEn: '$totalStrips pieces (${(totalStrips * standardStripLength).toStringAsFixed(1)} m)',
        calculatedCost: totalSkirtingCost,
        icon: Icons.border_bottom,
        isOutdoor: false,
        wastePercentage: wastePct,
        priceGamma: 24.00 * totalStrips,
        priceHornbach: 24.00 * totalStrips,
        priceBouwmaat: 16.80 * totalStrips,
        priceJongeneel: 16.80 * totalStrips,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'plakplint_potlood',
        category: 'plinten',
        nameNl: 'Potlood',
        nameEn: 'Pencil',
        standardTradeDimension: 'stuk',
        qty: '1 stuk',
        qtyEn: '1 piece',
        calculatedCost: 1.00,
        icon: Icons.edit,
        isOutdoor: false,
        priceGamma: 1.00,
        priceHornbach: 1.00,
        priceBouwmaat: 0.50,
        priceJongeneel: 0.50,
        preferredStore: 'Gamma',
      ),
      ConstructionMaterialItem(
        id: 'plakplint_puinzakken',
        category: 'plinten',
        nameNl: 'Puinzakken',
        nameEn: 'Rubble bags',
        standardTradeDimension: 'rol',
        qty: '1 rol',
        qtyEn: '1 roll',
        calculatedCost: 4.00,
        icon: Icons.delete_outline,
        isOutdoor: false,
        priceGamma: 4.00,
        priceHornbach: 4.00,
        priceBouwmaat: 2.50,
        priceJongeneel: 2.50,
        preferredStore: 'Gamma',
      ),
    ];
  }

  /// ── Klus 2: Gipswand plaatsen ───────────────────────────────────────────
  /// Realistic Metal Stud or timber stud drywall construction:
  /// U-tracks floor/ceiling, C-studs h.o.h. 60 cm, plasterboards 12.5mm AK,
  /// 25mm drywall screws h.o.h. 25 cm, acoustic insulation, joint filler, mesh tape.
  static List<ConstructionMaterialItem> getGipswandMaterials({
    required double length,
    required double height,
    required bool includeExtra,
  }) {
    final double area = length * height;
    final double wastePct = 0.10;
    final double effectiveArea = includeExtra ? area * (1.0 + wastePct) : area;

    // Tracks (U-profielen) for floor and ceiling: length * 2
    // Standard length is 3.00 m or 4.00 m
    final double trackMeters = (length * 2) * (includeExtra ? 1.05 : 1.0);
    final int tracksCount = (trackMeters / 3.0).ceil().clamp(2, 50);

    // Studs (C-profielen staanders): h.o.h. 60 cm
    // Total uprights = ceil(length / 0.60) + 1
    final int studsCount = (length / 0.60).ceil() + 1;

    // Plasterboard sheets (Gipsplaten AK 12.5 mm, standard 60 × 260 cm = 1.56 m²)
    // Assuming double-sided drywall partition: 2 sides * effectiveArea
    const double boardArea = 1.56; // 60x260 cm Knauf/Gyproc standard
    final int boardsPerSide = (effectiveArea / boardArea).ceil();
    final int totalBoards = (boardsPerSide * 2).clamp(4, 200);

    // Drywall screws: ~25-30 screws per board per side
    // Standard boxes contain 250 or 500 screws
    final int totalScrews = totalBoards * 25;
    final int screwBoxes = (totalScrews / 250).ceil().clamp(1, 10);

    // Acoustic tape / schuimband for perimeter tracks: length * 2 + height * 2
    final double perimeterMeters = (length * 2) + (height * 2);
    final int tapeRolls = (perimeterMeters / 30.0).ceil().clamp(1, 5); // 30m rolls

    // Insulation (Glaswol/steenwol 45mm of 70mm): covers wall area
    // 1 pack typically covers 6.0 m²
    final int insulationPacks = (effectiveArea / 6.0).ceil().clamp(1, 20);

    // Joint filler & tape:
    // Joint filler 1 kg / 2 m² wall -> ceil(effectiveArea * 2 / 2) = effectiveArea kg
    final int jointFillerBuckets = (effectiveArea * 0.5 / 5.0).ceil().clamp(1, 10); // 5kg buckets
    final int meshTapeRolls = (length * 3 / 45.0).ceil().clamp(1, 5); // 45m roll

    // Hardware and impact plugs: 1 box of 50
    final int plugBoxes = (perimeterMeters / 0.6 / 50.0).ceil().clamp(1, 5);

    // Benchmark prices per Document 2 – Klus 5:
    // Gipsplaat: stuk | €12 C | €7,50 P
    final double boardsCost = totalBoards * 12.00;
    // C-profiel: meter | €4 C | €2,50 P (lengte 2.60m -> €10.40 C / €6.50 P per stuk)
    final double studsCost = studsCount * (2.60 * 4.00);
    // U-profiel: meter | €4 C | €2,50 P (lengte 3.00m -> €12.00 C / €7.50 P per stuk)
    final double tracksCost = tracksCount * (3.00 * 4.00);
    // Gipsplaatschroeven: doos | €8 C | €5 P
    final double screwsCost = screwBoxes * 8.00;
    // Slagpluggen: stuk | €0,30 C | €0,20 P (doos 50st -> €15.00 C / €10.00 P)
    final double plugsCost = plugBoxes * 15.00;
    // Gaasband: rol | €6 C | €4 P
    final double meshCost = meshTapeRolls * 6.00;
    // Voegen-/stucmateriaal: zak | €15 C | €10 P
    final double fillerCost = jointFillerBuckets * 15.00;
    // Schuurpapier: stuk/rol | €5 C | €3,50 P
    const double sandpaperCost = 5.00;
    // Akoestisch band (optionele randisolatie): € 8,95
    final double tapeCost = tapeRolls * 8.95;
    // Isolatie (optionele spouwvulling): € 28,50
    final double insulationCost = insulationPacks * 28.50;

    return [
      ConstructionMaterialItem(
        id: 'gips_platen',
        category: 'gipswand',
        nameNl: 'Gipsplaten AK (12,5 mm, tweezijdig beplaat)',
        nameEn: 'Plasterboard sheets T&G/AK (12.5 mm, both sides)',
        standardTradeDimension: '60 × 260 cm (of 120 × 260 cm)',
        qty: '$totalBoards platen (~${(totalBoards * boardArea).toStringAsFixed(1)} m²)',
        qtyEn: '$totalBoards boards (~${(totalBoards * boardArea).toStringAsFixed(1)} m²)',
        calculatedCost: boardsCost,
        icon: Icons.layers,
        isOutdoor: false,
        wastePercentage: wastePct,
        priceGamma: totalBoards * 12.00,
        priceHornbach: totalBoards * 12.00,
        priceBouwmaat: totalBoards * 7.50,
        priceJongeneel: totalBoards * 7.50,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'metal_stud_c',
        category: 'gipswand',
        nameNl: 'Metal Stud C-profiel staanders (h.o.h. 60 cm)',
        nameEn: 'Metal Stud C-studs C50 / C75 (60 cm c-t-c)',
        standardTradeDimension: 'Lengte 260 cm (€4/m C / €2,50/m P)',
        qty: '$studsCount stuks (${(studsCount * 2.6).toStringAsFixed(1)} m)',
        qtyEn: '$studsCount pieces (${(studsCount * 2.6).toStringAsFixed(1)} m)',
        calculatedCost: studsCost,
        icon: Icons.view_column,
        isOutdoor: false,
        priceGamma: studsCount * (2.60 * 4.00),
        priceHornbach: studsCount * (2.60 * 4.00),
        priceBouwmaat: studsCount * (2.60 * 2.50),
        priceJongeneel: studsCount * (2.60 * 2.50),
        preferredStore: 'Bouwmaat',
      ),
      ConstructionMaterialItem(
        id: 'metal_stud_u',
        category: 'gipswand',
        nameNl: 'Metal Stud U-profiel liggers (vloer en plafond)',
        nameEn: 'Metal Stud U-tracks U50 / U75 (floor & ceiling)',
        standardTradeDimension: 'Lengte 300 cm (€4/m C / €2,50/m P)',
        qty: '$tracksCount stuks (${(tracksCount * 3).toStringAsFixed(0)} m)',
        qtyEn: '$tracksCount pieces (${(tracksCount * 3).toStringAsFixed(0)} m)',
        calculatedCost: tracksCost,
        icon: Icons.horizontal_rule,
        isOutdoor: false,
        priceGamma: tracksCount * (3.00 * 4.00),
        priceHornbach: tracksCount * (3.00 * 4.00),
        priceBouwmaat: tracksCount * (3.00 * 2.50),
        priceJongeneel: tracksCount * (3.00 * 2.50),
        preferredStore: 'Bouwmaat',
      ),
      ConstructionMaterialItem(
        id: 'gips_schroeven',
        category: 'gipswand',
        nameNl: 'Gipsplaatschroeven (doos, gefosfateerd)',
        nameEn: 'Drywall screws (box, phosphate coated)',
        standardTradeDimension: '3,5 × 25 mm (€8/doos C / €5/doos P)',
        qty: '$screwBoxes doos (${screwBoxes * 250} stuks)',
        qtyEn: '$screwBoxes box (${screwBoxes * 250} pcs)',
        calculatedCost: screwsCost,
        icon: Icons.hardware,
        isOutdoor: false,
        screwSpec: 'Gefosfateerd 3,5×25 mm met trompetkop',
        priceGamma: screwBoxes * 8.00,
        priceHornbach: screwBoxes * 8.00,
        priceBouwmaat: screwBoxes * 5.00,
        priceJongeneel: screwBoxes * 5.00,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'gips_gaasband',
        category: 'gipswand',
        nameNl: 'Zelfklevend gaasband / voegenvlies',
        nameEn: 'Self-adhesive fiberglass joint mesh tape',
        standardTradeDimension: 'Rol (€6/rol C / €4/rol P)',
        qty: '$meshTapeRolls ${meshTapeRolls == 1 ? 'rol' : 'rollen'}',
        qtyEn: '$meshTapeRolls ${meshTapeRolls == 1 ? 'roll' : 'rolls'}',
        calculatedCost: meshCost,
        icon: Icons.wrap_text,
        isOutdoor: false,
        priceGamma: meshTapeRolls * 6.00,
        priceHornbach: meshTapeRolls * 6.00,
        priceBouwmaat: meshTapeRolls * 4.00,
        priceJongeneel: meshTapeRolls * 4.00,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'gips_voegenvuller',
        category: 'gipswand',
        nameNl: 'Voegen-/stucmateriaal & voegenvuller',
        nameEn: 'Joint filler & finishing compound',
        standardTradeDimension: 'Zak/emmer (€15/zak C / €10/zak P)',
        qty: '$jointFillerBuckets ${jointFillerBuckets == 1 ? 'zak' : 'zakken'}',
        qtyEn: '$jointFillerBuckets ${jointFillerBuckets == 1 ? 'bag' : 'bags'}',
        calculatedCost: fillerCost,
        icon: Icons.format_paint,
        isOutdoor: false,
        priceGamma: jointFillerBuckets * 15.00,
        priceHornbach: jointFillerBuckets * 15.00,
        priceBouwmaat: jointFillerBuckets * 10.00,
        priceJongeneel: jointFillerBuckets * 10.00,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'gips_slagpluggen',
        category: 'gipswand',
        nameNl: 'Slagpluggen voor wand- en vloerverankering',
        nameEn: 'Impact hammer plugs for perimeter fixing',
        standardTradeDimension: '6 × 40 mm (€0,30 C / €0,20 P per stuk)',
        qty: '$plugBoxes ${plugBoxes == 1 ? 'doos' : 'dozen'} (50 stuks)',
        qtyEn: '$plugBoxes ${plugBoxes == 1 ? 'box' : 'boxes'} (50 pcs)',
        calculatedCost: plugsCost,
        icon: Icons.construction,
        isOutdoor: false,
        priceGamma: plugBoxes * 15.00,
        priceHornbach: plugBoxes * 15.00,
        priceBouwmaat: plugBoxes * 10.00,
        priceJongeneel: plugBoxes * 10.00,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'gips_schuurpapier',
        category: 'gipswand',
        nameNl: 'Schuurpapier voor gipsafwerking',
        nameEn: 'Sandpaper for plaster joint smoothing',
        standardTradeDimension: 'Stuk/rol (€5 C / €3,50 P)',
        qty: '1 stuk/rol',
        qtyEn: '1 piece/roll',
        calculatedCost: sandpaperCost,
        icon: Icons.texture,
        isOutdoor: false,
        priceGamma: 5.00,
        priceHornbach: 5.00,
        priceBouwmaat: 3.50,
        priceJongeneel: 3.50,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'gips_isolatie',
        category: 'gipswand',
        nameNl: 'Akoestische steenwol / glaswol isolatieplaten (optioneel)',
        nameEn: 'Acoustic mineral wool / glasswool insulation (optional)',
        standardTradeDimension: 'Dikte 45 mm / 60 × 120 cm',
        qty: '$insulationPacks ${insulationPacks == 1 ? 'pak' : 'pakken'} (~${(insulationPacks * 6.0).toStringAsFixed(0)} m²)',
        qtyEn: '$insulationPacks ${insulationPacks == 1 ? 'pack' : 'packs'} (~${(insulationPacks * 6.0).toStringAsFixed(0)} m²)',
        calculatedCost: insulationCost,
        icon: Icons.thermostat,
        isOutdoor: false,
        priceGamma: insulationPacks * 31.95,
        priceHornbach: insulationPacks * 28.50,
        priceBouwmaat: insulationPacks * 26.95,
        priceJongeneel: insulationPacks * 27.50,
        preferredStore: 'Bouwmaat',
      ),
      ConstructionMaterialItem(
        id: 'gips_akoestisch_band',
        category: 'gipswand',
        nameNl: 'Akoestisch schuimband onder profielen (optioneel)',
        nameEn: 'Acoustic foam sealing strip for tracks (optional)',
        standardTradeDimension: 'Rol 30 meter',
        qty: '$tapeRolls ${tapeRolls == 1 ? 'rol' : 'rollen'}',
        qtyEn: '$tapeRolls ${tapeRolls == 1 ? 'roll' : 'rolls'}',
        calculatedCost: tapeCost,
        icon: Icons.border_style,
        isOutdoor: false,
        priceGamma: tapeRolls * 9.95,
        priceHornbach: tapeRolls * 8.95,
        priceBouwmaat: tapeRolls * 7.95,
        priceJongeneel: tapeRolls * 8.25,
        preferredStore: 'Bouwmaat',
      ),
    ];
  }

  /// ── Klus 3: Overkapping bouwen met polycarbonaat kanaalplaten ─────────────
  /// Mandatory construction logic:
  /// - Minimaal 4 staanders/palen (bij breedte >= 4.0m: 5 of 6)
  /// - Fundering: betonpoeren met stelplaat of paalankers + snelbeton
  /// - Dwarsliggers & regels/gordingen berekend op overspanning
  /// - Polycarbonaat kanaalplaten 16mm (standaard breedte 100cm of 98cm, lengte 250/300/350/400cm)
  /// - Aluminium profielenset (opleg-, tussen-, muur- en randprofielen met EPDM)
  /// - Complete dakgootset met afvoerbuis
  /// - Buiten: RVS Torx schroeven (A2/A4), lengte 2,5x houtdikte
  /// - Snijverlies/afschot dakplaten: +15% tot +20%
  static List<ConstructionMaterialItem> getOverkappingMaterials({
    required double width, // Breedte langs muur/goot (in meters, bijv. 6.00)
    required double depth, // Diepte / uitval (in meters, bijv. 2.00)
    required bool includeExtra,
  }) {
    final double area = width * depth;
    // Snijverlies voor daken & kanaalplaten is verplicht +15% tot +20%
    final double wastePct = 0.15;
    final double effectiveArea = includeExtra ? area * (1.0 + wastePct) : area;

    // 1. Staanders / palen:
    // Minimaal 4 palen altijd!
    // If width >= 4.0 m, spans require intermediate posts (every max ~2.5 - 3.0 m)
    final int frontPosts = width >= 5.5 ? 3 : (width >= 3.8 ? 3 : 2);
    // If freestanding, back needs equal posts. For lean-to (aanbouw) overkapping,
    // front needs frontPosts and back is wall-mounted (muurbalk) with wall-posts or anchors.
    // To strictly satisfy "minimaal 4 palen":
    final int totalPosts = (frontPosts >= 3 ? frontPosts + 2 : 4).clamp(4, 12);

    // 2. Fundering: 1 betonpoer + stelplaat per paal + 1 zak snelbeton per poer
    const double poerPrice = 24.50; // Betonpoer met RVS/verzinkte stelplaat M16
    const double snelbetonPrice = 8.95; // Zak 25kg snelbeton

    // 3. Draagbalken / Liggers:
    // 1 muurbalk (lengte width) + 1 voorligger / ringbalk (lengte width)
    // Dimension: geschaafd douglas / vurenhout 45 × 145 mm of 58 × 170 mm
    final int mainBeamsCount = 2; // Muurbalk + voorligger

    // 4. Gordingen / Dakliggers (tussenbalken / regels):
    // Rafters run over depth. Distance between rafters corresponds to multiwall sheet width (approx 100 cm).
    // Number of rafters = ceil(width / 1.00) + 1
    final int raftersCount = (width / 1.00).ceil() + 1;

    // 5. Polycarbonaat kanaalplaten (16mm X-structuur helder of opaal):
    // Standard width 100 cm (or 98 cm).
    // Sheet length chosen to cover depth + overhang (depth + 0.15m).
    // Standard trade lengths: 250 cm, 300 cm, 350 cm, 400 cm.
    final int sheetLengthCm;
    if (depth <= 2.35) {
      sheetLengthCm = 250;
    } else if (depth <= 2.85) {
      sheetLengthCm = 300;
    } else if (depth <= 3.35) {
      sheetLengthCm = 350;
    } else {
      sheetLengthCm = 400;
    }
    final int totalSheets = (width / 1.00).ceil().clamp(2, 20);

    // 6. Aluminium profielenset:
    // - Tussenprofielen (raftersCount - 1)
    // - Randprofielen (2 stuks)
    // - Muurprofiel met rubber (width meter)
    // - Kopschotjes, anti-stof tape (open en dicht)
    final int aluminiumProfilesCount = raftersCount + 1;

    // 7. Dakgootset:
    // Complete set: dakgoot lengte width, gootbeugels, eindstukken, bladvanger, regenpijp (2,5m) en 2 bochten
    final double gutterSetPrice = 89.0 + (width > 4.0 ? 35.0 : 0.0);

    // 8. Schroeven & Bevestiging (Universele regel: Buitenshuis = RVS Torx, 2.5x houtdikte):
    // Main timber thickness is 45mm -> screw length = 45 * 2.5 = 112.5mm -> standard 5.0x120mm RVS Torx
    // Sheet screws: RVS zelftappers met EPDM afdichtring (4.8x38mm of 5.5x65mm)
    final String timberScrewSpec = getScrewSpec(timberThicknessMm: 45, isOutdoor: true);

    // Costs benchmarked across Gamma, Hornbach, Bouwmaat, Jongeneel:
    // Kanaalplaten 16mm 100x250cm: Hornbach € 44,95 per plaat (100x250)
    final double sheetPriceEach = (sheetLengthCm == 250)
        ? 44.95
        : (sheetLengthCm == 300 ? 54.50 : (sheetLengthCm == 350 ? 64.00 : 74.00));
    final double totalRoofSheetsCost = totalSheets * sheetPriceEach;

    // Palen 12x12 cm douglas / geïmpregneerd (lengte 2.50m / 3.00m): € 34,50 per paal
    final double totalPostsCost = totalPosts * 34.50;

    // Betonpoeren & snelbeton:
    final double totalFoundationCost = totalPosts * (poerPrice + snelbetonPrice);

    // Draagbalken (45x145mm douglas/vuren per stuk): € 36.00 per balk van bijv. 3m of 4m
    final double mainBeamsCost = mainBeamsCount * (width >= 4.5 ? 65.0 : 42.0);

    // Gordingen / dakliggers (45x120mm): € 18.50 per legger
    final double raftersCost = raftersCount * (depth >= 3.0 ? 24.50 : 18.50);

    // Aluminium profielen & condensatietape compleet: € 26.50 per profielset
    final double profilesCost = aluminiumProfilesCount * 26.50;

    // RVS bevestigingsmateriaal & dakplaatschroeven:
    const double fastenersCost = 48.50;

    // Buitenbeits / houtolie (5L voor overkapping): € 45.00
    const double woodPreservativeCost = 45.00;

    return [
      ConstructionMaterialItem(
        id: 'overkapping_kanaalplaten',
        category: 'overkapping',
        nameNl: 'Polycarbonaat kanaalplaten 16 mm (helder/opaal, UV-bestendig)',
        nameEn: 'Polycarbonate multiwall sheets 16 mm (UV-resistant)',
        standardTradeDimension: '100 × $sheetLengthCm cm (16 mm X-structuur)',
        qty: '$totalSheets platen (${(totalSheets * 1.0 * (sheetLengthCm / 100.0)).toStringAsFixed(1)} m²)',
        qtyEn: '$totalSheets sheets (${(totalSheets * 1.0 * (sheetLengthCm / 100.0)).toStringAsFixed(1)} m²)',
        calculatedCost: totalRoofSheetsCost,
        icon: Icons.roofing,
        isOutdoor: true,
        wastePercentage: wastePct,
        priceGamma: totalSheets * (sheetPriceEach * 1.15),
        priceHornbach: totalRoofSheetsCost,
        priceBouwmaat: totalSheets * (sheetPriceEach * 0.95),
        priceJongeneel: totalSheets * (sheetPriceEach * 0.98),
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_palen',
        category: 'overkapping',
        nameNl: 'Constructie staanders / palen (minimaal 4 vereist)',
        nameEn: 'Upright structural support posts (min. 4 required)',
        standardTradeDimension: '12 × 12 cm geschaafd (lengte 250 of 300 cm)',
        qty: '$totalPosts stuks',
        qtyEn: '$totalPosts pieces',
        calculatedCost: totalPostsCost,
        icon: Icons.foundation,
        isOutdoor: true,
        priceGamma: totalPosts * 39.95,
        priceHornbach: totalPosts * 34.50,
        priceBouwmaat: totalPosts * 32.50,
        priceJongeneel: totalPosts * 31.90,
        preferredStore: 'Jongeneel',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_betonpoeren',
        category: 'overkapping',
        nameNl: 'Betonpoeren met verstelbare stelplaat + snelbeton',
        nameEn: 'Concrete post footings with adjustable plates + fast-setting concrete',
        standardTradeDimension: 'Poer 15 × 15 × 60 cm (M16) + zakken 25 kg',
        qty: '$totalPosts poeren + $totalPosts zakken snelbeton',
        qtyEn: '$totalPosts footings + $totalPosts bags concrete',
        calculatedCost: totalFoundationCost,
        icon: Icons.layers,
        isOutdoor: true,
        priceGamma: totalPosts * 36.50,
        priceHornbach: totalFoundationCost,
        priceBouwmaat: totalPosts * 31.00,
        priceJongeneel: totalPosts * 32.50,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_hoekverbinders',
        category: 'overkapping',
        nameNl: 'Hoekverbinders (verzinkt staal, voor balk-paal verbinding)',
        nameEn: 'Corner brackets / joist hangers (galvanised steel)',
        standardTradeDimension: '90 × 90 mm of 50 × 50 × 35 mm (verzinkt)',
        qty: '${totalPosts * 2} stuks',
        qtyEn: '${totalPosts * 2} pieces',
        calculatedCost: totalPosts * 2 * 2.50,
        icon: Icons.construction,
        isOutdoor: true,
        priceGamma: totalPosts * 2 * 4.00,
        priceHornbach: totalPosts * 2 * 3.50,
        priceBouwmaat: totalPosts * 2 * 2.50,
        priceJongeneel: totalPosts * 2 * 2.80,
        preferredStore: 'Bouwmaat',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_liggers',
        category: 'overkapping',
        nameNl: 'Horizontale draagbalken (muurbalk & voorligger)',
        nameEn: 'Horizontal support beams (wall beam & front beam)',
        standardTradeDimension: '45 × 145 mm (geschaafd, lengte ${width.toStringAsFixed(1)} m)',
        qty: '$mainBeamsCount stuks',
        qtyEn: '$mainBeamsCount pieces',
        calculatedCost: mainBeamsCost,
        icon: Icons.horizontal_rule,
        isOutdoor: true,
        priceGamma: mainBeamsCost * 1.12,
        priceHornbach: mainBeamsCost,
        priceBouwmaat: mainBeamsCost * 0.94,
        priceJongeneel: mainBeamsCost * 0.92,
        preferredStore: 'Jongeneel',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_gordingen',
        category: 'overkapping',
        nameNl: 'Dakregels / gordingen (ondersteuning kanaalplaten)',
        nameEn: 'Roof rafters / purlins (sheet support rafters)',
        standardTradeDimension: '45 × 120 mm (h.o.h. 100 cm, lengte ${depth.toStringAsFixed(1)} m)',
        qty: '$raftersCount stuks',
        qtyEn: '$raftersCount pieces',
        calculatedCost: raftersCost,
        icon: Icons.view_column,
        isOutdoor: true,
        priceGamma: raftersCost * 1.15,
        priceHornbach: raftersCost,
        priceBouwmaat: raftersCost * 0.93,
        priceJongeneel: raftersCost * 0.90,
        preferredStore: 'Jongeneel',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_profielen',
        category: 'overkapping',
        nameNl: 'Aluminium opleg-, tussen- en muurprofielen met EPDM',
        nameEn: 'Aluminium connecting & wall profiles with EPDM rubber seals',
        standardTradeDimension: 'Compleet profielsysteem lengte $sheetLengthCm cm',
        qty: '$aluminiumProfilesCount complete profielensets',
        qtyEn: '$aluminiumProfilesCount profile sets',
        calculatedCost: profilesCost,
        icon: Icons.border_all,
        isOutdoor: true,
        priceGamma: profilesCost * 1.18,
        priceHornbach: profilesCost,
        priceBouwmaat: profilesCost * 0.96,
        priceJongeneel: profilesCost * 0.95,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_dakgoot',
        category: 'overkapping',
        nameNl: 'Complete dakgootset met regenpijp, beugels & bladvanger',
        nameEn: 'Gutter set with downpipe, brackets & leaf guard',
        standardTradeDimension: 'PVC/Zink bakgoot lengte ${width.toStringAsFixed(1)} m + buis 2,5 m',
        qty: '1 complete set',
        qtyEn: '1 complete set',
        calculatedCost: gutterSetPrice,
        icon: Icons.water,
        isOutdoor: true,
        priceGamma: gutterSetPrice * 1.10,
        priceHornbach: gutterSetPrice,
        priceBouwmaat: gutterSetPrice * 0.92,
        priceJongeneel: gutterSetPrice * 0.95,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_bevestiging',
        category: 'overkapping',
        nameNl: 'RVS constructieschroeven (Torx) & dakplaatschroeven met EPDM',
        nameEn: 'Structural stainless Torx screws & roofing screws with EPDM washer',
        standardTradeDimension: timberScrewSpec,
        qty: '2 assortidozen (RVS A2 Torx)',
        qtyEn: '2 assorted boxes (RVS A2 Torx)',
        calculatedCost: fastenersCost,
        icon: Icons.hardware,
        isOutdoor: true,
        screwSpec: timberScrewSpec,
        priceGamma: 56.50,
        priceHornbach: fastenersCost,
        priceBouwmaat: 44.00,
        priceJongeneel: 45.50,
        preferredStore: 'Hornbach',
      ),
      ConstructionMaterialItem(
        id: 'overkapping_beits',
        category: 'overkapping',
        nameNl: 'Houtbescherming / UV-buitenbeits voor douglas/geïmpregneerd',
        nameEn: 'Exterior wood stain / UV protective oil',
        standardTradeDimension: effectiveArea >= 12.0 ? 'Blik 5,0 Liter' : 'Blik 2,5 Liter',
        qty: effectiveArea >= 12.0 ? '1 blik (5 liter)' : '1 blik (2,5 liter)',
        qtyEn: effectiveArea >= 12.0 ? '1 can (5 liters)' : '1 can (2.5 liters)',
        calculatedCost: woodPreservativeCost,
        icon: Icons.water_drop,
        isOutdoor: true,
        priceGamma: 49.95,
        priceHornbach: woodPreservativeCost,
        priceBouwmaat: 42.50,
        priceJongeneel: 43.00,
        preferredStore: 'Hornbach',
      ),
    ];
  }
}
