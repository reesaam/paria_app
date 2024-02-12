import 'package:get/get.dart';
import 'package:paria_app/app/components/main_components/app_dialogs.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:paria_app/features/contacts/presentation/widgets/show_contact_modal.dart';

class ContactFunctions {
  showContactModal(AppContactEntity contact) async =>
      await AppDialogs().appBottomDialogWithoutButton(
          contact.getContactFullName, ShowContactFormWidget(contact: contact), true);

  editContact(AppContactEntity contact) {}

  removeContact(AppContactEntity contact) {}
}
