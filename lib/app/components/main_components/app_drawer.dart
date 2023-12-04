import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core_functions.dart';
import '../../../data/data_models/core_data_models/app_page_detail/app_page_detail.dart';
import '../../../data/info/app_info.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_logos.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_sizes.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../data/resources/app_texts.dart';
import '../general_components/app_dividers.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key});

  @override
  double? get width => Get.width / 1.6;

  @override
  Widget? get child => SafeArea(
        child: Column(children: [
          header(),
          AppDividers.generalDivider,
          Expanded(child: body()),
          AppDividers.generalDivider,
          footer(),
        ]),
      );

  Widget header() => Container(
      padding: AppPaddings.drawerHeader,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(AppLogos.appLogo, width: AppSizes.drawerHeaderIconWidth),
        Text(AppInfo.appNameInitials),
      ]));

  Widget body() => Column(children: [
        _bodyItem(AppPageDetails.homepage, AppIcons.home),
        _bodyItem(AppPageDetails.settings, AppIcons.settings),
        _bodyItem(AppPageDetails.about, AppIcons.about),
      ]);

  Widget _bodyItem(AppPageDetail page, Icon icon) => ListTile(
        title: Text(page.pageName!),
        leading: icon,
        onTap: () => {popPage(), goToPage(page)},
      );

  Widget footer() => Container(
      padding: AppPaddings.drawerFooter,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AppIcons.version,
        AppSpaces.w20,
        InkWell(
          onTap: () => goToPage(AppPageDetails.update),
            child: Text(
                '${AppTexts.generalVersion}: ${AppInfo.appCurrentVersion}')),
      ]));
}
