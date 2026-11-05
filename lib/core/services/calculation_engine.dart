import 'dart:math';
import 'package:easy_four_diy/models/calculation_result_model.dart';

class CalculationEngine {
  static CalculationResultModel calculate({
    required double length,
    required double width,
    required double height,
    required bool isPainting,
    bool isBehangen = false,
    bool isTerras = false,
    bool isLaminaat = false,
    bool isDeurbel = false,
    bool isOverkapping = false,
    bool isGipswand = false,
    bool isArtificialGrass = false,
    bool isPlakplinten = false,
    bool isTiler = false,
    bool isTilerWall = false,
    bool isTilerGrouting = false,
    bool isPlumber = false,
    bool includeExtra = true,
  }) {
    if (isDeurbel) {
      // Doorbell installation (single unit)
      const double matCost = 35.00;
      const int hours = 1; // 30-45 min (ca. 0,5 - 1 uur)
      const double proCost = 85.00;
      const double sav = proCost - matCost;
      const int savPct = 59;
      return CalculationResultModel(
        area: 0.0,
        reserveArea: 0.0,
        packs: 1,
        paintLiters: 0,
        laborHours: hours,
        proHours: 0.5,
        klusserHours: 1.0,
        materialCost: matCost,
        laborCost: 0.0,
        outsourcingCost: proCost,
        savings: sav,
        savingsPercent: savPct,
      );
    }

    // ── Klus 3: Overkapping bouwen (met kanaalplaten) ─────────────────────────
    if (isOverkapping) {
      // For overkapping, width is breedte (e.g. 6.00m) and length is diepte (e.g. 2.00m)
      final double b = width > 0 ? width : (length > 0 ? length : 6.0);
      final double d = (width > 0 && length > 0)
          ? (length < width ? length : width)
          : (height > 0 ? height : 2.0);
      final double area = b * d;

      // Universele regel: Daken & dakplaten vereisen +15% tot +20% snijverlies/afschot
      const double wastePct = 0.15;
      final double reserveArea = includeExtra ? area * (1.0 + wastePct) : area;

      final double effectiveArea = includeExtra ? reserveArea : area;
      final double materialCost = effectiveArea * 123.0;
      final double proMaterialCost = effectiveArea * 116.0;
      final int sheetPacks = (b / 1.00).ceil();

      final double proHours = area * 0.80;
      final double klusserHours = area * 2.0;
      final double outsourcingCost = proMaterialCost + (proHours * 40.0);
      final double savings = outsourcingCost - materialCost;
      final int savingsPercent = outsourcingCost > 0
          ? ((savings / outsourcingCost) * 100).round()
          : 0;

      return CalculationResultModel(
        area: area,
        reserveArea: reserveArea,
        packs: sheetPacks,
        paintLiters: 0,
        laborHours: max(1, klusserHours.ceil()),
        proHours: proHours,
        klusserHours: klusserHours,
        materialCost: materialCost,
        laborCost: 0.0,
        outsourcingCost: outsourcingCost,
        savings: savings,
        savingsPercent: savingsPercent,
      );
    }

    // ── Klus 5: Wand plaatsen (Gipsplaat + Metaalstud) ─────────────────────
    if (isGipswand) {
      final double l = length > 0 ? length : 4.0;
      final double h = height > 0 ? height : 2.5;
      final double area = l * h;

      // Universele regel: Snijverlies standaard +10%
      const double wastePct = 0.10;
      final double reserveArea = includeExtra ? area * (1.0 + wastePct) : area;
      final double effectiveArea = includeExtra ? reserveArea : area;

      // Document 2 – Klus 5: Standaard app-rekenmateriaal per m²: €30 C / €19,50 P
      final double materialCost = effectiveArea * 30.00;
      final double proMaterialCost = effectiveArea * 19.50;

      final int boardsCount = ((reserveArea / 1.56).ceil() * 2).clamp(4, 200);

      final double proHours = area * 0.33;
      // Document 5 – Klus 5: Klusser-tijd 1,0 u per m²
      final double klusserHours = area * 1.0;
      final double outsourcingCost = proMaterialCost + (proHours * 45.0);
      final double savings = outsourcingCost - materialCost;
      final int savingsPercent = outsourcingCost > 0
          ? ((savings / outsourcingCost) * 100).round()
          : 0;

      return CalculationResultModel(
        area: area,
        reserveArea: reserveArea,
        packs: boardsCount,
        paintLiters: 0,
        laborHours: max(1, klusserHours.ceil()),
        proHours: proHours,
        klusserHours: klusserHours,
        materialCost: materialCost,
        laborCost: 0.0,
        outsourcingCost: outsourcingCost,
        savings: savings,
        savingsPercent: savingsPercent,
      );
    }

    // ── Klus 3: Plinten monteren (Plakplint) ─────────────────────────────────
    if (isPlakplinten && !isLaminaat) {
      // Perimeter calculation: 2 * (length + width) minus doors (~1.8m)
      final double perimeter;
      if (length > 0 && width > 0) {
        perimeter = max(2.0, (2 * (length + width)) - 1.8);
      } else if (length > 0) {
        perimeter = length;
      } else {
        perimeter = 14.0; // fallback perimeter
      }

      // Universele regel: Snijverlies +10% voor plinten
      const double wastePct = 0.10;
      final double effectivePerimeter = includeExtra
          ? perimeter * (1.0 + wastePct)
          : perimeter;

      // Document 2 – Klus 3: Standaard app-rekenmateriaal per meter: €15 C / €9,50 P
      final double materialCost = effectivePerimeter * 15.00;
      final double proMaterialCost = effectivePerimeter * 9.50;
      final int totalStrips = (effectivePerimeter / 2.40).ceil();

      final double proHours = perimeter * 0.10;
      // Document 5 – Klus 3: Klusser-tijd 0,30 u per meter
      final double klusserHours = perimeter * 0.30;
      final double outsourcingCost = proMaterialCost + (proHours * 45.0);
      final double savings = outsourcingCost - materialCost;
      final int savingsPercent = outsourcingCost > 0
          ? ((savings / outsourcingCost) * 100).round()
          : 0;

      return CalculationResultModel(
        area: perimeter,
        reserveArea: effectivePerimeter,
        packs: totalStrips,
        paintLiters: 0,
        laborHours: max(1, klusserHours.ceil()),
        proHours: proHours,
        klusserHours: klusserHours,
        materialCost: materialCost,
        laborCost: 0.0,
        outsourcingCost: outsourcingCost,
        savings: savings,
        savingsPercent: savingsPercent,
      );
    }

    // ── Area Calculation for Other Traditional Jobs ──────────────────────────
    double area = 0.0;
    if (height > 0) {
      area = length * height;
    } else {
      area = length * width;
    }

    // Area with 10% reserve
    double reserveArea = includeExtra ? area * 1.10 : area;
    double effectiveArea = includeExtra ? reserveArea : area;

    // Materials Required
    int packs = isBehangen
        ? (reserveArea / 5.3).ceil()
        : (isTiler
              ? max(1, (reserveArea / 1.44).ceil())
              : (reserveArea / 2.4).ceil());
    int paintLiters = (area * 0.1).ceil();

    // laborHours is derived after proHours/klusserHours are computed below

    // Costs
    double materialCost;
    double proMaterialCost;
    if (isBehangen) {
      materialCost = effectiveArea * 7.0;
      proMaterialCost = effectiveArea * 5.0;
    } else if (isTerras) {
      materialCost = effectiveArea * 48.0;
      proMaterialCost = effectiveArea * 33.0;
    } else if (isLaminaat) {
      // Document 5 – Klus 1: standaard rekenmateriaal €31/m² C / €24/m² P
      materialCost = effectiveArea * 31.00;
      proMaterialCost = effectiveArea * 24.00;
    } else if (isArtificialGrass) {
      materialCost = effectiveArea * 41.60;
      proMaterialCost = effectiveArea * 28.50;
    } else if (isPainting) {
      materialCost = effectiveArea * 4.50;
      proMaterialCost = effectiveArea * 3.00;
    } else if (isTiler) {
      if (isTilerGrouting) {
        materialCost = effectiveArea * 5.20;
        proMaterialCost = effectiveArea * 3.30;
      } else {
        materialCost = effectiveArea * (isTilerWall ? 57.50 : 39.90);
        proMaterialCost = effectiveArea * (isTilerWall ? 39.00 : 26.80);
      }
    } else if (isPlumber) {
      materialCost = packs * 45.0;
      proMaterialCost = materialCost;
    } else {
      materialCost = packs * 25.0;
      proMaterialCost = materialCost;
    }
    double proHours = 0.0;
    double klusserHours = 0.0;
    double hourlyRate = 45.0; // default for carpenter/painter/tiler

    if (isBehangen) {
      proHours = area * 0.25;
      klusserHours = area * 0.60;
    } else if (isTerras) {
      // Bestrating
      proHours = area * 0.30;
      klusserHours = area * 0.75;
      hourlyRate = 40.0; // Gardener
    } else if (isOverkapping || isArtificialGrass) {
      proHours = area * (isOverkapping ? 0.80 : 0.10);
      klusserHours = area * (isOverkapping ? 2.00 : 0.25);
      hourlyRate = 40.0;
    } else if (isLaminaat) {
      // Vloer leggen
      // Document 5 – Klus 1: Pro-tijd 0,15 u/m², Klusser-tijd 0,45 u/m²
      proHours = area * 0.15;
      klusserHours = area * 0.45;
    } else if (isPainting) {
      // Muur/plafond sauzen
      proHours = area * 0.10;
      klusserHours = area * 0.25;
    } else if (isTiler) {
      // Tegelzetter (€45/u) – vloertegels 0.50/1.20, wandtegels 0.40/1.00 per m²
      if (isTilerGrouting) {
        proHours = area * 0.10;
        klusserHours = area * 0.25;
      } else if (isTilerWall) {
        proHours = area * 0.40;
        klusserHours = area * 1.00;
      } else {
        proHours = area * 0.50;
        klusserHours = area * 1.20;
      }
      hourlyRate = 45.0;
    } else if (isPlumber) {
      // Loodgieter (€55/u)
      proHours = max(1.0, area * 0.20);
      klusserHours = max(2.0, area * 0.50);
      hourlyRate = 55.0;
    } else {
      proHours = area * 0.15;
      klusserHours = area * 0.40;
    }

    int laborHours = max(1, klusserHours.ceil()); // DIY active hours

    // DIY uses consumer materials only; professional cost uses P-material plus labour.
    final double outsourcingCost = proMaterialCost + (proHours * hourlyRate);
    final double savings = outsourcingCost - materialCost;
    int savingsPercent = 0;

    if (outsourcingCost > 0) {
      savingsPercent = ((savings / outsourcingCost) * 100).round();
    }

    return CalculationResultModel(
      area: area,
      reserveArea: reserveArea,
      packs: packs,
      paintLiters: paintLiters,
      laborHours: laborHours,
      proHours: proHours,
      klusserHours: klusserHours,
      materialCost: materialCost,
      laborCost: 0.0,
      outsourcingCost: outsourcingCost,
      savings: savings,
      savingsPercent: savingsPercent,
    );
  }
}
