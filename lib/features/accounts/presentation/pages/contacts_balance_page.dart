import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_account_balance_entity_list.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_account_records_entity_list.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../../app/components/general_widgets/app_popup_menu.dart';
import '../../../../app/components/general_widgets/app_popup_menu_item.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../data/resources/app_colors.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../domain/entities/account_balance_entity/account_balance_entity.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';
import '../manager/contacts_balance_controller.dart';

class ContactsBalancePage extends CoreView<ContactsBalanceController> {
  const ContactsBalancePage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(
      pageDetail: controller.pageDetail, barAction: _changeSortIcon());

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => LayoutBuilder(
      builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: Obx(() => DataTable(
              showBottomBorder: true,
              sortAscending: true,
              headingRowColor: MaterialStateProperty.all(
                  AppColors.appDefaultColor.withOpacity(0.2)),
              columns: _tableColumns(),
              rows: _tableRows()))));

  _tableRows() {
    List<AppAccountBalanceEntity> listBalances =
        controller.listBalances.balancesList;
    List<DataRow> rows = List<DataRow>.empty(growable: true);
    rows = List<DataRow>.generate(
        controller.listBalances.count,
        (index) => DataRow(
                onLongPress: () =>
                    controller.itemDetailsDialog(listBalances[index]),
                cells: [
                  DataCell(_createText(
                      listBalances[index].contact?.getContactFullName ?? '')),
                  DataCell(_createText(listBalances[index].balance.toCurrency)),
                  DataCell(_createText(listBalances[index].count.toString())),
                ]));
    rows.add(_total(listBalances));
    return rows;
  }

  _tableColumns() => List<DataColumn>.of([
        DataColumn(
            label:
                _createHeaderText(Texts.to.contactsBalanceTableHeaderContact)),
        DataColumn(
            label:
                _createHeaderText(Texts.to.contactsBalanceTableHeaderBalance)),
        DataColumn(
            label: _createHeaderText(Texts.to.contactsBalanceTableHeaderCount)),
      ]);

  _total(List<AppAccountBalanceEntity> balances) {
    AppAccountRecordEntitiesList records =
        AppAccountRecordEntitiesList().loadFromStorage;
    return DataRow(
        color: MaterialStateProperty.all(
            AppColors.appDefaultColorSecond.withOpacity(0.8)),
        cells: [
          DataCell(_createTotalText(balances.length.toString())),
          DataCell(
              _createTotalText(records.calculateSum(false).balance.toCurrency)),
          DataCell(_createTotalText(records.count.toString())),
        ]);
  }

  _createHeaderText(String text) =>
      Text(text, style: AppTextStyles.contactsBalanceHeader);

  _createTotalText(String text) => Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(text, style: AppTextStyles.contactsBalanceTotal));

  _createText(String text) =>
      Padding(padding: const EdgeInsets.only(left: 10), child: Text(text));

  _changeSortIcon() => AppPopupMenu(
          listItems: List<AppPopupMenuItem>.of([
        AppPopupMenuItem(
            text: 'sortByName',
            onTapFunction: () => controller.listBalances.sortByFirstName),
        AppPopupMenuItem(
            text: 'sortByBalance',
            onTapFunction: () => controller.listBalances.sortByBalance),
        AppPopupMenuItem(
            text: 'sortByRecordsCount',
            onTapFunction: () => controller.listBalances.sortByRecordsCount),
      ]));
}
