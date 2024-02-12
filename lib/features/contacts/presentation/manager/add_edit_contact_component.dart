import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';

import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/general_widgets/app_text_field.dart';
import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_spaces.dart';

class AppContactsAddEditContactComponent {
  final AppContactEntity? contact;
  final String? title;
  AppContactsAddEditContactComponent({this.contact, this.title});

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
    }
    else if (_controllerMobile.text.isEmpty) {
      AppSnackBar.show(Texts.to.contactsAddEditModalErrorMobile);
    }
    else {
      _providedContact = AppContactEntity(
          firstName: _controllerFirstName.text,
          lastName: _controllerLastName.text ?? '',
          mobile: _controllerMobile.text,
          phone: _controllerPhone.text ?? '',
          email: _controllerEmail.text ?? '',
          webLink: _controllerWebLink.text ?? '');
      Get.back();
    }
  }

  addContact() async {
    await _raiseModal();
    appDebugPrint(_providedContact.isEmpty
        ? 'Add Contact Canceled'
        : {'Contact: $_providedContact', appDebugPrint('Add Contact Modal Closed')});
    saveAppData();
    return _providedContact.isEmpty ? null : _providedContact;
  }

  editContact(AppContactEntity prevContact) async {

    ///Controllers
    _controllerFirstName.text = prevContact.firstName ?? '';
    _controllerLastName.text = prevContact.lastName ?? '';
    _controllerMobile.text = prevContact.mobile ?? '';
    _controllerPhone.text = prevContact.phone ?? '';
    _controllerEmail.text = prevContact.email ?? '';
    _controllerWebLink.text = prevContact.webLink ?? '';

    await _raiseModal();
    _provideContact();

    appDebugPrint(_providedContact!.equalTo(prevContact)
        ? 'Edit Contact Canceled'
        : {'Contact: $_providedContact', appDebugPrint('Edit Contact Modal Closed')});

    saveAppData();
    return _providedContact.equalTo(prevContact) ? null : _providedContact;
  }

  _raiseModal() async => await AppDialogs().appBottomDialogWithOkCancel(
      title ?? '', _widgetAddOrEditContactDialog(), _provideContact, true);
}
