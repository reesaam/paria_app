import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:paria_app/features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import 'package:paria_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:paria_app/features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../app/functional_components/file_functions/file_functions.dart';
import '../../core/core_functions.dart';
import '../data_models/core_data_models/app_data/app_data.dart';
import '../resources/app_enums.dart';
import '../resources/app_texts.dart';
import 'app_shared_preferences.dart';
import 'local_storage_service.dart';

class AppLocalStorage {
  final String _keyLocalStorage = 'Local Storage';
  final _storage = LocalStorageService();

  static AppLocalStorage get to => Get.find();

  ///Keys
  final _keySettings = AppStorageKeys.keySettings.name;
  final _keyContacts = AppStorageKeys.keyContacts.name;
  final _keyAccounts = AppStorageKeys.keyAccounts.name;

  void clearStorage() {
    for (var key in AppStorageKeys.values) {
      _storage.remove(key.name);
    }
    AppSharedPreferences.to.clearData();
    appLogPrint('All App Data Cleared');
  }

  void clearSpecificKey(AppStorageKeys key) => _storage.remove(key.name);

  ///Core Functions
  Future<void> _saveFunction(data, String key) async =>
      await _storage.write(key, data);

  dynamic _loadFunction(String key) {
    var data = _storage.read(key);
    return data;
  }

  Future<void> saveAllData() async {
    AppSharedPreferences.to.saveData();
    appLogPrint('AppData Saved Successfully');
  }

  void loadAllData() {
    AppSharedPreferences.to.loadData();
    appLogPrint('AppData Loaded Successfully');
  }

  ///Manage Data
  Future<void> exportData() async {
    var settings = const AppSettingDataEntity().loadFromStorage;
    AppData appData = AppData(
      setting: settings,
    );
    var jsonData = json.encode(appData);
    Uint8List data = jsonData.toString().toUInt8List;
    String? savedPath = await AppFileFunctions()
        .saveFile(fileName: AppTexts.settingBackupFilename, data: data);
    appLogPrint('File Path: $savedPath');
    appLogPrint('Backup File Exported');
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions().pickFile();
    AppData appData = AppData.fromJson(appDataFile);
    clearAppData();
    await saveSettings(settings: appData.setting ?? const AppSettingDataEntity());
    appLogPrint('Data Imported');
  }

  void printData(AppData data) {
    appLogPrint('Settings / Dark Mode: ${data.setting?.darkMode}');
    appLogPrint('Settings / Language: ${data.setting?.language?.languageName}');
  }

  ///Settings
  Future<void> saveSettings({required AppSettingDataEntity settings}) async =>
      await _saveFunction(settings, _keySettings);

  AppSettingDataEntity loadSettings() {
    var data = _loadFunction(_keySettings);
    return data == null
        ? const AppSettingDataEntity()
        : AppSettingDataEntity.fromJson(data);
  }

  ///Contacts
  Future<void> saveContacts({required AppContactEntitiesList contacts}) async =>
      await _saveFunction(contacts, _keyContacts);

  AppContactEntitiesList loadContacts() {
    var data = _loadFunction(_keyContacts);
    return data == null
        ? AppContactEntitiesList()
        : AppContactEntitiesList.fromJson(data);
  }

  ///Settings
  Future<void> saveAccountRecords(
          {required AppAccountRecordEntitiesList accountRecords}) async =>
      await _saveFunction(accountRecords, _keyAccounts);

  AppAccountRecordEntitiesList loadAccountRecords() {
    var data = _loadFunction(_keyAccounts);
    return data == null
        ? AppAccountRecordEntitiesList()
        : AppAccountRecordEntitiesList.fromJson(data);
  }
}
