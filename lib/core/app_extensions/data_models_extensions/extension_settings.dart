import 'package:get/get.dart';

import '../../../data/data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../../../data/storage/app_local_storage.dart';

extension RxStorage on Rx<AppSettingData> {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(value);
  Rx<AppSettingData> get loadFromStorage => AppLocalStorage.to.loadSettings().obs;
}

extension Storage on AppSettingData {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(this);
  AppSettingData get loadFromStorage => AppLocalStorage.to.loadSettings();
}

extension RxClear on Rx<AppSettingData> {
  Rx<AppSettingData> get clearData => const AppSettingData(darkMode: false).obs;
}

extension Clear on AppSettingData {
  AppSettingData get clearData => const AppSettingData(darkMode: false);
}