import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
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
  Widget get body => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: []);
}
