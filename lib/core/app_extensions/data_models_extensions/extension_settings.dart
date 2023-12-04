import 'package:base_flutter_clean_getx_app/core/dependency_injection/di.dart';
import 'package:get/get.dart';

import '../../../data/data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../../../data/storage/app_local_storage.dart';

var _storage = diCore<AppLocalStorage>();

extension RxStorage on Rx<AppSettingData> {
  void get saveOnStorage async => await _storage.saveSettings(value);
  Rx<AppSettingData> get loadFromStorage => _storage.loadSettings().obs;
}

extension Storage on AppSettingData {
  void get saveOnStorage async => await _storage.saveSettings(this);
  AppSettingData get loadFromStorage => _storage.loadSettings();
}

extension RxClear on Rx<AppSettingData> {
  Rx<AppSettingData> get clearData => const AppSettingData(darkMode: false).obs;
}

extension Clear on AppSettingData {
  AppSettingData get clearData => const AppSettingData(darkMode: false);
}