import 'dart:async';

import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_account_records_entity_list.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contacts_entity_list.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../accounts/domain/entities/account_balance_entity/account_balance_entity.dart';
import '../../../accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';

class HomePageController extends CoreController {
  Rx<DateTime> mainDateTime = DateTime.now().obs;
  Rx<String> mainTime = ''.obs;
  Rx<String> mainDate = ''.obs;

  Rx<int> summaryContactsCount = 0.obs;
  Rx<int> summaryRecordsCount = 0.obs;
  Rx<AppAccountBalanceEntity> summaryBalanceCount = const AppAccountBalanceEntity().obs;

  Rx<AppAccountRecordEntitiesList> listRecords = AppAccountRecordEntitiesList().obs;
  Rx<AppContactEntitiesList> listContacts = AppContactEntitiesList().obs;

  @override
  void dataInit() {
    // clearAppData();
    listContacts.value = AppContactEntitiesList().loadFromStorage;
    listRecords.value = AppAccountRecordEntitiesList().loadFromStorage;
    _listenersInit();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.homepage;
    mainTime.value = mainDateTime.value.toDateFormat;
    mainDate.value = mainDateTime.value.toTimeFormatWithSeconds;

    summaryContactsCount.value = listContacts.count;
    summaryRecordsCount.value = listRecords.count;
    summaryBalanceCount.value = listRecords.calculateSum(false);
    appDebugPrint('HomePage Init Function Done');
  }

  @override
  void onInitFunction() {
    _timeUpdate();
  }

  @override
  void onCloseFunction() {
    saveAppData();
    listContacts.close();
    listRecords.close();
    mainDateTime.close();
    mainTime.close();
    mainDate.close();
    summaryContactsCount.close();
    summaryRecordsCount.close();
    summaryBalanceCount.close();
  }

  _listenersInit() {
    listContacts.listen((data) => pageInit());
    listRecords.listen((data) => pageInit());
  }

  void _timeUpdate() => Timer.periodic(const Duration(seconds: 1), (timer) {
        mainDateTime.value = DateTime.now();
        mainTime.value = mainDateTime.value.toDateFormat;
        mainDate.value = mainDateTime.value.toTimeFormatWithSeconds;
      });
}
