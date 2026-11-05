import 'package:easy_four_diy/models/calculation_result_model.dart';
import 'package:hive/hive.dart';

part 'job_model.g.dart';

@HiveType(typeId: 4)
class JobModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String jobName;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final CalculationResultModel calculationResult;

  @HiveField(5)
  final bool isCompleted;

  JobModel({
    required this.id,
    required this.userId,
    required this.jobName,
    required this.date,
    required this.calculationResult,
    required this.isCompleted,
  });
}
