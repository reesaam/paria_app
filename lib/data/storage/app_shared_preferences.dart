import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_settings_entity.dart';
import '../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../resources/app_enums.dart';

class AppSharedPreferences {
  static AppSharedPreferences get to => Get.find();

  ///Keys
  final _keySettings = AppStorageKeys.keySettings.name;

  _saveFunction(data, String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String jsonData = json.encode(data);
    sp.setString(key, jsonData);
  }

  _loadFunction(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? data = sp.getString(key);
    return data == null ? null : json.decode(data);
  }

  void saveData() async {
    AppSettingDataEntity storageSettings = const AppSettingDataEntity().loadFromStorage;
    _saveFunction(storageSettings, _keySettings);
  }

  void loadData() async {
    var jsonDataSettings = await _loadFunction(_keySettings);
    AppSettingDataEntity settingsData = jsonDataSettings == null ? const AppSettingDataEntity() : AppSettingDataEntity.fromJson(json.decode(jsonDataSettings));
    settingsData.saveOnStorage;
  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
