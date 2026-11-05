import 'package:easy_four_diy/models/category_model.dart';
import 'package:easy_four_diy/models/subjob_model.dart';
import 'package:easy_four_diy/models/calculation_result_model.dart';
import 'package:easy_four_diy/core/database_seed.dart';
import 'package:easy_four_diy/models/job_model.dart';
import 'package:easy_four_diy/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _userBoxName = 'userBox';
  static const String _settingsBoxName = 'settingsBox';
  static const String _categoryBoxName = 'categoryBox';
  static const String _subJobBoxName = 'subJobBox';
  static const String _calculationBoxName = 'calculationBox';
  static const String _jobBoxName = 'jobBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryModelAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(SubJobModelAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(CalculationResultModelAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(JobModelAdapter());
    }

    // Open Boxes
    if (!Hive.isBoxOpen(_userBoxName)) await Hive.openBox<UserModel>(_userBoxName);
    if (!Hive.isBoxOpen(_settingsBoxName)) await Hive.openBox(_settingsBoxName);
    if (!Hive.isBoxOpen(_categoryBoxName)) await Hive.openBox<CategoryModel>(_categoryBoxName);
    if (!Hive.isBoxOpen(_subJobBoxName)) await Hive.openBox<SubJobModel>(_subJobBoxName);
    if (!Hive.isBoxOpen(_calculationBoxName)) await Hive.openBox<CalculationResultModel>(_calculationBoxName);
    if (!Hive.isBoxOpen(_jobBoxName)) await Hive.openBox<JobModel>(_jobBoxName);

    // Seed database if empty
    await DatabaseSeed.seedIfEmpty();
  }

  static Box<UserModel> get _userBox => Hive.box<UserModel>(_userBoxName);
  static Box get _settingsBox => Hive.box(_settingsBoxName);
  static Box<CategoryModel> get categoryBox => Hive.box<CategoryModel>(_categoryBoxName);
  static Box<SubJobModel> get subJobBox => Hive.box<SubJobModel>(_subJobBoxName);
  static Box<CalculationResultModel> get calculationBox => Hive.box<CalculationResultModel>(_calculationBoxName);
  static Box<JobModel> get jobBox => Hive.box<JobModel>(_jobBoxName);

  // User Operations
  static Future<void> saveUser(UserModel user) async {
    await _userBox.put(user.email, user);
    await saveSetting('currentUserEmail', user.email);
  }

  static UserModel? getCurrentUser() {
    final email = getSetting<String>('currentUserEmail');
    if (email != null) {
      return _userBox.get(email);
    }
    return null;
  }

  static UserModel? getUserByEmail(String email) {
    return _userBox.get(email);
  }

  static Future<void> deleteUser() async {
    final email = getSetting<String>('currentUserEmail');
    if (email != null && email.isNotEmpty) {
      await _userBox.delete(email);
      await _settingsBox.delete('pwd_$email');
    }
    await _settingsBox.delete('currentUserEmail');
  }

  static Future<void> updateFreeTrialStatus(bool status) async {
    final user = getCurrentUser();
    if (user != null) {
      user.freeTrialUsed = status;
      await user.save(); // Using HiveObject's save()
    }
  }

  static Future<void> updateSubscriptionStatus(String status) async {
    final user = getCurrentUser();
    if (user != null) {
      user.subscriptionStatus = status;
      await user.save();
    }
  }

  // Job Operations
  static Future<void> saveJob(JobModel job) async {
    await jobBox.put(job.id, job);
  }

  static List<JobModel> getUserJobs(String userId) {
    return jobBox.values.where((job) => job.userId == userId).toList();
  }

  // Settings Operations
  static T? getSetting<T>(String key, {T? defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  // Password Operations (stored in settings box, keyed by email)
  static Future<void> savePassword(String email, String password) async {
    await _settingsBox.put('pwd_$email', password);
  }

  static String? getPassword(String email) {
    return _settingsBox.get('pwd_$email') as String?;
  }
}
