import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:uuid/v1.dart';

import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/general_widgets/app_text_field.dart';
import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';

class AppContactsAddEditContactComponent {
  AppContactEntity _providedContact = const AppContactEntity();

  //TextEditing Controllers
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerMobile = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerWebLink = TextEditingController();

  Widget _widgetAddOrEditContactDialog() => Form(
        child: Column(children: [
          AppTextField(
              controller: _controllerFirstName,
              label: Texts.to.contactsAddContactFirstNameTitle,
              hint: _hintGenerator(Texts.to.contactsAddContactFirstNameTitle),
              icon: AppIcons.accounts.icon),
          AppSpaces.h10,
          AppTextField(
              controller: _controllerLastName,
              label: Texts.to.contactsAddContactLastNameTitle,
              hint: _hintGenerator(Texts.to.contactsAddContactLastNameTitle),
              icon: AppIcons.accounts.icon),
          AppSpaces.h10,
          AppTextField(
              controller: _controllerMobile,
              label: Texts.to.contactsAddContactMobileTitle,
              hint: _hintGenerator(Texts.to.contactsAddContactMobileTitle),
              icon: AppIcons.mobile.icon),
          AppSpaces.h10,
          AppTextField(
              controller: _controllerPhone,
              label: Texts.to.contactsAddContactPhoneTitle,
              hint: _hintGenerator(Texts.to.contactsAddContactPhoneTitle),
              icon: AppIcons.phone.icon),
          AppSpaces.h10,
          AppTextField(
              controller: _controllerEmail,
              label: Texts.to.contactsAddContactEmailTitle,
              hint: _hintGenerator(Texts.to.contactsAddContactEmailTitle),
              icon: AppIcons.email.icon),
          AppSpaces.h10,
          AppTextField(
              controller: _controllerWebLink,
              label: Texts.to.contactsAddContactWebLinkTitle,
              hint: _hintGenerator(Texts.to.contactsAddContactWebLinkTitle),
              icon: AppIcons.web.icon),
        ]),
      );

  _hintGenerator(String text) => 'Enter $text';

  _provideContact() async {
    if (_controllerFirstName.text.isEmpty && _controllerLastName.text.isEmpty) {
      AppSnackBar.show(Texts.to.contactsAddEditModalErrorFirstname);
    } else if (_controllerMobile.text.isEmpty) {
      AppSnackBar.show(Texts.to.contactsAddEditModalErrorMobile);
    } else {
      _providedContact = AppContactEntity(
          id: const Uuid().v1(),
          firstName: _controllerFirstName.text,
          lastName: _controllerLastName.text ?? '',
          mobile: _controllerMobile.text,
          phone: _controllerPhone.text ?? '',
          email: _controllerEmail.text ?? '',
          webLink: _controllerWebLink.text ?? '');
      popPage();
    }
  }

  addContact() async {
    await _raiseModal(Texts.to.contactsAddContactTitle);
    _providedContact.isEmpty
        ? appDebugPrint('Add Contact Canceled')
        : {
            appDebugPrint('Contact: $_providedContact'),
            appDebugPrint('Add Contact Modal Closed')
          };
    return _providedContact.isEmpty ? null : _providedContact;
  }

  editContact(AppContactEntity contact) async {
    ///Controllers
    _controllerFirstName.text = contact.firstName ?? '';
    _controllerLastName.text = contact.lastName ?? '';
    _controllerMobile.text = contact.mobile ?? '';
    _controllerPhone.text = contact.phone ?? '';
    _controllerEmail.text = contact.email ?? '';
    _controllerWebLink.text = contact.webLink ?? '';

    await _raiseModal(Texts.to.contactsEditContactTitle);

    appDebugPrint(_providedContact.equalTo(contact)
        ? 'Edit Contact Canceled'
        : {
            'Contact: $_providedContact',
            appDebugPrint('Edit Contact Modal Closed')
          });

    saveAppData();
    return _providedContact.equalTo(contact) ? null : _providedContact;
  }

  _raiseModal(String title) async =>
      await AppDialogs().appBottomDialogWithOkCancel(
          title: title,
          form: _widgetAddOrEditContactDialog(),
          onTapOk: _provideContact,
          dismissible: true);
}
