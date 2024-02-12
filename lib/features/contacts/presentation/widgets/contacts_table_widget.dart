import 'package:flutter/material.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_contact.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contacts_list.dart';
import '../../../../data/resources/app_elements.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';
import '../manager/contact_functions.dart';
import 'contact_avatar_widget.dart';

class ContactsTable extends StatelessWidget {
  final AppContactEntitiesList listContacts;
  const ContactsTable({super.key, required this.listContacts});

  @override
  Widget build(BuildContext context) => ListView.builder(
      shrinkWrap: true,
      itemCount: listContacts.count,
      itemBuilder: (context, index) =>
          _contactItem(listContacts.contactsList[index]));

  _contactItem(AppContactEntity contact) => GestureDetector(
      onTap: () => ContactFunctions().showContactModal(contact),
      child: Card(
          shape: AppElements.cardTransparentOutlineBorder,
          child: Padding(
              padding: AppPaddings.contactsItem,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      ContactAvatar(
                          contact: contact,
                          size: AppElements.contactsListAvatarMaxRadius),
                      AppSpaces.w20,
                      Text(contact.getContactFullName,
                          style: AppTextStyles.contactsListItem),
                    ]),
                    // AppPopupMenu(listItems: contactOptions(contact)),
                  ]))));
}
