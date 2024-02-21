import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_list.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';
import '../widgets/show_contact_form.dart';
import 'add_edit_contact_component.dart';

class ContactsController extends CoreController {

  static ContactsController get to => Get.find();

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

  showContactModal(AppContactEntity contact) async =>
      await AppDialogs().appBottomDialogWithoutButton(
          form: ShowContactFormWidget(contact: contact),
          dismissible: true);

  addContact() async {
    AppContactEntity? contact =
        await AppContactsAddEditContactComponent().addContact();
    contact.isEmpty ? null : listContacts.addContact(contact!);
  }

  editContact(AppContactEntity contact) async {
    AppContactEntity editedContact =
        await AppContactsAddEditContactComponent().editContact(contact);
    editedContact.isEmpty
        ? appDebugPrint('Contact is Empty: ${editedContact.isEmpty}')
        : {
            listContacts.editContact(contact, editedContact),
            appDebugPrint('Contact Edited: $contact')
          };
    refresh();
  }

  removeContact(AppContactEntity contact) {
    listContacts.removeContact(contact);
    appDebugPrint('Contact Removed: $contact');
    refresh();
  }
}
