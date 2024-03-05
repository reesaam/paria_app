import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_bool.dart';
import '../../../../features/accounts/domain/entities/account_record_entity/account_record_mapper.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/accounts/data/models/account_record_model/account_record_model.dart';
import '../../../features/accounts/domain/entities/account_balance_entity/account_balance_entity.dart';
import '../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../core_functions.dart';

///Save Storage
extension RxStorage on Rx<AppAccountRecordEntitiesList> {
  void saveOnStorage() async => value.saveOnStorage();
  Rx<AppAccountRecordEntitiesList> get loadFromStorage =>
      value.loadFromStorage.obs;
}

extension Storage on AppAccountRecordEntitiesList {
  void saveOnStorage() async => await AppLocalStorage.to.saveAccountRecords(
      accountRecords: AppAccountRecordModelsList(
          recordsList:
              List.generate(count, (index) => recordsList[index].mapper)));
  AppAccountRecordEntitiesList get loadFromStorage {
    var data = AppLocalStorage.to.loadAccountRecords();
    return AppAccountRecordEntitiesList(
        recordsList: List.generate(data.recordsList.length,
            (index) => data.recordsList[index].mapper));
  }
}

///Record Functions
extension RxRecordFunction on Rx<AppAccountRecordEntitiesList> {
  addRecord(AppAccountRecordEntity record) =>
      {value.addRecord(record), refresh()};

  editRecord(
          AppAccountRecordEntity prevRecord, AppAccountRecordEntity record) =>
      {value.editRecord(prevRecord, record), refresh()};

  removeRecord(AppAccountRecordEntity record) =>
      {value.removeRecord(record), refresh()};
}

extension RecordFunction on AppAccountRecordEntitiesList {
  addRecord(AppAccountRecordEntity record) {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.add(record);
    recordsList = records;
    appDebugPrint(" List($count):$recordsList");
    defaultSortFunction;
    saveOnStorage();
  }

  editRecord(AppAccountRecordEntity prevRecord, AppAccountRecordEntity record) {
    int index = recordsList.indexOf(recordsList.last);
    appDebugPrint('previous record: $prevRecord');
    appDebugPrint('current record: $record');
    index = recordsList.indexOf(prevRecord);
    removeRecord(prevRecord);
    appDebugPrint(" List($count):$recordsList");
    recordsList.insert(index, record);
    // addRecord(record);
    appDebugPrint(" List($count):$recordsList");
    defaultSortFunction;
    saveOnStorage();
  }

  removeRecord(AppAccountRecordEntity record) {
    recordsList.remove(record);
    saveOnStorage();
  }
}

///Clear Record
extension RxClearRecord on Rx<AppAccountRecordEntitiesList> {
  changeStatus(AppAccountRecordEntity record) =>
      {value.changeStatus(record), refresh()};
}

extension RecordStatus on AppAccountRecordEntitiesList {
  changeStatus(AppAccountRecordEntity record) {
    editRecord(record, record.copyWith(cleared: record.cleared.invert));
    defaultSortFunction;
    saveOnStorage();
  }
}

///Sort
extension RxSortRecords on Rx<AppAccountRecordEntitiesList> {
  get defaultSortFunction => {sortByContactAZ, refresh()};
  get sortByContactAZ => {value.sortByContactAZ, refresh()};
  get sortByContactZA => {value.sortByContactZA, refresh()};
  get sortByAmountInc => {value.sortByAmountInc, refresh()};
  get sortByAmountDec => {value.sortByAmountDec, refresh()};
  get sortByDateInc => {value.sortByDateInc, refresh()};
  get sortByDateDec => {value.sortByDateDec, refresh()};
}

extension SortRecords on AppAccountRecordEntitiesList {
  get defaultSortFunction => sortByContactAZ;

  get sortByContactAZ {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.sort((a, b) => (a.contact!.firstName ?? a.contact!.lastName)!
        .compareTo(b.contact!.firstName ?? b.contact!.lastName!));
    recordsList = records;
    return recordsList.toList();
  }

  get sortByContactZA {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.sort((a, b) => (b.contact!.firstName ?? b.contact!.lastName)!
        .compareTo(a.contact!.firstName ?? a.contact!.lastName!));
    recordsList = records;
    return recordsList.toList();
  }

  get sortByDateInc {
    List<AppAccountRecordEntity> records =
    List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.sort((a, b) => a.date!.compareTo(b.date!));
    recordsList = records;
    return recordsList.toList();
  }

  get sortByDateDec {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.sort((a, b) => b.date!.compareTo(a.date!));
    recordsList = records;
    return recordsList.toList();
  }

  get sortByAmountInc {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.sort((a, b) => a.amount!.compareTo(b.amount!));
    recordsList = records;
    return recordsList.toList();
  }

  get sortByAmountDec {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records.sort((a, b) => b.amount!.compareTo(a.amount!));
    recordsList = records;
    return recordsList.toList();
  }
}

///Sum
extension RxSum on Rx<AppAccountRecordEntitiesList> {
  AppAccountBalanceEntity calculateSum(bool clearedIncluded) =>
      value.calculateSum(clearedIncluded);
}

extension Sum on AppAccountRecordEntitiesList {
  AppAccountBalanceEntity calculateSum(bool clearedIncluded) {
    int balance = 0;
    int count = 0;
    for (AppAccountRecordEntity record in recordsList) {
      clearedIncluded == true
          ? {balance += record.amount!, count++}
          : record.cleared == true
              ? null
              : {balance += record.amount!, count++};
    }
    return AppAccountBalanceEntity(balance: balance, count: count);
  }
}

///Contacts
extension RxContacts on Rx<AppAccountRecordEntitiesList> {
  countContacts(bool clearedIncluded) => value.countContacts(clearedIncluded);
}

extension Contacts on AppAccountRecordEntitiesList {
  countContacts(bool clearedIncluded) {
    List<AppContactEntity> list = List<AppContactEntity>.empty(growable: true);
    for (AppAccountRecordEntity record in recordsList) {
      if (!list.any((element) => element.equalTo(record.contact))) {
        clearedIncluded
            ? list.add(record.contact!)
            : record.cleared == true
                ? null
                : list.add(record.contact!);
      }
    }
    return list.length;
  }
}

///Records' Contact
extension RxContactRecords on Rx<AppAccountRecordEntitiesList> {
  List<AppAccountRecordEntity> getContactRecords(
          AppContactEntity contact, bool clearedIncluded) =>
      value.getContactRecords(contact, clearedIncluded);
}

extension ContactRecords on AppAccountRecordEntitiesList {
  List<AppAccountRecordEntity> getContactRecords(
      AppContactEntity contact, bool clearedIncluded) {
    List<AppAccountRecordEntity> list =
        List<AppAccountRecordEntity>.empty(growable: true);
    for (AppAccountRecordEntity record in recordsList) {
      record.contact.equalTo(contact) && record.cleared != true
          ? list.add(record)
          : null;
    }
    return list;
  }
}

///Details
extension RxDetails on Rx<AppAccountRecordEntitiesList> {
  List<AppAccountRecordEntity> get recordsList => value.recordsList;
  int get count => value.count;
  bool get isEmpty => value.isEmpty;
}

extension Details on AppAccountRecordEntitiesList {
  int get count => recordsList.length;
  bool get isEmpty => recordsList.isEmpty;
}

///Clear Records List
extension RxClearRecordsList on Rx<AppAccountRecordEntitiesList> {
  void get clearRecordsList {
    value.clearRecordsList;
    refresh();
  }
}

extension ClearRecordsList on AppAccountRecordEntitiesList {
  void get clearRecordsList {
    recordsList = List.empty(growable: true);
    saveOnStorage();
  }
}
