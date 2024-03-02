import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_accounts_filter_entity.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_bool.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';

import '../../../../app/components/buttons/app_icon_button.dart';
import '../../../../app/components/general_widgets/app_dividers.dart';
import '../../../../app/components/general_widgets/app_popup_menu.dart';
import '../../../../app/components/general_widgets/app_popup_menu_item.dart';
import '../../../../app/components/main_components/app_floating_buttons.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_widgets.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_spaces.dart';
import '../manager/accounts_controller.dart';
import '../widgets/accounts_records_table.dart';
import '../widgets/appbar_action_widget.dart';

class AccountsPage extends CoreView<AccountsController> {
  const AccountsPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(
      pageDetail: controller.pageDetail,
      barAction: const AccountsAppBarActionWidget());

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(
      selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget? get floatingActionButton => AppFloatingActionButtons(
      icon: AppIcons.add, onPressed: controller.addRecord);

  @override
  Widget get body => Obx(() => controller.listRecords.isEmpty
      ? _noRecords()
      : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              _summary(),
              _tableHeader(),
              AccountsRecordsTable(
                  listRecords: controller.listRecords.value,
                  filter: controller.filter.value,
                  onTap: (record) => controller.showRecord(record),
                  onLongPress: (record) => controller.itemOnLongPress(record)),
            ]));

  _summary() => Card(
      child: Padding(
          padding: AppPaddings.accountsTopBar,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Texts.to.accountsSummaryBalance.withDoubleDots),
              Text(Texts.to.accountsSummaryItemCount.withDoubleDots),
              Text(Texts.to.accountsSummaryContactsCount.withDoubleDots),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(controller.itemsBalance.value.toCurrency),
              Text(controller.itemsCount.value.toString()),
              Text(controller.itemsCountContacts.value.toString()),
            ]),
          ])));

  _tableHeader() => Padding(
      padding: AppPaddings.accountsTable,
      child: Column(children: [
        AppSpaces.h20,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(Texts.to.accountsTableTitle),
          Row(children: [
            controller.hasFilter.value
                ? AppIconButton(
                    icon: AppIcons.removeFilter.icon!,
                    onPressed: () => controller.filter.clear)
                : shrinkSizedBox,
            AppIconButton(
                icon: controller.hasFilter.value == true
                    ? AppIcons.filter.icon!
                    : AppIcons.noFilter.icon!,
                onPressed: () => controller.hasFilter.invert),
            _tableHeaderThreeDotsButton(),
          ]),
        ]),
        AppDividers.generalDividerWithAppDefaultColor,
      ]));

  _tableHeaderThreeDotsButton() {
    List<AppPopupMenuItem> listItems =
        List<AppPopupMenuItem>.empty(growable: true);
    listItems.add(AppPopupMenuItem(
        text: controller.filter.value.cleared == true
            ? Texts.to.accountsTableTitleMenuHideCleared
            : Texts.to.accountsTableTitleMenuShowCleared,
        onTapFunction: () => controller.changeShowCleared()));
    if (controller.filter.value.positives == true ||
        controller.filter.value.negatives == true) {
      listItems.add(AppPopupMenuItem(
          text: Texts.to.accountsTableTitleMenuShowAll,
          onTapFunction: () => controller.showAllRecords()));
    } else {
      listItems.add(AppPopupMenuItem(
          text: Texts.to.accountsTableTitleMenuShowPositives,
          onTapFunction: () => controller.showPositive()));
      listItems.add(AppPopupMenuItem(
          text: Texts.to.accountsTableTitleMenuShowNegatives,
          onTapFunction: () => controller.showNegative()));
    }
    return AppPopupMenu(listItems: listItems);
  }

  Widget _noRecords() => Container(
      width: Get.width,
      alignment: Alignment.center,
      padding: AppPaddings.accountsNoRecordText,
      child: Text(Texts.to.accountsNoRecord));
}
