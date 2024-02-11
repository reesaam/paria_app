import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_settings.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_app_languages.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../data/data_entities/core_data_entities/app_data_entity/app_data_entity.dart';
import '../../../../data/info/app_info.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/storage/app_local_storage.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_enums.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/main_components/app_dialogs.dart';
import '../../domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../widgets/settings_languages_widgets.dart';

class SettingsController extends CoreController {
  Rx<AppSettingDataEntity> appSettings = const AppSettingDataEntity().obs;

  Rx<bool> darkMode = false.obs;
  Rx<AppLanguages> selectedLanguage = AppLanguages.english.obs;
  Rx<AppCalendarTypes> selectedCalendar = AppCalendarTypes.christian.obs;

  Rx<String> updateAvailableVersion = Texts.to.notAvailable.obs;

  //Listeners
  late StreamSubscription<AppSettingDataEntity> appSettingDataListener;

  @override
  void dataInit() {
    appSettings = const AppSettingDataEntity().loadFromStorage.obs;
    AppInfo.checkUpdate ? functionCheckUpdateAvailableVersion() : null;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.settings;
  }

  @override
  void onInitFunction() {
    _fillData();
  }

  @override
  void onCloseFunction() {
    saveSettings();
    appSettingDataListener.cancel();
  }

  _fillData() {
    darkMode.value = appSettings.value.darkMode ?? false;
    appDebugPrint('Fill Setting Data Function Applied Data');
    appSettingDataListener = appSettings.listen((data) => _fillData());
  }

  functionLanguageModal() => AppDialogs().appBottomDialogWithCancel(
      Texts.to.settingsLanguageModalSelectLanguage,
      SettingsLanguageWidget(function: functionLanguageSelectionOnTap),
      true);

  functionLanguageSelectionOnTap(int index) {
    selectedLanguage.value = AppLocalization.languages[index].getLanguage;
    saveSettings();
    popPage();
    Get.updateLocale(selectedLanguage.value.getLocale);
    update();
    refresh();
  }

  functionDarkModeOnChange(bool value) {
    darkMode.value = value;
    saveSettings();
    appLogPrint('DarkMode Changed to ${darkMode.value}');
    refresh();
  }

  functionCheckUpdateAvailableVersion() async {
    updateAvailableVersion.value = await checkAvailableVersion();
    appLogPrint('Checked Update Version: ${updateAvailableVersion.value}');
  }

  functionGoToUpdatePage() => goToPage(AppPageDetails.update);

  functionBackup() {
    function() async {
      popPage();
      AppDataEntity appdata = AppLocalStorage.to.exportData();
      var jsonData = jsonEncode(appdata);
      Uint8List data = jsonData.toString().toUInt8List;
      SaveFileDialogParams saveParams = SaveFileDialogParams(
          data: data, fileName: AppTexts.settingBackupFilename);
      String? filePath = await FlutterFileDialog.saveFile(params: saveParams);
      appLogPrint('Backup File Saved');
      appDebugPrint('Filename: ${saveParams.fileName}');
      appDebugPrint('Path: ${saveParams.sourceFilePath}');
      appLogPrint('File Path: $filePath');
    }

    AppDialogs().appAlertDialogWithOkCancel(
        Texts.to.warning, Texts.to.areYouSureDataExport, function, true);
  }

  functionRestore() {
    function() async {
      popPage();
      OpenFileDialogParams openFileParams =
          const OpenFileDialogParams(dialogType: OpenFileDialogType.document);
      String? importFilePath =
          await FlutterFileDialog.pickFile(params: openFileParams);
      appLogPrint('Backup File Selected');
      appLogPrint('File Path: $importFilePath');

      File importFile = File(importFilePath!);
      String stringData = String.fromCharCodes(importFile.readAsBytesSync());
      var jsonData = jsonDecode(stringData) as Map<String, dynamic>;
      AppDataEntity appData = AppDataEntity.fromJson(jsonData);
      clearAppData();
      AppLocalStorage.to.importData(appData);
      appLogPrint('Data Imported');
    }

    AppDialogs().appAlertDialogWithOkCancel(
        Texts.to.warning, Texts.to.areYouSureDataMayLost, function, true);
  }

  functionClearAllData() {
    function() {
      clearAppData();
      popPage();
      appLogPrint('Clear All Data Modal Closed');
    }

    AppDialogs().appAlertDialogWithOkCancel(
        Texts.to.warning, Texts.to.areYouSureDataWillLost, function, true);
  }

  saveSettings() {
    appSettings.value = appSettings.value
        .copyWith(darkMode: darkMode.value, language: selectedLanguage.value);
    appSettings.saveOnStorage;
    appLogPrint('Settings Saved');
  }

  resetAllSettings() {
    appSettings.value = const AppSettingDataEntity().clearData;
    saveSettings();
    appLogPrint('Reset Settings Data performed');
  }
}
