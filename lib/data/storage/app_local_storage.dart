import 'package:get/get.dart';

import '../../core/core_functions.dart';
import '../data_models/core_data_models/app_data/app_data.dart';
import '../data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../resources/app_enums.dart';
import 'local_storage_service.dart';

class AppLocalStorage {

  final String _keyLocalStorage = 'Local Storage';
  final _storage = LocalStorageService();

  static AppLocalStorage get to => Get.find();

  ///Keys
  final _keySettings = AppStorageKeys.keySettings.name;

  void clearStorage() => _storage.remove(_keySettings);

  void clearSpecificKey(AppStorageKeys key) => _storage.remove(key.name);

  ///Core Functions
  Future<void> _saveFunction(data, String key) async =>
      await _storage.write(key, data);

  _loadFunction(String key) {
    var data = _storage.read(key);
    return data;
  }

  ///Manage Data
  AppData exportData() {
    AppSettingData setting = loadSettings();
    return AppData(
      setting: setting,
    );
  }

  void importData(AppData appData) async {
    appData.setting == null ? null : await saveSettings(appData.setting!);
  }

  void printData() {
    appLogPrint('Settings / Dark Mode: ${loadSettings().darkMode}');
  }

  ///Settings
  Future<void> saveSettings(AppSettingData settings) async =>
      await _saveFunction(settings, _keySettings);

  AppSettingData loadSettings() {
    var data = _loadFunction(_keySettings);
    return data == null
        ? const AppSettingData()
        : AppSettingData.fromJson(data);
  }
}
