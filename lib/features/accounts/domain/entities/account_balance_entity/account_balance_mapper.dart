import 'package:paria_app/features/contacts/domain/entities/contact_entity/contacts_mapper.dart';

import '../../../data/models/account_balance_model/account_balance_model.dart';
import 'account_balance_entity.dart';

extension OnAppAccountBalanceEntity on AppAccountBalanceEntity {
  AppAccountBalanceModel get mapper => AppAccountBalanceModel(
      contact: contact.mapper, balance: balance, count: count);
}

extension OnAppAccountBalanceModel on AppAccountBalanceModel {
  AppAccountBalanceEntity get mapper => AppAccountBalanceEntity(
      contact: contact.mapper, balance: balance, count: count);
}

extension OnAppAccountBalanceEntityNull on AppAccountBalanceEntity? {
  AppAccountBalanceModel get mapper =>
      this?.mapper ?? const AppAccountBalanceModel();
}

extension OnAppAccountBalanceModelNull on AppAccountBalanceModel? {
  AppAccountBalanceEntity get mapper =>
      this?.mapper ?? const AppAccountBalanceEntity();
}
