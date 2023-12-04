import 'package:injectable/injectable.dart';

import '../../core/dependency_injection/di.dart';
import '../../core/core_functions.dart';
import '../data_models/core_data_models/app_data/app_data.dart';
import '../data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../resources/app_enums.dart';
import 'local_storage_service.dart';

abstract class AppLocalStorage {
  void clearStorage();
  void clearSpecificKey(AppStorageKeys key);
  Future<void> saveSettings(AppSettingData settings);
  ///Manage Data
  AppData exportData();
  void importData(AppData appData);
  void printData();
  ///Data Functions
  AppSettingData loadSettings();
}

@Injectable(as: AppLocalStorage)
class AppLocalStorageImpl implements AppLocalStorage {

  final String _keyLocalStorage = 'Local Storage';

  @singleton
  get storage => diCore<LocalStorageService>();

  // static AppLocalStorage get to => Get.find();

  ///Keys
  final _keySettings = AppStorageKeys.keySettings.name;

  @override
  void clearStorage() => storage.remove(_keySettings);

  @override
  void clearSpecificKey(AppStorageKeys key) => storage.remove(key.name);

  ///Core Functions
  Future<void> _saveFunction(data, String key) async =>
      await storage.write(key, data);

  _loadFunction(String key) {
    var data = storage.read(key);
    return data;
  }

  ///Manage Data
  @override
  AppData exportData() {
    AppSettingData setting = loadSettings();
    return AppData(
      setting: setting,
    );
  }

  @override
  void importData(AppData appData) async {
    appData.setting == null
        ? null
        : await saveSettings(appData.setting!);
  }

  @override
  void printData() {
    appDebugPrint('Settings / Dark Mode: ${loadSettings().darkMode}');
  }

  ///Settings
  @override
  Future<void> saveSettings(AppSettingData settings) async =>
      await _saveFunction(settings, _keySettings);

  @override
  AppSettingData loadSettings() {
    var data = _loadFunction(_keySettings);
    return data == null
        ? const AppSettingData()
        : AppSettingData.fromJson(data);
  }
}
