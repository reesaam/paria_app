import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_record.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_accounts_filter.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_bool.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';
import '../../domain/entities/accounts_filter_entity/accounts_filter_entity.dart';
import '../widgets/add_edit_record_component.dart';
import '../widgets/show_account_form.dart';

class AccountsController extends CoreController {
  Rx<AppAccountRecordEntitiesList> listRecords =
      AppAccountRecordEntitiesList().obs;

  //Summary
  Rx<int> itemsBalance = 0.obs;
  Rx<int> itemsCount = 0.obs;
  Rx<int> itemsCountContacts = 0.obs;

  Rx<bool> hasFilter = false.obs;
  Rx<AppAccountsFilterEntity> filter = const AppAccountsFilterEntity().obs;
  Rx<bool> clearedIncluded = false.obs;

  //Listeners
  StreamSubscription? listenerListRecords;
  StreamSubscription? listenerFilter;
  StreamSubscription? listenerHasFilter;
  StreamSubscription? listenerShowPositive;
  StreamSubscription? listenerShowNegative;

  @override
  void dataInit() {
    // clearAppData();
    listRecords.value = AppAccountRecordEntitiesList().loadFromStorage;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.accounts;
    listenersInit();
  }

  @override
  void onInitFunction() {
    hasFilter.value = filter.value.isNotEmpty;
    itemsBalance.value =
        listRecords.calculateSum(clearedIncluded.value).balance ?? 0;
    itemsCount.value =
        listRecords.calculateSum(clearedIncluded.value).count ?? 0;
    itemsCountContacts.value = listRecords.countContacts(clearedIncluded.value);
    appDebugPrint('Has Filter: ${hasFilter.value}');
    appDebugPrint(listRecords.count);
    appDebugPrint(itemsBalance.value);
    appDebugPrint(itemsCount.value);
    appDebugPrint(itemsCountContacts.value);
    appDebugPrint("Calculations of List Done");
  }

  @override
  void onCloseFunction() {
    listenersClose();
    saveAppData();
  }

  ///Listeners
  listenersInit() {
    listenerListRecords = listRecords.listen((data) => onInitFunction());
    listenerFilter = filter.listen((data) => onInitFunction());
    listenerHasFilter = hasFilter
        .listen((data) => hasFilter.value ? _filterModal() : filter.clear);
  }

  listenersClose() {
    listenerListRecords?.cancel();
    listenerFilter?.cancel();
    listenerHasFilter?.cancel();
  }

  ///Records Manipulation
  showRecord(AppAccountRecordEntity record) async =>
      await AppDialogs().appBottomDialogWithoutButton(
          form: ShowAccountRecordFormWidget(record: record), dismissible: true);

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

  changeClearanceStatus(AppAccountRecordEntity record) =>
      listRecords.changeStatus(record);

  _filterModal() {
    appDebugPrint('filter modal');
  }

  changeShowCleared() => filter.value.cleared == true
      ? filter.clear
      : filter.value = filter.value.copyWith(cleared: true);

  showPositive() => filter.value = filter.value.copyWith(positives: true);

  showNegative() => filter.value = filter.value.copyWith(negatives: true);

  showAllRecords() => filter.clear;

  itemOnLongPress(AppAccountRecordEntity record) async {
    Widget form = Column(children: [
      InkWell(
          child: AppDialogs().bottomDialogFunctionalItem(record.cleared == true
              ? Texts.to.accountsTableItemMenuMarkAsUncleared
              : Texts.to.accountsTableItemMenuMarkAsCleared),
          onTap: () {
            popPage();
            changeClearanceStatus(record);
          }),
      InkWell(
          child: AppDialogs().bottomDialogFunctionalItem(
              Texts.to.accountsTableItemMenuShowRecord),
          onTap: () {
            popPage();
            showRecord(record);
          }),
      InkWell(
          child: AppDialogs().bottomDialogFunctionalItem(
              Texts.to.accountsTableItemMenuEditRecord),
          onTap: () {
            popPage();
            editRecord(record);
          }),
      InkWell(
          child: AppDialogs().bottomDialogFunctionalItem(
              Texts.to.accountsTableItemMenuRemoveRecord),
          onTap: () {
            popPage();
            removeRecord(record);
          }),
    ]);
    await AppDialogs().appBottomDialogWithCancel(form: form, dismissible: true);
  }
}
