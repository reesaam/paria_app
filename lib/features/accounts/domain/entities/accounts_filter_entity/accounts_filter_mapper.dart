import '../../../../../features/contacts/domain/entities/contact_entity/contacts_mapper.dart';
import '../../../data/models/accounts_filter_model/accounts_filter_model.dart';
import 'accounts_filter_entity.dart';

extension OnAppAccountsFilterEntity on AppAccountsFilterEntity {
  AppAccountsFilterModel get mapper => AppAccountsFilterModel(
      cleared: cleared,
      positives: positives,
      negatives: negatives,
      contact: contact.mapper,
      amountUp: amountUp,
      amountDown: amountDown,
      dateTimeUp: dateTimeUp,
      dateTimeDown: dateTimeDown,
      description: description);
}

extension OnAppAccountsFilterModel on AppAccountsFilterModel {
  AppAccountsFilterEntity get mapper => AppAccountsFilterEntity(
      cleared: cleared,
      positives: positives,
      negatives: negatives,
      contact: contact.mapper,
      amountUp: amountUp,
      amountDown: amountDown,
      dateTimeUp: dateTimeUp,
      dateTimeDown: dateTimeDown);
}

extension OnAppAccountsFilterEntityNull on AppAccountsFilterEntity? {
  AppAccountsFilterModel get mapper =>
      this?.mapper ?? const AppAccountsFilterModel();
}

extension OnAppAccountsFilterModelNull on AppAccountsFilterModel? {
  AppAccountsFilterEntity get mapper =>
      this?.mapper ?? const AppAccountsFilterEntity();
}
