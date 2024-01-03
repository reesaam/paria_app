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
import '../widgets/settings_sections_items_widgets.dart';
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
    Widget leadingGeneral() => Obx(() =>
        Text(controller.selectedLanguage.value.name.capitalizeFirst ?? ''));

    ///TODO: Calendar Types Implementation
    Widget leadingCalendar() => Obx(() =>
        Text(controller.selectedCalendar.value.name.capitalizeFirst ?? ''));

    Widget leadingDarkMode() => Obx(() => AppSwitch(
        value: controller.darkMode.value,
        onChanged: (value) => controller.functionDarkModeOnChange(value),
        enabled: false));

    return SettingsSectionsWidgets(
        title: AppTexts.settingSectionTitleGeneral,
        widgets: [
          SettingsSectionItemsWidget(
              text: AppTexts.settingSectionTitleGeneralLanguage,
              leading: leadingGeneral(),
              wholeItemFunction: controller.functionLanguageModal),
          SettingsSectionItemsWidget(
              text: AppTexts.settingSectionTitleGeneralCalendar,
              leading: leadingCalendar()),
          SettingsSectionItemsWidget(
              text: AppTexts.settingSectionGeneralItemDarkMode,
              leading: leadingDarkMode()),
        ]);
  }

  Widget _widgetUpdate() => SettingsSectionsWidgets(
          title: AppTexts.settingSectionTitleUpdate,
          widgets: [
            SettingsSectionItemsWidget(
                text: AppTexts.settingSectionTitleUpdateCurrentVersion,
                leading: Text(AppInfo.appCurrentVersion)),
            SettingsSectionItemsWidget(
                text: AppTexts.settingSectionTitleUpdateAvailableVersion,
                leading: Text(controller.updateAvailableVersion.value ==
                        AppInfo.appCurrentVersion
                    ? AppTexts.generalNotAvailable
                    : controller.updateAvailableVersion.value),
                wholeItemFunction: controller.functionGoToUpdatePage),
          ]);

  Widget _widgetBackup() => SettingsSectionsWidgets(
          title: AppTexts.settingSectionTitleBackup,
          widgets: [
            SettingsSectionItemsWidget(
                text: AppTexts.settingSectionBackupBackup,
                wholeItemFunction: controller.functionBackup),
            SettingsSectionItemsWidget(
                text: AppTexts.settingSectionBackupRestore,
                wholeItemFunction: controller.functionRestore),
          ]);

  Widget _widgetStorage() => SettingsSectionsWidgets(
          title: AppTexts.settingSectionTitleStorage,
          widgets: [
            SettingsSectionItemsWidget(
                text: AppTexts.settingSectionStorageItemEraseAllData,
                wholeItemFunction: controller.functionClearAllData)
          ]);
}
