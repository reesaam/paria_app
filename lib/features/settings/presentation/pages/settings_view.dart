import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/elements/core_view.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/general_widgets/app_popup_menu.dart';
import '../../../../app/components/general_widgets/app_popup_menu_item.dart';
import '../../../../app/components/general_widgets/app_switch.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../widgets/settings_sections_widgets.dart';
import '../manager/settings_controller.dart';

class SettingsPage extends CoreView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar => AppAppBar(
      pageDetail: controller.pageDetail,
      barAction: _widgetAppbarThreeDotsButton());

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(
      selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget get body => Column(children: [
        _widgetGeneral(),
        _widgetUpdate(),
        _widgetBackup(),
        _widgetStorage(),
      ]);

  Widget _widgetAppbarThreeDotsButton() =>
      AppPopupMenu(listItems: _listAppbarThreeDotsButton, lightColor: false);

  List<AppPopupMenuItem> get _listAppbarThreeDotsButton => List.of([
        AppPopupMenuItem(
            text: AppTexts.settingAppbarMenuResetSettings, onTapFunction: () {})
      ]);

  Widget _widgetGeneral() {
    Widget widgetLanguages() => Obx(() =>
        Text(controller.selectedLanguage.value.name.capitalizeFirst ?? ''));
    
    ///TODO: Calendar Types Implementation
    Widget widgetCalendar() => Obx(() =>
        Text(controller.selectedCalendar.value.name.capitalizeFirst ?? ''));

    Widget widgetDarkMode() => Obx(() => AppSwitch(
        value: controller.darkMode.value,
        onChanged: (value) => controller.functionDarkModeOnChange(value),
        enabled: false));

    return SettingsSectionsWidgets().widgetSettingSection(
        SettingsSectionsWidgets()
            .widgetSectionTitle(AppTexts.settingSectionTitleGeneral),
        [
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionTitleGeneralLanguage,
              widgetLanguages(),
              controller.functionLanguageModal),
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionTitleGeneralCalendar,
              widgetCalendar(),
              null),
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionGeneralItemDarkMode,
              widgetDarkMode(),
              null),
        ]);
  }

  Widget _widgetUpdate() {
    return SettingsSectionsWidgets().widgetSettingSection(
        SettingsSectionsWidgets()
            .widgetSectionTitle(AppTexts.settingSectionTitleUpdate),
        [
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionTitleUpdateCurrentVersion,
              Text(AppInfo.appCurrentVersion),
              null),
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionTitleUpdateAvailableVersion,
              Text(controller.updateAvailableVersion.value ==
                      AppInfo.appCurrentVersion
                  ? AppTexts.generalNotAvailable
                  : controller.updateAvailableVersion.value),
              controller.functionGoToUpdatePage),
        ]);
  }

  Widget _widgetBackup() {
    return SettingsSectionsWidgets().widgetSettingSection(
        SettingsSectionsWidgets()
            .widgetSectionTitle(AppTexts.settingSectionTitleBackup),
        [
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionBackupBackup,
              null,
              controller.functionBackup),
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionBackupRestore,
              null,
              controller.functionRestore),
        ]);
  }

  Widget _widgetStorage() {
    return SettingsSectionsWidgets().widgetSettingSection(
        SettingsSectionsWidgets()
            .widgetSectionTitle(AppTexts.settingSectionTitleStorage),
        [
          SettingsSectionsWidgets().widgetSettingItem(
              AppTexts.settingSectionStorageItemEraseAllData,
              null,
              controller.functionClearAllData),
        ]);
  }
}
