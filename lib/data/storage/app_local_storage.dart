import 'package:get/get.dart';
import 'package:paria_app/features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import 'package:paria_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';

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
  final _keyContacts = AppStorageKeys.keyContacts.name;
  final _keyAccountsRecords = AppStorageKeys.keyAccountRecords.name;
  final _keySettings = AppStorageKeys.keySettings.name;

  void clearStorage() {
    _storage.remove(_keyContacts);
    _storage.remove(_keyAccountsRecords);
    _storage.remove(_keySettings);
  }

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

  ///Contacts
  Future<void> saveContacts(AppContactEntitiesList contacts) async =>
      await _saveFunction(contacts, _keyContacts);

  AppContactEntitiesList loadContacts() {
    var data = _loadFunction(_keyContacts);
    return data == null
        ? AppContactEntitiesList()
        : AppContactEntitiesList.fromJson(data);
  }

  ///Accounts
  Future<void> saveAccountRecords(
          AppAccountRecordEntitiesList accountRecords) async =>
      await _saveFunction(accountRecords, _keyAccountsRecords);

  AppAccountRecordEntitiesList loadAccountRecords() {
    var data = _loadFunction(_keyAccountsRecords);
    return data == null
        ? AppAccountRecordEntitiesList()
        : AppAccountRecordEntitiesList.fromJson(data);
  }

  ///Settings
  Future<void> saveSettings(AppSettingData settings) async =>
      await _saveFunction(settings, _keySettings);

  AppSettingData loadSettings() {
    var data = _loadFunction(_keySettings);
    return data == null
        ? const AppSettingData(darkMode: false, language: AppLanguages.english)
        : AppSettingData.fromJson(data);
  }
}
