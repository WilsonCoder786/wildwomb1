import 'package:easy_four_diy/modules/onboarding/onboarding_provider.dart';
import 'package:easy_four_diy/core/services/onboarding_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

class _CustomPdfCase {
  const _CustomPdfCase({
    required this.name,
    required this.trade,
    required this.job,
    required this.materialC,
    required this.materialP,
    required this.proHours,
    required this.diyHours,
    required this.hourlyRate,
    this.count = 1,
    this.length,
    this.stairCount,
  });

  final String name;
  final String trade;
  final String job;
  final double materialC;
  final double materialP;
  final double proHours;
  final double diyHours;
  final double hourlyRate;
  final int count;
  final double? length;
  final int? stairCount;
}

class _AreaPdfCase {
  const _AreaPdfCase({
    required this.name,
    required this.trade,
    required this.job,
    required this.materialC,
    required this.materialP,
    required this.proHours,
    required this.diyHours,
    required this.hourlyRate,
  });

  final String name;
  final String trade;
  final String job;
  final double materialC;
  final double materialP;
  final double proHours;
  final double diyHours;
  final double hourlyRate;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await OnboardingDataService.instance.init();
  });

  group('PDF custom-input calculations', () {
    test('Cable laying uses per-metre C/P prices and electrician rate', () {
      final provider = OnboardingProvider()
        ..selectJob('Electrician', 'electrician')
        ..selectSpecificJob('Cable laying')
        ..setCustomLength(1);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(3.50, 0.001));
      expect(result.outsourcingCost, closeTo(8.00, 0.001));
      expect(result.savings, closeTo(4.50, 0.001));
      expect(result.laborCost, 0);
    });

    test('kitchen tap uses P materials plus plumber labour', () {
      final provider = OnboardingProvider()
        ..selectJob('Plumber', 'plumber')
        ..selectSpecificJob('Kitchen tap')
        ..setCustomCount(1);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(115.00, 0.001));
      expect(result.outsourcingCost, closeTo(133.00, 0.001));
      expect(result.savings, closeTo(18.00, 0.001));
    });

    test('frame painting uses per-item C/P prices', () {
      final provider = OnboardingProvider()
        ..selectJob('Painter', 'painter')
        ..selectSpecificJob('Window frame/door painting')
        ..setCustomCount(1);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(18.50, 0.001));
      expect(result.outsourcingCost, closeTo(80.00, 0.001));
      expect(result.savings, closeTo(61.50, 0.001));
    });

    test('tile repair uses per-tile C/P prices', () {
      final provider = OnboardingProvider()
        ..selectJob('Tiler', 'tiler')
        ..selectSpecificJob('Repairing tiles')
        ..setCustomCount(1);
      expect(provider.needsAreaCalculation, isFalse);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(14.50, 0.001));
      expect(result.outsourcingCost, closeTo(32.45, 0.001));
      expect(result.savings, closeTo(17.95, 0.001));
    });

    test('sealant uses the actual English job label and per-metre prices', () {
      final provider = OnboardingProvider()
        ..selectJob('Tiler', 'tiler')
        ..selectSpecificJob('Applying sealant')
        ..setCustomLength(1);
      expect(provider.needsAreaCalculation, isFalse);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(4.70, 0.001));
      expect(result.outsourcingCost, closeTo(5.20, 0.001));
      expect(result.savings, closeTo(0.50, 0.001));
      expect(result.proHours, closeTo(0.05, 0.001));
      expect(result.klusserHours, closeTo(0.125, 0.001));
    });

    test('hydrangea pruning has no material cost and uses gardener rate', () {
      final provider = OnboardingProvider()
        ..selectJob('Gardener', 'gardener')
        ..selectSpecificJob('Pruning hydrangeas')
        ..setCustomCount(1);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(4.00, 0.001));
      expect(result.outsourcingCost, closeTo(42.50, 0.001));
      expect(result.savings, closeTo(38.50, 0.001));
    });

    test('water-pipe installation uses its actual English job label', () {
      final provider = OnboardingProvider()
        ..selectJob('Plumber', 'plumber')
        ..selectSpecificJob('Water pipe installation (copper)')
        ..setCustomLength(1);
      expect(provider.needsAreaCalculation, isFalse);
      provider.calculateFromCustomInputs();

      final result = provider.calcResult!;
      expect(result.materialCost, closeTo(8.50, 0.001));
      expect(result.outsourcingCost, closeTo(13.75, 0.001));
      expect(result.savings, closeTo(5.25, 0.001));
      expect(result.proHours, closeTo(0.15, 0.001));
      expect(result.klusserHours, closeTo(0.30, 0.001));
    });

    test('toilet DIY time matches the PDF', () {
      final provider = OnboardingProvider()
        ..selectJob('Plumber', 'plumber')
        ..selectSpecificJob('Toilet installation')
        ..setCustomCount(1);
      provider.calculateFromCustomInputs();

      expect(provider.calcResult!.proHours, closeTo(2.5, 0.001));
      expect(provider.calcResult!.klusserHours, closeTo(5.0, 0.001));
      expect(provider.calcResult!.laborHours, 5);
    });

    test('stop-point selections block further calculation until cleared', () {
      final provider = OnboardingProvider()
        ..selectJob('Electrician', 'electrician')
        ..selectSpecificJob('Outlet installation');

      provider.setSafetyStopPointSelected('damaged_wiring', true);
      expect(provider.hasReportedSafetyStopPoint, isTrue);
      provider.setSafetyStopPointSelected('damaged_wiring', false);
      expect(provider.hasReportedSafetyStopPoint, isFalse);
    });

    final cases = [
      _CustomPdfCase(
        name: 'interior door',
        trade: 'carpenter',
        job: 'Door installation',
        materialC: 193,
        materialP: 130.5,
        proHours: 2.5,
        diyHours: 7,
        hourlyRate: 45,
      ),
      _CustomPdfCase(
        name: 'adhesive skirting',
        trade: 'carpenter',
        job: 'Skirting board installation',
        materialC: 15,
        materialP: 9.5,
        proHours: 0.1,
        diyHours: 0.3,
        hourlyRate: 45,
        length: 1,
      ),
      _CustomPdfCase(
        name: 'stair renovation',
        trade: 'carpenter',
        job: 'Staircase renovation',
        materialC: 41.6,
        materialP: 28.5,
        proHours: 0.75,
        diyHours: 2,
        hourlyRate: 45,
        stairCount: 1,
      ),
      _CustomPdfCase(
        name: 'painted frame',
        trade: 'painter',
        job: 'Window frame/door painting',
        materialC: 18.5,
        materialP: 12.5,
        proHours: 1.5,
        diyHours: 3.5,
        hourlyRate: 45,
      ),
      _CustomPdfCase(
        name: 'painted radiator',
        trade: 'painter',
        job: 'Radiator painting',
        materialC: 12.5,
        materialP: 8.5,
        proHours: 0.75,
        diyHours: 2,
        hourlyRate: 45,
      ),
      _CustomPdfCase(
        name: 'kitchen tap',
        trade: 'plumber',
        job: 'Kitchen tap replacement',
        materialC: 115,
        materialP: 78,
        proHours: 1,
        diyHours: 2.5,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'drain unblocking',
        trade: 'plumber',
        job: 'Drain unblocking',
        materialC: 15,
        materialP: 10,
        proHours: 0.75,
        diyHours: 1.5,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'toilet installation',
        trade: 'plumber',
        job: 'Toilet installation',
        materialC: 347,
        materialP: 254,
        proHours: 2.5,
        diyHours: 5,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'central-heating refill',
        trade: 'plumber',
        job: 'Central heating refill',
        materialC: 18,
        materialP: 12,
        proHours: 0.25,
        diyHours: 0.5,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'straight copper pipe',
        trade: 'plumber',
        job: 'Water pipe installation (copper)',
        materialC: 8.5,
        materialP: 5.5,
        proHours: 0.15,
        diyHours: 0.30,
        hourlyRate: 55,
        length: 1,
      ),
      _CustomPdfCase(
        name: 'electrical outlet',
        trade: 'electrician',
        job: 'Outlet installation',
        materialC: 28,
        materialP: 17.5,
        proHours: 0.75,
        diyHours: 1.9,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'two electrical outlets',
        trade: 'electrician',
        job: 'Outlet installation',
        materialC: 56,
        materialP: 35,
        proHours: 1.5,
        diyHours: 3.8,
        hourlyRate: 55,
        count: 2,
      ),
      _CustomPdfCase(
        name: 'lighting installation',
        trade: 'electrician',
        job: 'Lighting installation',
        materialC: 41,
        materialP: 28.65,
        proHours: 0.5,
        diyHours: 1.25,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'cable laying',
        trade: 'electrician',
        job: 'Cable laying',
        materialC: 3.5,
        materialP: 2.5,
        proHours: 0.1,
        diyHours: 0.25,
        hourlyRate: 55,
        length: 1,
      ),
      _CustomPdfCase(
        name: 'cable trunking',
        trade: 'electrician',
        job: 'Cable trunking installation',
        materialC: 4,
        materialP: 2.75,
        proHours: 0.07,
        diyHours: 0.17,
        hourlyRate: 55,
        length: 1,
      ),
      _CustomPdfCase(
        name: 'smoke detector',
        trade: 'electrician',
        job: 'Smoke detector installation',
        materialC: 25.5,
        materialP: 18.35,
        proHours: 0.25,
        diyHours: 0.60,
        hourlyRate: 55,
      ),
      _CustomPdfCase(
        name: 'fence',
        trade: 'gardener',
        job: 'Fence installation',
        materialC: 47,
        materialP: 34,
        proHours: 0.5,
        diyHours: 1,
        hourlyRate: 40,
        length: 1,
      ),
      _CustomPdfCase(
        name: 'hydrangea pruning',
        trade: 'gardener',
        job: 'Pruning',
        materialC: 4,
        materialP: 2.5,
        proHours: 1,
        diyHours: 2.5,
        hourlyRate: 40,
      ),
      _CustomPdfCase(
        name: 'tile repair',
        trade: 'tiler',
        job: 'Repairing tiles',
        materialC: 14.5,
        materialP: 9.95,
        proHours: 0.5,
        diyHours: 1.25,
        hourlyRate: 45,
      ),
      _CustomPdfCase(
        name: 'sealant',
        trade: 'tiler',
        job: 'Applying sealant',
        materialC: 4.7,
        materialP: 2.95,
        proHours: 0.05,
        diyHours: 0.125,
        hourlyRate: 45,
        length: 1,
      ),
    ];

    for (final testCase in cases) {
      test('${testCase.trade}: ${testCase.name} matches PDF unit figures', () {
        final provider = OnboardingProvider()
          ..selectJob(testCase.trade, testCase.trade)
          ..selectSpecificJob(testCase.job);
        provider.setCustomCount(testCase.count);
        if (testCase.length != null) {
          provider.setCustomLength(testCase.length!);
        }
        if (testCase.stairCount != null) {
          provider.setTrapAantalTreden(testCase.stairCount!);
        }
        provider.calculateFromCustomInputs();

        final result = provider.calcResult!;
        final proTotal =
            testCase.materialP + testCase.proHours * testCase.hourlyRate;
        expect(result.materialCost, closeTo(testCase.materialC, 0.001));
        expect(result.proHours, closeTo(testCase.proHours, 0.001));
        expect(result.klusserHours, closeTo(testCase.diyHours, 0.001));
        expect(result.outsourcingCost, closeTo(proTotal, 0.001));
        expect(result.savings, closeTo(proTotal - testCase.materialC, 0.001));
        expect(result.laborCost, 0);
      });
    }

    final areaCases = [
      _AreaPdfCase(
        name: 'laminate floor',
        trade: 'carpenter',
        job: 'Floor installation',
        materialC: 31,
        materialP: 24,
        proHours: 0.15,
        diyHours: 0.45,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'drywall partition',
        trade: 'carpenter',
        job: 'Partition wall installation',
        materialC: 30,
        materialP: 19.5,
        proHours: 0.33,
        diyHours: 1,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'wall painting',
        trade: 'painter',
        job: 'Paint walls',
        materialC: 4.5,
        materialP: 3,
        proHours: 0.1,
        diyHours: 0.25,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'ceiling painting',
        trade: 'painter',
        job: 'Paint ceilings',
        materialC: 4.5,
        materialP: 3,
        proHours: 0.1,
        diyHours: 0.25,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'wallpaper',
        trade: 'painter',
        job: 'Wallpapering',
        materialC: 7,
        materialP: 5,
        proHours: 0.25,
        diyHours: 0.60,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'paving',
        trade: 'gardener',
        job: 'Paving installation',
        materialC: 48,
        materialP: 33,
        proHours: 0.30,
        diyHours: 0.75,
        hourlyRate: 40,
      ),
      _AreaPdfCase(
        name: 'wooden canopy',
        trade: 'gardener',
        job: 'Canopy construction',
        materialC: 123,
        materialP: 116,
        proHours: 0.80,
        diyHours: 2,
        hourlyRate: 40,
      ),
      _AreaPdfCase(
        name: 'artificial grass',
        trade: 'gardener',
        job: 'Lawn laying',
        materialC: 41.6,
        materialP: 28.5,
        proHours: 0.10,
        diyHours: 0.25,
        hourlyRate: 40,
      ),
      _AreaPdfCase(
        name: 'floor tiles',
        trade: 'tiler',
        job: 'Laying floor tiles',
        materialC: 39.9,
        materialP: 26.8,
        proHours: 0.50,
        diyHours: 1.20,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'wall tiles',
        trade: 'tiler',
        job: 'Installing wall tiles',
        materialC: 57.5,
        materialP: 39,
        proHours: 0.40,
        diyHours: 1,
        hourlyRate: 45,
      ),
      _AreaPdfCase(
        name: 'grouting',
        trade: 'tiler',
        job: 'Grouting',
        materialC: 5.2,
        materialP: 3.3,
        proHours: 0.10,
        diyHours: 0.25,
        hourlyRate: 45,
      ),
    ];

    for (final testCase in areaCases) {
      test('${testCase.trade}: ${testCase.name} matches PDF unit figures', () {
        final provider = OnboardingProvider()
          ..selectJob(testCase.trade, testCase.trade)
          ..selectSpecificJob(testCase.job)
          ..updateMeasurements(
            length: 1,
            width: 1,
            height: 1,
            includeExtra: false,
          );
        expect(provider.needsAreaCalculation, isTrue);

        final result = provider.calcResult!;
        final proTotal =
            testCase.materialP + testCase.proHours * testCase.hourlyRate;
        expect(result.materialCost, closeTo(testCase.materialC, 0.001));
        expect(result.proHours, closeTo(testCase.proHours, 0.001));
        expect(result.klusserHours, closeTo(testCase.diyHours, 0.001));
        expect(result.outsourcingCost, closeTo(proTotal, 0.001));
        expect(result.savings, closeTo(proTotal - testCase.materialC, 0.001));
      });
    }
  });
}
