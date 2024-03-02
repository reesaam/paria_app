import 'dart:async';

import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_balance_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contacts_entity_list.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../domain/entities/account_balance_entity/account_balance_entity.dart';
import '../widgets/contacts_balance_detail_form.dart';

class ContactsBalanceController extends CoreController {
  Rx<AppAccountBalanceEntitiesList> listBalances =
      AppAccountBalanceEntitiesList().obs;

  @override
  void dataInit() {
    // clearAppData();
    _generateListBalances();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.contactsBalance;
  }

  @override
  void onCloseFunction() {
    saveAppData();
  }

  _generateListBalances() {
    AppContactEntitiesList contacts = AppContactEntitiesList().loadFromStorage;
    List<AppAccountBalanceEntity> balances =
        List<AppAccountBalanceEntity>.empty(growable: true);
    for (var contact in contacts.contactsList) {
      balances.add(contact.calculateBalance(false));
    }
    listBalances.value = AppAccountBalanceEntitiesList(balancesList: balances);
    appDebugPrint('${listBalances.count} Balances Generated.');
  }

  itemDetailsDialog(AppAccountBalanceEntity balance) async =>
      await AppDialogs().appBottomDialogWithOk(
          dismissible: true,
          title: Texts.to.contactsBalanceItemDetailsDialogTitle,
          form: ContactsBalanceItemDetailForm(balance: balance),
          onTapOk: popPage);
}
