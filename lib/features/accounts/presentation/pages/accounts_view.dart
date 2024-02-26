import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';
import 'package:paria_app/data/resources/app_paddings.dart';

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
            _topBarSummary(),
          ]));

  Widget _topBarSummary() => Card(
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
              Text(controller.itemsCountContacts.toString()),
            ]),
          ])));
}
