import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/components/main_components/app_floating_buttons.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../../../../data/resources/app_icons.dart';
import '../manager/contacts_controller.dart';
import '../widgets/contacts_table_widget.dart';

class ContactsPage extends CoreView<ContactsController> {
  const ContactsPage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(
      selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget? get floatingActionButton => AppFloatingActionButtons(
      icon: AppIcons.add, onPressed: controller.addContact);

  @override
  Widget get body => Obx(() => Column(children: [
        ContactsTable(listContacts: controller.listContacts.value),
      ]));
}
