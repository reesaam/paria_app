import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_list.dart';

import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';

class ContactsBalanceController extends CoreController {

  Rx<AppContactEntitiesList> listContacts = AppContactEntitiesList().obs;
  Rx<AppAccountRecordEntitiesList> listRecords = AppAccountRecordEntitiesList().obs;

  @override
  void dataInit() {
    // clearAppData();
    listContacts.value = AppContactEntitiesList().loadFromStorage;
    listRecords.value = AppAccountRecordEntitiesList().loadFromStorage;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.contacts;
  }

  @override
  void onInitFunction() {}

  @override
  void onCloseFunction() {
    saveAppData();
  }
}
