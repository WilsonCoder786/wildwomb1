import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_four_diy/core/constants.dart';
import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:easy_four_diy/models/user_model.dart';
import 'package:flutter/material.dart';

class AppService extends ChangeNotifier {
  UserModel? _appUser;

  Locale _locale = const Locale('nl');
  bool _initialized = false;
  bool _showWelcome = false;
  bool _connected = false;
  StreamSubscription<List<ConnectivityResult>>? _connectionSubscription;

  Locale get locale => _locale;
  UserModel? get appUser => _appUser;

  bool get initialized => _initialized;
  bool get showWelcome => _showWelcome;
  bool get connected => _connected;

  AppService() {
    _init();
  }

  Future<void> _init() async {
    await HiveService.init();

    _showWelcome =
        HiveService.getSetting<bool>(Constants.SHOW_WELCOME) ?? false;

    String? langCode = HiveService.getSetting<String>(Constants.LANGUAGE_CODE);
    if (langCode != null) {
      _locale = Locale(langCode);
    } else {
      final deviceLanguageCode =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      _locale = switch (deviceLanguageCode) {
        'en' => const Locale('en'),
        _ => const Locale('nl'),
      };
    }

    _appUser = HiveService.getCurrentUser();

    // Initial connectivity check
    final result = await Connectivity().checkConnectivity();
    _updateStatus(result);
    _connectionSubscription = Connectivity().onConnectivityChanged.listen((
      result,
    ) {
      _updateStatus(result);
    });

    _initialized = true;

    notifyListeners();
  }

  void _updateStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      _connected = true;
      notifyListeners();
    } else {
      _connected = false;
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale value) async {
    _locale = value;
    await HiveService.saveSetting(Constants.LANGUAGE_CODE, value.languageCode);
    notifyListeners();
  }

  Future<void> setShowWelcome({required bool value}) async {
    _showWelcome = value;
    await HiveService.saveSetting(Constants.SHOW_WELCOME, value);
    notifyListeners();
  }

  Future<void> setProfile(UserModel user) async {
    _appUser = user;
    await HiveService.saveUser(user);
    notifyListeners();
  }

  Future<void> logout() async {
    _appUser = null;
    await HiveService.deleteUser();
    notifyListeners();
  }

  @override
  void dispose() {
    _connectionSubscription?.cancel();
    _connectionSubscription = null;
    super.dispose();
  }
}
