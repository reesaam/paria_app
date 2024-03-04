import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/app/components/date_time/app_date_time_picker.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_jalali.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_locale.dart';
import 'package:paria_app/data/resources/app_enums.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/components/dialogs/app_bottom_dialogs.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_account_record_entity.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../../app/components/choose_contact_component.dart';
import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/general_widgets/app_text_field.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';

class AppContactsAddEditRecordComponent {
  AppAccountRecordEntity _providedRecord = const AppAccountRecordEntity();
  AppContactEntity? _selectedContact = const AppContactEntity();
  DateTime? _selectedDate;

  Rx<bool> _hasError = false.obs;

  //TextEditing Controllers
  final TextEditingController _controllerContact = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerDateTime = TextEditingController();
  final TextEditingController _controllerNote = TextEditingController();

  Widget _widgetAddOrEditRecordDialog() => Obx(() => Form(
          child: Column(children: [
        AppTextField(
            controller: _controllerContact,
            label: Texts.to.accountsAddEditRecordContact,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordContact),
            hasError: _hasError.value,
            icon: AppIcons.contacts.icon,
            editable: false,
            wholeWidgetAction: _chooseContact),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerDescription,
            label: Texts.to.accountsAddEditRecordDescription,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordDescription),
            textInputAction: TextInputAction.next,
            icon: AppIcons.description.icon),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerAmount,
            label: Texts.to.accountsAddEditRecordAmount,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordAmount),
            hasError: _hasError.value,
            textInputAction: TextInputAction.next,
            icon: AppIcons.currency.icon),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerDateTime,
            label: Texts.to.accountsAddEditRecordDate,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordDate),
            icon: AppIcons.dateTime.icon,
            textInputAction: TextInputAction.next,
            editable: false,
            suffixAction: _chooseDate),
        AppSpaces.h10,
        AppTextField(
            controller: _controllerNote,
            label: Texts.to.accountsAddEditRecordNote,
            hint: _hintGenerator(Texts.to.accountsAddEditRecordNote),
            textInputAction: TextInputAction.done,
            icon: AppIcons.note.icon),
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
        _controllerDescription.text = record.description ?? '';
        _controllerAmount.text = record.amount.toCurrency ?? '';
        _controllerDateTime.text =
            record.date?.toLocal().toDateTimeFormat ?? '';
      }
    }

    await AppBottomDialogs().withOkCancel(
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
      AppSnackBar()
          .showSnackBar(message: Texts.to.accountsAddEditModalErrorContact);
    } else if (_controllerContact.text.isEmpty) {
      AppSnackBar().showSnackBar(
          message: Texts.to.contactsAddEditModalErrorFirstnameLastName);
    } else if (_controllerAmount.text.isEmpty) {
      AppSnackBar()
          .showSnackBar(message: Texts.to.accountsAddEditModalErrorAmount);
    } else {
      _hasError.value = false;
      _providedRecord = AppAccountRecordEntity(
          contact: _selectedContact,
          description: _controllerDescription.text ?? '',
          amount: int.tryParse(_controllerAmount.text.replaceAll(',', '')) ?? 0,
          date: _selectedDate);
      popPage();
      appDebugPrint('AddOrEdit Record Modal Closed');
    }
  }

  _chooseContact() async {
    _selectedContact = await ChooseContactComponent().chooseContact();
    _controllerContact.text = _selectedContact?.getContactFullName ?? '';
  }

  _chooseDate() async {
    AppCalendarTypes defaultCalendarType = AppCalendarTypes.christian;
    _selectedDate =
        await AppDateTimePicker().datePicker(calendarType: defaultCalendarType);
    if (_selectedDate != null) {
      _controllerDateTime.text = _selectedDate.toDateFormat;
    }
  }
}
