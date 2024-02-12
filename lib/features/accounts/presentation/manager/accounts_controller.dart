import 'dart:async';

import 'package:get/get.dart';

import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class AccountsController extends CoreController {
  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.accounts;
  }

  @override
  void onInitFunction() {}

  @override
  void onCloseFunction() {
    saveAppData();
  }
}
