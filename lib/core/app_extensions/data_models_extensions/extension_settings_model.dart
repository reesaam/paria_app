import 'package:get/get.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/data/models/app_settings_data_model/app_setting_data_model.dart';

extension RxStorage on Rx<AppSettingDataModel> {
  saveOnStorage() => value.saveOnStorage;
  Rx<AppSettingDataModel> get loadFromStorage => value.loadFromStorage.obs;
}

extension Storage on AppSettingDataModel {
  Future<void> saveOnStorage() async =>
      await AppLocalStorage.to.saveSettings(settings: this);
  AppSettingDataModel get loadFromStorage => AppLocalStorage.to.loadSettings();
}

extension RxClear on Rx<AppSettingDataModel> {
  Rx<AppSettingDataModel> get clearData => value.clearData.obs;
}

extension Clear on AppSettingDataModel {
  AppSettingDataModel get clearData {
    var defaultData = const AppSettingDataModel();
    saveOnStorage;
    return defaultData;
  }
}
