import 'package:hive/hive.dart';

part 'calculation_result_model.g.dart';

@HiveType(typeId: 3)
class CalculationResultModel extends HiveObject {
  @HiveField(0)
  final double area;

  @HiveField(1)
  final double reserveArea;

  @HiveField(2)
  final int packs;

  @HiveField(3)
  final int paintLiters;

  @HiveField(4)
  final int laborHours;

  @HiveField(5)
  final double materialCost;

  @HiveField(6)
  final double laborCost;

  @HiveField(7)
  final double outsourcingCost;

  @HiveField(8)
  final double savings;

  @HiveField(9)
  final int savingsPercent;

  @HiveField(10)
  final double proHours;

  @HiveField(11)
  final double klusserHours;

  CalculationResultModel({
    required this.area,
    required this.reserveArea,
    required this.packs,
    required this.paintLiters,
    required this.laborHours,
    required this.materialCost,
    required this.laborCost,
    required this.outsourcingCost,
    required this.savings,
    required this.savingsPercent,
    required this.proHours,
    required this.klusserHours,
  });

  CalculationResultModel.empty()
      : area = 0.0,
        reserveArea = 0.0,
        packs = 0,
        paintLiters = 0,
        laborHours = 0,
        materialCost = 0.0,
        laborCost = 0.0,
        outsourcingCost = 0.0,
        savings = 0.0,
        savingsPercent = 0,
        proHours = 0.0,
        klusserHours = 0.0;
}
