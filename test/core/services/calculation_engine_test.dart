import 'package:easy_four_diy/core/services/calculation_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PDF material and professional cost calculations', () {
    test('wallpaper uses C materials for DIY and P materials plus labour', () {
      final result = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isBehangen: true,
        includeExtra: false,
      );

      expect(result.materialCost, closeTo(7.00, 0.001));
      expect(result.outsourcingCost, closeTo(16.25, 0.001));
      expect(result.savings, closeTo(9.25, 0.001));
      expect(result.laborCost, 0);
    });

    test('laminate uses separate C and P material prices', () {
      final result = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isLaminaat: true,
        includeExtra: false,
      );

      expect(result.materialCost, closeTo(31.00, 0.001));
      expect(result.outsourcingCost, closeTo(30.75, 0.001));
      expect(result.savings, closeTo(-0.25, 0.001));
    });

    test('painting uses PDF material prices and trade rate', () {
      final result = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: true,
        includeExtra: false,
      );

      expect(result.materialCost, closeTo(4.50, 0.001));
      expect(result.outsourcingCost, closeTo(7.50, 0.001));
      expect(result.savings, closeTo(3.00, 0.001));
    });

    test('paving preserves a negative saving when DIY materials cost more', () {
      final result = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isTerras: true,
        includeExtra: false,
      );

      expect(result.materialCost, closeTo(48.00, 0.001));
      expect(result.outsourcingCost, closeTo(45.00, 0.001));
      expect(result.savings, closeTo(-3.00, 0.001));
    });

    test('artificial grass uses P materials plus gardener labour', () {
      final result = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isArtificialGrass: true,
        includeExtra: false,
      );

      expect(result.materialCost, closeTo(41.60, 0.001));
      expect(result.outsourcingCost, closeTo(32.50, 0.001));
      expect(result.savings, closeTo(-9.10, 0.001));
    });

    test('tile and grout calculations use distinct material prices', () {
      final floorTiles = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isTiler: true,
        includeExtra: false,
      );
      final grout = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isTiler: true,
        isTilerGrouting: true,
        includeExtra: false,
      );

      expect(floorTiles.materialCost, closeTo(39.90, 0.001));
      expect(floorTiles.outsourcingCost, closeTo(49.30, 0.001));
      expect(floorTiles.savings, closeTo(9.40, 0.001));
      expect(grout.materialCost, closeTo(5.20, 0.001));
      expect(grout.outsourcingCost, closeTo(7.80, 0.001));
      expect(grout.savings, closeTo(2.60, 0.001));
    });

    test('wall tiles, drywall, and canopy use P materials in pro totals', () {
      final wallTiles = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isTiler: true,
        isTilerWall: true,
        includeExtra: false,
      );
      final drywall = CalculationEngine.calculate(
        length: 1,
        width: 0,
        height: 1,
        isPainting: false,
        isGipswand: true,
        includeExtra: false,
      );
      final canopy = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: false,
        isOverkapping: true,
        includeExtra: false,
      );

      expect(wallTiles.materialCost, closeTo(57.50, 0.001));
      expect(wallTiles.outsourcingCost, closeTo(57.00, 0.001));
      expect(wallTiles.savings, closeTo(-0.50, 0.001));
      expect(drywall.materialCost, closeTo(30.00, 0.001));
      expect(drywall.outsourcingCost, closeTo(34.35, 0.001));
      expect(drywall.savings, closeTo(4.35, 0.001));
      expect(canopy.materialCost, closeTo(123.00, 0.001));
      expect(canopy.outsourcingCost, closeTo(148.00, 0.001));
      expect(canopy.savings, closeTo(25.00, 0.001));
    });

    test('area-based reserve is applied consistently to C and P materials', () {
      final result = CalculationEngine.calculate(
        length: 1,
        width: 1,
        height: 0,
        isPainting: true,
      );

      expect(result.materialCost, closeTo(4.95, 0.001));
      expect(result.outsourcingCost, closeTo(7.80, 0.001));
      expect(result.savings, closeTo(2.85, 0.001));
    });
  });
}
