import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../core/app_routing/app_routes.dart';
import '../../../core/core_functions.dart';
import '../../../data/data_models/core_data_models/app_page_detail/app_page_detail.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_icons.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  RxInt selectedIndex = 0.obs;

  List<AppPageDetail> pages = <AppPageDetail>[
    AppPageDetails.homepage,
    AppPageDetails.settings,
  ];

  void _onItemTap(int index) {
    selectedIndex.value = index;
    goToPage(pages[index]);
    Get.reload();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex.value = widget.selectedIndex!;
    return BottomNavigationBar(
        backgroundColor: AppColors.bottomBarBackground,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        currentIndex: selectedIndex.value,
        onTap: (index) => _onItemTap(index),
        selectedItemColor: AppColors.bottomBarSelected,
        unselectedItemColor: AppColors.bottomBarUnselected,
        items: List<BottomNavigationBarItem>.generate(pages.length,
            (index) => _generateBottomNavigationBarItem(pages[index])));
  }

  BottomNavigationBarItem _generateBottomNavigationBarItem(
          AppPageDetail pageDetail) =>
      BottomNavigationBarItem(
          activeIcon: CircleAvatar(
              backgroundColor: AppColors.textNormalDark,
              foregroundColor: AppColors.textNormalDark,
              child: _createIcon(pageDetail.pageRoute!)
                  .withColor(AppColors.textNormalLight)),
          icon: _createIcon(pageDetail.pageRoute!),
          label: _createLabel(pageDetail.pageName));

  Icon _createIcon(String pageName) {
    Icon icon = const Icon(Icons.not_interested);
    switch (pageName) {
      case (AppRoutes.homePage):
        icon = AppIcons.bottomNavigationHomepage;
        break;
      case (AppRoutes.settings):
        icon = AppIcons.bottomNavigationSettings;
        break;
      default:
        break;
    }
    return icon;
  }

  String? _createLabel(String? label) => label;
}
