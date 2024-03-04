import 'dart:async';

import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contacts_entity_list.dart';
import '../../../../app/components/dialogs/app_bottom_dialogs.dart';
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
    listContacts.defaultSortFunction;
  }

  @override
  void onCloseFunction() {
    saveAppData();
    listContacts.close();
  }

  showContactModal(AppContactEntity contact) async =>
      await AppBottomDialogs().withoutButton(
          form: ShowContactFormWidget(contact: contact), dismissible: true);

  addContact() async {
    AppContactEntity? contact =
        await AppContactsAddEditContactComponent().call(isEdit: false);
    appLogPrint('Contact: $contact');
    appLogPrint(contact.isEmpty);

    contact.isEmpty ? null : listContacts.addContact(contact!);
    Get.reloadAll();
    refresh();
  }

  editContact(AppContactEntity contact) async {
    AppContactEntity? editedContact = await AppContactsAddEditContactComponent()
        .call(isEdit: true, contact: contact);
    appLogPrint('New Contact : $editedContact');
    if (editedContact.isNotEmpty) {
      listContacts.editContact(contact, editedContact!);
    }
    Get.reloadAll();
    refresh();
  }

  removeContact(AppContactEntity contact) {
    listContacts.removeContact(contact);
    appDebugPrint('Contact Removed: $contact');
    Get.reloadAll();
    refresh();
  }
}
