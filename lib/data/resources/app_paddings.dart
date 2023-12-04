import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPaddings {
  ///General
  static EdgeInsets get zero => const EdgeInsets.all(0);
  static EdgeInsets get pages => const EdgeInsets.all(10);

  ///Elements
  static EdgeInsets get textFieldContent => const EdgeInsets.fromLTRB(20, 10, 20, 10);

  ///AppBar
  static EdgeInsets get appBarActions => const EdgeInsets.only(right: 10);

  ///Drawer
  static EdgeInsets get drawerHeader => const EdgeInsets.fromLTRB(10, 20, 20, 20);
  static EdgeInsets get drawerFooter => const EdgeInsets.fromLTRB(20, 10, 0, 20);

  ///Modals
  static EdgeInsets get generalBottomModal => EdgeInsets.fromLTRB(20, 0, 20, Get.context!.mediaQuery.viewInsets.bottom);
  static EdgeInsets get generalAlertDialog => const EdgeInsets.all(20);

  ///Homepage
  static EdgeInsets get homepageTopBar => const EdgeInsets.fromLTRB(20, 30, 20, 30);

  ///ListPage
  static EdgeInsets get listPageSearchBox => const EdgeInsets.only(bottom: 10);

  ///Settings
  static EdgeInsets get settingsSection => const EdgeInsets.fromLTRB(0, 20, 0, 10);
  static EdgeInsets get settingsItem => const EdgeInsets.fromLTRB(15, 10, 15, 10);

  ///Update
  static EdgeInsets get updateButtons => const EdgeInsets.fromLTRB(50, 0, 50, 0);
}