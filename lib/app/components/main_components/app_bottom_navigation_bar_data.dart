import 'package:flutter/material.dart';

import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_enums.dart';
import '../../../data/resources/app_icons.dart';

class AppBottomNavigationBarData {
  List<BottomNavigationBarItem> getData() => <BottomNavigationBarItem>[
        ///HomePage
        _generateBottomNavigationBarItem(AppBottomNavigationPages.homepage,
            AppPageDetails.homepage.pageName),

        ///Settings
        _generateBottomNavigationBarItem(AppBottomNavigationPages.settings,
            AppPageDetails.settings.pageName),
      ];

  BottomNavigationBarItem _generateBottomNavigationBarItem(
          AppBottomNavigationPages page, String? label) =>
      BottomNavigationBarItem(
          activeIcon: CircleAvatar(
              backgroundColor: AppColors.textNormalDark,
              foregroundColor: AppColors.textNormalDark,
              child: _createIcon(page).withColor(AppColors.textNormalLight)),
          icon: _createIcon(page),
          label: _createLabel(label));

  Icon _createIcon(AppBottomNavigationPages page) {
    Icon icon = const Icon(Icons.not_interested);
    switch (page) {
      case (AppBottomNavigationPages.homepage):
        icon = AppIcons.bottomNavigationHomepage;
        break;
      case (AppBottomNavigationPages.settings):
        icon = AppIcons.bottomNavigationSettings;
        break;
      default:
        break;
    }
    return icon;
  }

  String? _createLabel(String? label) => label;
}
