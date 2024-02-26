import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';
import 'package:paria_app/data/resources/app_paddings.dart';
import 'package:paria_app/features/accounts/presentation/widgets/accounts_records_table.dart';
import 'package:paria_app/features/accounts/presentation/widgets/accounts_summary.dart';

import '../../../../app/components/main_components/app_floating_buttons.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../../../../data/resources/app_icons.dart';
import '../manager/accounts_controller.dart';
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
  Widget get body => Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AccountsSummary(
                itemsBalance: controller.itemsBalance.value,
                itemsCount: controller.itemsCount.value,
                itemsCountContacts: controller.itemsCountContacts.value),
            AccountsRecordsTable(
              listRecords: controller.listRecords.value,
              showCleared: controller.showCleared.value,
            )
          ]));
}
