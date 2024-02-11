import 'package:get/get.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';

extension RxStorage on Rx<AppSettingDataEntity> {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(value);
  Rx<AppSettingDataEntity> get loadFromStorage => AppLocalStorage.to.loadSettings().obs;
}

extension Storage on AppSettingDataEntity {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(this);
  AppSettingDataEntity get loadFromStorage => AppLocalStorage.to.loadSettings();
}

extension RxClear on Rx<AppSettingDataEntity> {
  Rx<AppSettingDataEntity> get clearData => const AppSettingDataEntity(darkMode: false).obs;
}

extension Clear on AppSettingDataEntity {
  AppSettingDataEntity get clearData => const AppSettingDataEntity(darkMode: false);
}