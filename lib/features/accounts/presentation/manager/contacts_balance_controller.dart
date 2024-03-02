import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_entity_list.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';
import '../widgets/contacts_balance_detail_form.dart';

class ContactsBalanceController extends CoreController {
  Rx<AppContactEntitiesList> listContacts = AppContactEntitiesList().obs;
  Rx<AppAccountRecordEntitiesList> listRecords =
      AppAccountRecordEntitiesList().obs;

  @override
  void dataInit() {
    // clearAppData();
    listContacts.value = AppContactEntitiesList().loadFromStorage;
    listRecords.value = AppAccountRecordEntitiesList().loadFromStorage;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.contactsBalance;
  }

  @override
  void onCloseFunction() {
    saveAppData();
  }

  itemDetailsDialog(AppContactEntity contact) async {
    AppAccountRecordEntitiesList contactRecords = AppAccountRecordEntitiesList(
        recordsList: listRecords.getContactRecords(contact, false));
    contactRecords.sortByAmountDec;
    await AppDialogs().appBottomDialogWithOk(
        dismissible: true,
        title: Texts.to.contactsBalanceItemDetailsDialogTitle,
        form: ContactsBalanceItemDetailForm(contactRecords: contactRecords),
        onTapOk: popPage);
  }
}
