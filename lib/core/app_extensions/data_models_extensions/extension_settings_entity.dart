import 'package:get/get.dart';
import 'package:paria_app/features/settings/domain/entities/app_settings_data_entity/app_setting_data_mapper.dart';

import '../../../data/resources/app_enums.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';

extension RxStorage on Rx<AppSettingDataEntity> {
  void get saveOnStorage async =>
      await AppLocalStorage.to.saveSettings(settings: value.mapper);
  Rx<AppSettingDataEntity> get loadFromStorage =>
      AppLocalStorage.to.loadSettings().mapper.obs;
}

extension Storage on AppSettingDataEntity {
  void get saveOnStorage async =>
      await AppLocalStorage.to.saveSettings(settings: mapper);
  AppSettingDataEntity get loadFromStorage =>
      AppLocalStorage.to.loadSettings().mapper;
}

extension RxClear on Rx<AppSettingDataEntity> {
  Rx<AppSettingDataEntity> get clearData => value.clearData.obs;
}

extension Clear on AppSettingDataEntity {
  AppSettingDataEntity get clearData =>
      const AppSettingDataEntity();
}

extension RxLanguages on Rx<AppSettingDataEntity> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension Languages on AppSettingDataEntity {
  changeLanguage(AppLanguages lang) => copyWith(language: lang).saveOnStorage;
}
