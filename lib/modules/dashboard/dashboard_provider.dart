import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:easy_four_diy/models/job_model.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  List<JobModel> _jobs = [];
  
  List<JobModel> get jobs => _jobs;
  
  int get totalJobs => _jobs.length;
  
  int get completedJobs => _jobs.where((j) => j.isCompleted).length;
  
  double get completedJobsPercent {
    if (totalJobs == 0) return 0.0;
    return (completedJobs / totalJobs) * 100;
  }

  double get totalSavings {
    return _jobs.fold(0.0, (sum, job) => sum + job.calculationResult.savings);
  }

  double get thisMonthSavings {
    final now = DateTime.now();
    final thisMonthJobs = _jobs.where((job) => job.date.month == now.month && job.date.year == now.year);
    return thisMonthJobs.fold(0.0, (sum, job) => sum + job.calculationResult.savings);
  }

  double get lastJobDiyCost {
    if (_jobs.isEmpty) return 0.0;
    return _jobs.last.calculationResult.materialCost;
  }

  double get lastJobProCost {
    if (_jobs.isEmpty) return 0.0;
    return _jobs.last.calculationResult.outsourcingCost;
  }

  /// DIY active hours of the most recent job (klusserHours from the engine).
  double get lastJobDiyHours {
    if (_jobs.isEmpty) return 0.0;
    return _jobs.last.calculationResult.klusserHours;
  }

  /// Sum of materialCost across all jobs — used for the cost overview donut chart.
  double get totalMaterialCost {
    return _jobs.fold(0.0, (sum, job) => sum + job.calculationResult.materialCost);
  }

  /// Sum of laborCost across all jobs — displayed as "Tools" in the chart.
  double get totalToolsCost {
    return _jobs.fold(0.0, (sum, job) => sum + job.calculationResult.laborCost);
  }

  void loadJobs(String userId) {
    _jobs = HiveService.getUserJobs(userId);
    // Sort by date descending
    _jobs.sort((a, b) => b.date.compareTo(a.date));
    notifyListeners();
  }
}
