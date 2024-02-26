import 'package:get/get.dart';
import 'package:paria_app/data/resources/app_enums.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';

extension RxStorage on Rx<AppSettingDataEntity> {
  void get saveOnStorage async =>
      await AppLocalStorage.to.saveSettings(settings: value);
  Rx<AppSettingDataEntity> get loadFromStorage =>
      AppLocalStorage.to.loadSettings().obs;
}

extension Storage on AppSettingDataEntity {
  void get saveOnStorage async =>
      await AppLocalStorage.to.saveSettings(settings: this);
  AppSettingDataEntity get loadFromStorage => AppLocalStorage.to.loadSettings();
}

extension RxClear on Rx<AppSettingDataEntity> {
  Rx<AppSettingDataEntity> get clearData =>
      const AppSettingDataEntity(darkMode: false).obs;
}

extension Clear on AppSettingDataEntity {
  AppSettingDataEntity get clearData =>
      const AppSettingDataEntity(darkMode: false);
}

extension RxLanguages on Rx<AppSettingDataEntity> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension Languages on AppSettingDataEntity {
  changeLanguage(AppLanguages lang) => copyWith(language: lang).saveOnStorage;
}
