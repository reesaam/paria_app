import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contacts_list.dart';
import '../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../resources/app_enums.dart';

class AppSharedPreferences {
  static AppSharedPreferences get to => Get.find();

  ///Keys
  final _keyContacts = AppStorageKeys.keyContacts.name;
  final _keyAccounts = AppStorageKeys.keyAccounts.name;
  final _keySettings = AppStorageKeys.keySettings.name;

  _saveFunction(data, String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String jsonData = json.encode(data);
    sp.setString(key, jsonData);
  }

  _loadFunction(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? data = sp.getString(key);
    return data == null ? null : json.decode(data);
  }

  void saveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    AppContactEntitiesList storageContacts = AppContactEntitiesList().loadFromStorage;
    _saveFunction(storageContacts, _keyContacts);

    AppAccountRecordEntitiesList storageAccounts = AppAccountRecordEntitiesList().loadFromStorage;
    _saveFunction(storageAccounts, _keyAccounts);

    AppSettingDataEntity storageSettings = const AppSettingDataEntity().loadFromStorage;
    _saveFunction(storageSettings, _keySettings);
  }

  void loadData() async {
    var jsonDataSettings = _loadFunction(_keySettings);
    AppSettingDataEntity settingsData = jsonDataSettings == null
        ? const AppSettingDataEntity()
        : AppSettingDataEntity.fromJson(json.decode(jsonDataSettings));
    settingsData.saveOnStorage;

    var jsonDataContacts = _loadFunction(_keyContacts);
    AppContactEntitiesList contactsData = jsonDataContacts == null
        ? AppContactEntitiesList()
        : AppContactEntitiesList.fromJson(json.decode(jsonDataContacts));
    contactsData.saveOnStorage;

    var jsonDataAccounts = _loadFunction(_keyAccounts);
    AppAccountRecordEntitiesList accountsData = jsonDataAccounts == null
        ? AppAccountRecordEntitiesList()
        : AppAccountRecordEntitiesList.fromJson(json.decode(jsonDataAccounts));
    accountsData.saveOnStorage;
  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
