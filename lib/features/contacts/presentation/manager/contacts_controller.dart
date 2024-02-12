import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_list.dart';
import 'package:paria_app/features/contacts/presentation/manager/contact_functions.dart';

import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';

class ContactsController extends CoreController {
  Rx<AppContactEntitiesList> listContacts = AppContactEntitiesList(
          contactsList: List<AppContactEntity>.empty(growable: true))
      .obs;
  AppContactEntity? selectedContact;

  @override
  void dataInit() {
    // clearAppData();
    listContacts.value = AppContactEntitiesList().loadFromStorage;
    appLogPrint('${listContacts.count} Contacts Imported');
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.contacts;
  }

  @override
  void onInitFunction() {
    listContacts.defaultSortFunction;
    listContacts.listen((data) => onInitFunction());
    refresh();
  }

  @override
  void onCloseFunction() {
    saveAppData();
    listContacts.close();
  }

  addContact() => ContactFunctions().addContact();

  editContact() {}
}
