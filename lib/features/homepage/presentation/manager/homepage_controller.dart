import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/core_functions.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class HomePageController extends CoreController {

  Rx<DateTime> mainDateTime = DateTime.now().obs;
  Rx<String> mainTime = ''.obs;
  Rx<String> mainDate = ''.obs;

  Rx<int> summaryContactsCount = 0.obs;
  Rx<int> summaryRecordsCount = 0.obs;
  // Rx<AppAccountBalanceEntity> summaryBalanceCount = const AppAccountBalanceEntity().obs;

  // Rx<AppAccountRecordEntityEntitiesList> listRecords = AppAccountRecordEntitiesList().obs;
  // Rx<AppContactsList> listContacts = AppContactsList().obs;

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.homepage;
    mainTime.value = mainDateTime.value.toDateFormat;
    mainDate.value = mainDateTime.value.toTimeFormatWithSeconds;

    // summaryContactsCount.value = listContacts.count;
    // summaryRecordsCount.value = listRecords.count;
    // summaryBalanceCount.value = listRecords.calculateSum(false);
  }

  @override
  void onInitFunction() {
    _timeUpdate();
  }

  @override
  void onCloseFunction() {
    saveAppData();
  }

  void _timeUpdate() => Timer.periodic(const Duration(seconds: 1), (timer) {
    mainDateTime.value = DateTime.now();
    mainTime.value = mainDateTime.value.toDateFormat;
    mainDate.value = mainDateTime.value.toTimeFormatWithSeconds;
  });
}
