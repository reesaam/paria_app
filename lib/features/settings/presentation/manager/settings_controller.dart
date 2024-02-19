import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_base_clean_getx_app/app/functional_components/file_functions/file_functions.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_app_languages.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../core/app_routing/routing.dart';
import '../../../../data/info/app_info.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/storage/app_local_storage.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/data_models/core_data_models/app_data/app_data.dart';
import '../../../../data/data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_enums.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/main_components/app_dialogs.dart';
import '../widgets/settings_languages_widgets.dart';

class SettingsController extends CoreController {
  Rx<AppSettingData> appSettings = const AppSettingData().obs;

  Rx<bool> darkMode = false.obs;
  Rx<AppLanguages> selectedLanguage = AppLanguages.english.obs;
  Rx<AppCalendarTypes> selectedCalendar = AppCalendarTypes.christian.obs;

  Rx<String> updateAvailableVersion = Texts.to.notAvailable.obs;

  //Listeners
  late StreamSubscription<AppSettingData> appSettingDataListener;

  @override
  void dataInit() {
    appSettings = const AppSettingData().loadFromStorage.obs;
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

  functionGoToUpdatePage() => goToUpdatePage();

  functionBackup() {
    function() async {
      popPage();
      await AppLocalStorage().exportData();
    }

    AppDialogs().appAlertDialogWithOkCancel(
        Texts.to.warning, Texts.to.areYouSureDataExport, function, true);
  }

  functionRestore() {
    function() async {
      popPage();
      await AppLocalStorage.to.importData();
    }

    AppDialogs().appAlertDialogWithOkCancel(
        Texts.to.warning, Texts.to.areYouSureDataMayLost, function, true);
  }

  functionClearAllData() {
    function() {
      popPage();
      clearAppData();
    }

    AppDialogs().appAlertDialogWithOkCancel(
        Texts.to.warning, Texts.to.areYouSureDataWillLost, function, true);
  }

  saveSettings() => saveAppData();

  resetAllSettings() => clearAppData();
}
