import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/app/components/buttons/app_icon_button.dart';
import 'package:paria_app/app/components/main_components/app_dialogs.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_list.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/core_functions.dart';
import 'package:paria_app/data/resources/app_colors.dart';
import 'package:paria_app/data/resources/app_elements.dart';
import 'package:paria_app/data/resources/app_icons.dart';
import 'package:paria_app/data/resources/app_paddings.dart';
import 'package:paria_app/features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import 'package:paria_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';

import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../manager/contacts_balance_controller.dart';

class ContactsBalancePage extends CoreView<ContactsBalanceController> {
  ContactsBalancePage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

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

  _tableRows() => List<DataRow>.generate(
      controller.listContacts.count,
      (index) => DataRow(
              onLongPress: () => controller.itemDetailsDialog(
                  controller.listContacts.contactsList[index]),
              cells: [
                DataCell(_createText(controller
                    .listContacts.contactsList[index].getContactFullName)),
                DataCell(_createText(controller.listContacts.contactsList[index]
                    .calculateBalance(false)
                    .balance
                    .toCurrency)),
                DataCell(_createText(controller.listRecords
                    .getContactRecords(
                        controller.listContacts.contactsList[index], false)
                    .length
                    .toString())),
              ]));

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

  _createHeaderText(String text) => Text(text);

  _createText(String text) => Text(text);
}
