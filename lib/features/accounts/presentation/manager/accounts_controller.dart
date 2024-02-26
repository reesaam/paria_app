import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_record.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import 'package:paria_app/features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import 'package:paria_app/features/accounts/presentation/widgets/add_edit_record_component.dart';

import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class AccountsController extends CoreController {
  Rx<AppAccountRecordEntitiesList> listRecords =
      AppAccountRecordEntitiesList().obs;

  //Summery
  Rx<int> itemsBalance = 0.obs;
  Rx<int> itemsCount = 0.obs;
  Rx<int> itemsCountContacts = 0.obs;

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

  addRecord() async {
    AppAccountRecordEntity? record =
        await AppContactsAddEditRecordComponent().call(isEdit: false);
    appLogPrint('Record: $record');
    appLogPrint(record.isEmpty);

    record.isEmpty ? null : listRecords.addRecord(record!);
    refresh();
  }

  editRecord(AppAccountRecordEntity record) async {
    AppAccountRecordEntity? editedRecord =
        await AppContactsAddEditRecordComponent()
            .call(isEdit: true, record: record);
    appLogPrint('New Contact : $editedRecord');
    if (editedRecord.isNotEmpty) {
      listRecords.editRecord(record, editedRecord!);
    }
    refresh();
  }

  removeRecord(AppAccountRecordEntity record) {
    listRecords.removeRecord(record);
    appDebugPrint('Record Removed: $record');
    refresh();
  }
}
