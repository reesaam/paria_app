import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact_entity.dart';
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
  Rx<bool> _hasError = false.obs;

  //TextEditing Controllers
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerMobile = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerWebLink = TextEditingController();

  Widget _widgetAddOrEditContactDialog() => Obx(() => Form(
          child: Column(children: [
        AppTextField(
            controller: _controllerFirstName,
            label: Texts.to.contactsAddContactFirstNameTitle,
            hint: _hintGenerator(Texts.to.contactsAddContactFirstNameTitle),
            hasError: _hasError.value,
            icon: AppIcons.accounts.icon),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerLastName,
            label: Texts.to.contactsAddContactLastNameTitle,
            hint: _hintGenerator(Texts.to.contactsAddContactLastNameTitle),
            hasError: _hasError.value,
            icon: AppIcons.accounts.icon),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerMobile,
            label: Texts.to.contactsAddContactMobileTitle,
            hint: _hintGenerator(Texts.to.contactsAddContactMobileTitle),
            hasError: _hasError.value,
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
      ])));

  _hintGenerator(String text) => 'Enter $text';

  Future<AppContactEntity?> call(
      {required bool isEdit, AppContactEntity? contact}) async {
    String title = isEdit
        ? Texts.to.contactsAddContactTitle
        : Texts.to.contactsEditContactTitle;

    if (isEdit) {
      if (contact == null) {
      } else {
        _controllerFirstName.text = contact.firstName ?? '';
        _controllerLastName.text = contact.lastName ?? '';
        _controllerMobile.text = contact.mobile ?? '';
        _controllerPhone.text = contact.phone ?? '';
        _controllerEmail.text = contact.email ?? '';
        _controllerWebLink.text = contact.webLink ?? '';
      }
    }

    await AppDialogs().appBottomDialogWithOkCancel(
        title: title,
        form: _widgetAddOrEditContactDialog(),
        onTapOk: _provideContact,
        dismissible: true);

    _providedContact.isNotEmpty
        ? _providedContact = _providedContact.copyWith(
            id: isEdit ? contact?.id : const Uuid().v1())
        : null;
    return _providedContact;
  }

  _provideContact() {
    _hasError.value = true;
    if (_controllerFirstName.text.isEmpty &&
        _controllerLastName.text.isEmpty &&
        _controllerMobile.text.isEmpty) {
      AppSnackBar.showSnackBar(
          text: Texts.to.contactsAddEditModalErrorFirstnameLastNameAndMobile);
    } else if (_controllerFirstName.text.isEmpty &&
        _controllerLastName.text.isEmpty) {
      AppSnackBar.showSnackBar(
          text: Texts.to.contactsAddEditModalErrorFirstnameLastName);
    } else if (_controllerMobile.text.isEmpty) {
      AppSnackBar.showSnackBar(text: Texts.to.contactsAddEditModalErrorMobile);
    } else {
      _hasError.value = false;
      _providedContact = AppContactEntity(
          firstName: _controllerFirstName.text,
          lastName: _controllerLastName.text ?? '',
          mobile: _controllerMobile.text,
          phone: _controllerPhone.text ?? '',
          email: _controllerEmail.text ?? '',
          webLink: _controllerWebLink.text ?? '');
      popPage();
      appDebugPrint('AddOrEdit Contact Modal Closed');
    }
  }
}
