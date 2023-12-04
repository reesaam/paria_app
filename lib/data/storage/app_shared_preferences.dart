import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dependency_injection/di.dart';
import '../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../resources/app_enums.dart';

abstract class AppSharedPreferences {
  void saveData();
  void loadData();
  void clearData();
}

@Injectable(as: AppSharedPreferences)
class AppSharedPreferencesImpl implements AppSharedPreferences {
  // static AppSharedPreferences get to => Get.find();

  @singleton
  get prefs => diCore<AppSharedPreferences>();

  ///Keys
  final _keySettings = AppStorageKeys.keySettings.name;

  @override
  void saveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    AppSettingData storageSettings = const AppSettingData().loadFromStorage;
    String jsonSettings = json.encode(storageSettings);
    sp.setString(_keySettings, jsonSettings);
  }

  @override
  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? dataSettings = sp.getString(_keySettings);
    AppSettingData settingsData = dataSettings == null
        ? const AppSettingData()
        : AppSettingData.fromJson(json.decode(dataSettings));
    settingsData.saveOnStorage;
  }

  @override
  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
