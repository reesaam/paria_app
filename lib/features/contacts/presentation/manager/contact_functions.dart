import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';
import '../widgets/show_contact_form.dart';

class ContactFunctions {
  showContactModal(AppContactEntity contact) async =>
      await AppDialogs().appBottomDialogWithoutButton(
          contact.getContactFullName,
          ShowContactFormWidget(contact: contact),
          true);

  addContact() {}

  editContact(AppContactEntity contact) {}

  removeContact(AppContactEntity contact) {}
}
