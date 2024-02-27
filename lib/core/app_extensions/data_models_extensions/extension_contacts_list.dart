import 'package:get/get.dart';

import '../../../../../core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import '../../../../../core/app_extensions/data_models_extensions/extension_contact.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../core_functions.dart';

///Save Storage
extension RxStorage on Rx<AppContactEntitiesList> {
  void saveOnStorage() async => value.saveOnStorage();
}

extension Storage on AppContactEntitiesList {
  void saveOnStorage() async => await AppLocalStorage.to.saveContacts(contacts: this);
  AppContactEntitiesList get loadFromStorage =>
      AppLocalStorage.to.loadContacts();
}

///Contact Functions
extension RxContactFunctions on Rx<AppContactEntitiesList> {
  addContact(AppContactEntity contact) =>
      {value.addContact(contact), refresh()};

  editContact(AppContactEntity prevContact, AppContactEntity contact) =>
      {value.editContact(prevContact, contact), refresh()};

  removeContact(AppContactEntity contact) =>
      {value.removeContact(contact), refresh()};
}

extension ContactFunction on AppContactEntitiesList {
  addContact(AppContactEntity contact) {
    List<AppContactEntity> contacts =
        List<AppContactEntity>.empty(growable: true);
    contacts.addAll(contactsList);
    contacts.add(contact);
    contactsList = contacts;
    defaultSortFunction;
    saveOnStorage();
  }

  _editRecords(AppContactEntity prevContact, AppContactEntity contact) {
    AppAccountRecordEntitiesList listRecords =
        AppAccountRecordEntitiesList().loadFromStorage;
    for (AppAccountRecordEntity record in listRecords.recordsList) {
      if (record.contact.equalTo(prevContact)) {
        listRecords.editRecord(record, record.copyWith(contact: contact));
      }
    }
    listRecords.saveOnStorage();
  }

  editContact(AppContactEntity prevContact, AppContactEntity contact) {
    appDebugPrint('previous contact: $prevContact');
    appDebugPrint('current contact: $contact');
    removeContact(prevContact);
    addContact(contact);
    _editRecords(prevContact, contact);
    appLogPrint('Contact Edited');
    appLogPrint('List($count):$contactsList');
    defaultSortFunction;
    saveOnStorage();
  }

  removeContact(AppContactEntity contact) {
    contactsList.remove(contact);
    saveOnStorage();
  }
}

///Sort
extension RxSortContacts on Rx<AppContactEntitiesList> {
  void get defaultSortFunction => sortFirstName;

  void get sortFirstName => {value.sortFirstName, refresh()};
}

extension SortContacts on AppContactEntitiesList {
  void get defaultSortFunction => sortFirstName;

  void get sortFirstName {
    List<AppContactEntity> contacts =
        List<AppContactEntity>.empty(growable: true);
    contacts.addAll(contactsList);
    contacts.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    contactsList = contacts;
  }
}

///Details
extension RxDetails on Rx<AppContactEntitiesList> {
  List<AppContactEntity> get contactsList => value.contactsList;
  int get count => value.count;
  bool get isEmpty => value.isEmpty;
}

extension Details on AppContactEntitiesList {
  int get count => contactsList.length;
  bool get isEmpty => contactsList.isEmpty;
}

///List Functions
extension RxListFunctions on Rx<AppContactEntitiesList> {
  clearContactsList() => {value.clearContactsList(), refresh()};
}

extension ListFunctions on AppContactEntitiesList {
  clearContactsList() {
    contactsList.clear();
    saveOnStorage();
  }
}
