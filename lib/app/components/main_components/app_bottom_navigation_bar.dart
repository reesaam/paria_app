import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routing/routing.dart';
import '../../../data/resources/app_colors.dart';
import 'app_bottom_navigation_bar_data.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  RxInt selectedIndex = 0.obs;

  void _onItemTap(int index) {
    selectedIndex.value = index;
    switch(index) {
      case 0 : goToHomePage();
      case 1 : goToHomePage();
      case 2 : goToHomePage();
      case 3 : goToHomePage();
      case 4 : goToHomePage();
      default: break;
    }
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
        items: AppBottomNavigationBarData().getData());
  }
}