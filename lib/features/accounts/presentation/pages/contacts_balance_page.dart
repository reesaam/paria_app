import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_list.dart';
import 'package:paria_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';

import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../manager/contacts_balance_controller.dart';

class ContactsBalancePage extends CoreView<ContactsBalanceController> {
  const ContactsBalancePage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body => _table();

  _table() => Table(
        children: _rows(),
      );

  _rows() => List<TableRow>.generate(controller.listContacts.count,
      (index) => _row(controller.listContacts.value.membersList[index]));

  _row(AppContactEntity contact) => TableRow();
}
