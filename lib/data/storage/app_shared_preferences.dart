import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../../features/settings/domain/entites/app_settings_data_entity/app_setting_data_entity.dart';
import '../resources/app_enums.dart';

class AppSharedPreferences {
  static AppSharedPreferences get to => Get.find();

  ///Keys
  final _keySettings = AppStorageKeys.keySettings.name;

  void saveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    AppSettingDataEntity storageSettings = const AppSettingDataEntity().loadFromStorage;
    String jsonSettings = json.encode(storageSettings);
    sp.setString(_keySettings, jsonSettings);
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? dataSettings = sp.getString(_keySettings);
    AppSettingDataEntity settingsData = dataSettings == null
        ? const AppSettingDataEntity()
        : AppSettingDataEntity.fromJson(json.decode(dataSettings));
    settingsData.saveOnStorage;
  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
