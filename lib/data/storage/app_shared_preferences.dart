import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void saveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    AppContactEntitiesList storageContacts =
        AppContactEntitiesList().loadFromStorage;
    String jsonContacts = json.encode(storageContacts);
    sp.setString(_keyContacts, jsonContacts);

    AppAccountRecordEntitiesList storageAccounts =
        AppAccountRecordEntitiesList().loadFromStorage;
    String jsonAccounts = json.encode(storageAccounts);
    sp.setString(_keyAccounts, jsonAccounts);

    AppSettingDataEntity storageSettings =
        const AppSettingDataEntity().loadFromStorage;
    String jsonSettings = json.encode(storageSettings);
    sp.setString(_keySettings, jsonSettings);
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? dataSettings = sp.getString(_keySettings);
    AppSettingDataEntity settingsData = dataSettings == null
        ? const AppSettingDataEntity()
        : AppSettingDataEntity.fromJson(json.decode(dataSettings));
    settingsData.saveOnStorage;

    String? dataContacts = sp.getString(_keyContacts);
    AppContactEntitiesList contactsData = dataContacts == null
        ? AppContactEntitiesList()
        : AppContactEntitiesList.fromJson(json.decode(dataContacts));
    contactsData.saveOnStorage;

    String? dataAccounts = sp.getString(_keyAccounts);
    AppAccountRecordEntitiesList accountsData = dataAccounts == null
        ? AppAccountRecordEntitiesList()
        : AppAccountRecordEntitiesList.fromJson(json.decode(dataAccounts));
    accountsData.saveOnStorage;
  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
