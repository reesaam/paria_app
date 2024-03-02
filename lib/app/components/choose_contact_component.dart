import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/app/components/general_widgets/app_snack_bars.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';
import 'package:paria_app/core/app_routing/routing.dart';
import 'package:paria_app/data/resources/app_icons.dart';

import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_text_styles.dart';
import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'main_components/app_dialogs.dart';

class ChooseContactComponent {
  final AppContactEntitiesList _listContacts =
      AppContactEntitiesList().loadFromStorage;
  AppContactEntity? _selectedContact;

  Widget _chooseContactItem(AppContactEntity contact) => InkWell(
      onTap: () => {_selectedContact = contact, popPage()},
      child: Container(
        alignment: Alignment.centerLeft,
        padding: AppPaddings.accountsSelectContactList,
        child: Text(contact.getContactFullName,
            style: AppTextStyles.contactsChooseContact),
      ));

  Widget _chooseContactForm() => Form(
      child: Column(
          children: List.generate(
              _listContacts.contactsList.length,
              (index) =>
                  _chooseContactItem(_listContacts.contactsList[index]))));

  Future<AppContactEntity?> chooseContact() async {
    _listContacts.contactsList.isEmpty
        ? await AppSnackBar().showSnackBar(
            message: Texts.to.contactsAddEditModalErrorNoContactsAvailable,
            // leadingIcon: AppIcons.add,
            // buttonText:
            //     Texts.to.contactsAddEditModalErrorNoContactsAvailableOnTap,
            // buttonAction: goToContacts
          )
        : await AppDialogs().appBottomDialogWithCancel(
            title: Texts.to.accountsAddRecordChooseContact.withDoubleDots,
            form: _chooseContactForm(),
            dismissible: true);
    return _selectedContact;
  }
}
