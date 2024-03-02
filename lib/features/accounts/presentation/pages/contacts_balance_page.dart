import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/data/resources/app_elements.dart';
import 'package:paria_app/data/resources/app_paddings.dart';
import 'package:paria_app/data/resources/app_text_styles.dart';

import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../data/resources/app_colors.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../manager/contacts_balance_controller.dart';

class ContactsBalancePage extends CoreView<ContactsBalanceController> {
  const ContactsBalancePage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => LayoutBuilder(
      builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: DataTable(
              showBottomBorder: true,
              sortAscending: true,
              headingRowColor: MaterialStateProperty.all(
                  AppColors.appDefaultColor.withOpacity(0.2)),
              columns: _tableColumns(),
              rows: _tableRows())));

  _tableRows() {
    List<AppContactEntity> contacts = controller.listContacts.contactsList;
    List<DataRow> rows = List<DataRow>.empty(growable: true);
    rows = List<DataRow>.generate(
        controller.listContacts.count,
        (index) => DataRow(
                onLongPress: () =>
                    controller.itemDetailsDialog(contacts[index]),
                cells: [
                  DataCell(_createText(contacts[index].getContactFullName)),
                  DataCell(_createText(contacts[index]
                      .calculateBalance(false)
                      .balance
                      .toCurrency)),
                  DataCell(_createText(controller.listRecords
                      .getContactRecords(contacts[index], false)
                      .length
                      .toString())),
                ]));
    rows.add(_total(contacts));
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

  _total(List<AppContactEntity> contacts) => DataRow(
          color: MaterialStateProperty.all(
              AppColors.appDefaultColorSecond.withOpacity(0.8)),
          cells: [
            DataCell(_createTotalText(contacts.length.toString())),
            DataCell(_createTotalText(
                controller.listRecords.calculateSum(false).balance.toCurrency)),
            DataCell(_createTotalText(controller.listRecords.count.toString())),
          ]);

  _createHeaderText(String text) =>
      Text(text, style: AppTextStyles.contactsBalanceHeader);

  _createTotalText(String text) => Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(text, style: AppTextStyles.contactsBalanceTotal));

  _createText(String text) =>
      Padding(padding: const EdgeInsets.only(left: 10), child: Text(text));
}
