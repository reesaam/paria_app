import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/elements/core_view.dart';
import '../../data/info/app_info.dart';
import '../../data/resources/app_logos.dart';
import '../../data/resources/app_paddings.dart';
import '../../data/resources/app_sizes.dart';
import '../components/main_components/app_bar.dart';
import '../components/main_components/app_bottom_navigation_bar.dart';
import '../components/main_components/app_drawer.dart';
import '../controllers/homepage_controller.dart';

@RoutePage(name: 'HomeRoute')
class HomePage extends CoreView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get topBar => widgetTopBar();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(
      selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget get body => Column();

  Widget widgetTopBar() => Container(
      padding: AppPaddings.homepageTopBar,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(AppLogos.appLogo, width: AppSizes.homepageLogo),
        Text(AppInfo.appName),
      ]));
}
