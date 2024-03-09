import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_account_records_model_list.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contacts_model_list.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_settings_model.dart';
import '../../../../data/info/app_info.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../app/functional_components/file_functions/file_functions.dart';
import '../../core/core_functions.dart';
import '../../features/accounts/data/models/account_record_model/account_record_model.dart';
import '../../features/app_data/data/models/app_data_model/app_data_model.dart';
import '../../features/contacts/data/models/contact_model/contact_model.dart';
import '../../features/settings/data/models/app_settings_data_model/app_setting_data_model.dart';
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
    loadAllData();
    appLogPrint('All App Data Cleared');
  }

  void clearSpecificKey(AppStorageKeys key) => _storage.remove(key.name);

  ///Core Functions
  Future<void> _saveFunction(data, String key) async => await _storage.write(key, data);

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
    AppDataModel appData = AppDataModel(
      version: AppDataVersions.values.last,
      appVersion: AppInfo.appCurrentVersion,
      settings: const AppSettingDataModel().loadFromStorage,
      contacts: AppContactModelsList().loadFromStorage,
      accounts: AppAccountRecordModelsList().loadFromStorage,
    );
    var appDataJson = json.encode(appData);
    Uint8List data = appDataJson.toString().toUInt8List;
    String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
    appLogPrint('File Path: $savedPath');
    appLogPrint('Backup File Exported');
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions.to.pickFile();
    AppDataModel appData = AppDataModel.fromJson(appDataFile);
    clearAppData();

    ///Filling Data Fields
    if (appData.version == AppDataVersions.values.last) {
      await saveSettings(settings: appData.settings ?? const AppSettingDataModel());
      await saveContacts(contacts: appData.contacts ?? AppContactModelsList());
      await saveAccountRecords(accountRecords: appData.accounts ?? AppAccountRecordModelsList());
      appLogPrint('Data Imported');
    } else {
      appLogPrint('Data Not Imported');
    }
  }

  void printData(AppDataModel data) {
    appLogPrint('Settings / Dark Mode: ${data.settings?.darkMode}');
    appLogPrint('Settings / Language: ${data.settings?.language.languageName}');
  }

  ///Settings
  Future<void> saveSettings({required AppSettingDataModel settings}) async => await _saveFunction(settings, _keySettings);

  AppSettingDataModel loadSettings() {
    var data = _loadFunction(_keySettings);
    return data == null ? const AppSettingDataModel() : AppSettingDataModel.fromJson(data);
  }

  ///Contacts
  Future<void> saveContacts({required AppContactModelsList contacts}) async => await _saveFunction(contacts, _keyContacts);

  AppContactModelsList loadContacts() {
    var data = _loadFunction(_keyContacts);
    return data == null ? AppContactModelsList() : AppContactModelsList.fromJson(data);
  }

  ///Settings
  Future<void> saveAccountRecords({required AppAccountRecordModelsList accountRecords}) async => await _saveFunction(accountRecords, _keyAccounts);

  AppAccountRecordModelsList loadAccountRecords() {
    var data = _loadFunction(_keyAccounts);
    return data == null ? AppAccountRecordModelsList() : AppAccountRecordModelsList.fromJson(data);
  }
}
