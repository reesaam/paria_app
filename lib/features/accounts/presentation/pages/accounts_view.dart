import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_sizes.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../manager/accounts_controller.dart';

class AccountsPage extends CoreView<AccountsController> {
  const AccountsPage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

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
