import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/app/components/choose_contact_component.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_record.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_date_time.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/general_widgets/app_text_field.dart';
import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';

class AppContactsAddEditRecordComponent {
  AppAccountRecordEntity _providedRecord = const AppAccountRecordEntity();
  AppContactEntity? _selectedContact = const AppContactEntity();
  DateTime _dateTime = DateTime.now();

  Rx<bool> _hasError = false.obs;

  //TextEditing Controllers
  final TextEditingController _controllerContact = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerDateTime = TextEditingController();

  Widget _widgetAddOrEditRecordDialog() => Obx(() => Form(
          child: Column(children: [
        AppTextField(
            controller: _controllerContact,
            label: Texts.to.accountsAddEditRecordContact,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordContact),
            hasError: _hasError.value,
            icon: AppIcons.contacts.icon,
            suffixAction: _chooseContact),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerDescription,
            label: Texts.to.accountsAddEditRecordDescription,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordDescription),
            icon: AppIcons.accounts.icon),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerAmount,
            label: Texts.to.accountsAddEditRecordAmount,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordAmount),
            hasError: _hasError.value,
            icon: AppIcons.mobile.icon),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerDateTime,
            label: Texts.to.accountsAddEditRecordDateTime,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordDateTime),
            icon: AppIcons.phone.icon,
            suffixAction: _chooseDateTime,
            editable: false),
      ])));

  _hintGenerator(String text) => 'Enter $text';

  Future<AppAccountRecordEntity?> call(
      {required bool isEdit, AppAccountRecordEntity? record}) async {
    String title = isEdit
        ? Texts.to.accountsAddContactTitle
        : Texts.to.accountsEditContactTitle;

    if (isEdit) {
      if (record == null) {
      } else {
        _selectedContact = record.contact;
        _controllerContact.text = record.contact?.firstName ?? '';
        _controllerDescription.text = record.title ?? '';
        _controllerAmount.text = record.amount.toCurrency ?? '';
        _controllerDateTime.text =
            record.dateTime?.toLocal().toDateTimeFormat ?? '';
      }
    }

    await AppDialogs().appBottomDialogWithOkCancel(
        title: title,
        form: _widgetAddOrEditRecordDialog(),
        onTapOk: _provideRecord,
        dismissible: true);

    _providedRecord.isNotEmpty
        ? _providedRecord = _providedRecord.copyWith(
            id: isEdit ? record?.id : const Uuid().v1())
        : null;
    return _providedRecord;
  }

  _provideRecord() {
    _hasError.value = true;
    if (_controllerContact.text.isEmpty && _controllerAmount.text.isEmpty) {
      AppSnackBar.showSnackBar(text: Texts.to.accountsAddEditModalErrorContact);
    } else if (_controllerContact.text.isEmpty) {
      AppSnackBar.showSnackBar(
          text: Texts.to.contactsAddEditModalErrorFirstnameLastName);
    } else if (_controllerAmount.text.isEmpty) {
      AppSnackBar.showSnackBar(text: Texts.to.accountsAddEditModalErrorAmount);
    } else {
      _hasError.value = false;
      _providedRecord = AppAccountRecordEntity(
          contact: _selectedContact,
          title: _controllerDescription.text ?? '',
          amount: int.tryParse(_controllerAmount.text.replaceAll(',', '')) ?? 0,
          dateTime: _dateTime);
      popPage();
      appDebugPrint('AddOrEdit Record Modal Closed');
    }
  }

  _chooseContact() async {
    _selectedContact = await ChooseContactComponent().chooseContact();
    _controllerContact.text = _selectedContact?.getContactFullName ?? '';
  }

  ///TODO: DateTime Picker Implementation
  _chooseDateTime() async {}
}
