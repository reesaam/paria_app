import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/accounts/domain/entities/account_balance_entity/account_balance_entity.dart';
import '../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../core_functions.dart';

///Save Storage
extension RxStorage on Rx<AppAccountRecordEntitiesList> {
  void saveOnStorage() async => value.saveOnStorage();
}

extension Storage on AppAccountRecordEntitiesList {
  void saveOnStorage() async =>
      await AppLocalStorage.to.saveAccountRecords(this);
  AppAccountRecordEntitiesList get loadFromStorage =>
      AppLocalStorage.to.loadAccountRecords();
}

///Record Functions
extension RxRecordFunction on Rx<AppAccountRecordEntitiesList> {
  addRecord(AppAccountRecordEntity record) => {value.addRecord(record), refresh()};

  editRecord(AppAccountRecordEntity prevRecord, AppAccountRecordEntity record) =>
      {value.editRecord(prevRecord, record), refresh()};

  removeRecord(AppAccountRecordEntity record) =>
      {value.removeRecord(record), refresh()};
}

extension RecordFunction on AppAccountRecordEntitiesList {
  addRecord(AppAccountRecordEntity record) {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(membersList);
    records.add(record);
    recordsList = records;
    appDebugPrint(" List($count):$membersList");
    defaultSortFunction;
    saveOnStorage();
  }

  editRecord(AppAccountRecordEntity prevRecord, AppAccountRecordEntity record) {
    appDebugPrint('previous record: $prevRecord');
    appDebugPrint('current record: $record');
    removeRecord(prevRecord);
    addRecord(record);
    appDebugPrint(" List($count):$membersList");
    defaultSortFunction;
    saveOnStorage();
  }

  removeRecord(AppAccountRecordEntity record) {
    membersList.remove(record);
    saveOnStorage();
  }
}

///Clear Record
extension RxClearRecord on Rx<AppAccountRecordEntitiesList> {
  clearRecord(AppAccountRecordEntity record) =>
      {value.clearRecord(record), refresh()};

  unClearRecord(record) => {value.unClearRecord(record), refresh()};
}

extension ClearRecord on AppAccountRecordEntitiesList {
  clearRecord(AppAccountRecordEntity record) {
    membersList.remove(record);
    membersList.add(record.copyWith(cleared: true));
    defaultSortFunction;
    saveOnStorage();
  }

  unClearRecord(record) {
    membersList.remove(record);
    membersList.add(record.copyWith(cleared: false));
    defaultSortFunction;
    saveOnStorage();
  }
}

///Sort
extension RxSortRecords on Rx<AppAccountRecordEntitiesList> {
  void get defaultSortFunction => {sortByContact, refresh()};
  void get sortByDateTime => {value.sortByDateTime, refresh()};
  void get sortByContact => {value.sortByContact, refresh()};
}

extension SortRecords on AppAccountRecordEntitiesList {
  void get defaultSortFunction => sortByContact;

  void get sortByDateTime {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(membersList);
    records.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));
    recordsList = records;
  }

  void get sortByContact {
    List<AppAccountRecordEntity> records =
        List<AppAccountRecordEntity>.empty(growable: true);
    records.addAll(recordsList);
    records
        .sort((a, b) => a.contact!.firstName!.compareTo(b.contact!.firstName!));
    recordsList = records;
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
    for (AppAccountRecordEntity record in membersList) {
      clearedIncluded
          ? {balance += record.amount!, count++}
          : record.cleared!
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
    for (AppAccountRecordEntity record in membersList) {
      if (!list.any((element) =>
          element.firstName == record.contact!.firstName &&
          element.lastName == record.contact!.lastName)) {
        clearedIncluded
            ? list.add(record.contact!)
            : record.cleared!
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
    List<AppAccountRecordEntity> list = List<AppAccountRecordEntity>.empty(growable: true);
    for (AppAccountRecordEntity record in membersList) {
      record.contact.equalTo(contact) && record.cleared != true
          ? list.add(record)
          : null;
    }
    return list;
  }
}

///Details
extension RxDetails on Rx<AppAccountRecordEntitiesList> {
  List<AppAccountRecordEntity> get membersList => value.membersList;
  int get count => value.count;
  bool get isEmpty => value.isEmpty;
}

extension Details on AppAccountRecordEntitiesList {
  List<AppAccountRecordEntity> get membersList => recordsList;
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
    recordsList.clear();
    saveOnStorage();
  }
}
