import '../../../../../core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import '../../../features/accounts/domain/entities/account_balance_entity/account_balance_entity.dart';
import '../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../../features/contacts/domain/entities/contact_entity/contact_entity.dart';

extension Accounts on AppContactEntity {
  AppAccountBalanceEntity calculateBalance(bool clearedIncluded) {
    int balance = 0;
    int count = 0;

    AppAccountRecordEntitiesList records =
        AppAccountRecordEntitiesList().loadFromStorage;
    for (AppAccountRecordEntity record in records.recordsList) {
      if (record.contact.equalTo(this)) {
        clearedIncluded
            ? {balance += record.amount!, count++}
            : record.cleared != true
                ? null
                : {balance += record.amount!, count++};
      }
    }
    return AppAccountBalanceEntity(
        contact: this, balance: balance, count: count);
  }
}

extension StringProviders on AppContactEntity {
  String get getContactFullName => '${firstName ?? ''} ${lastName ?? ''}';
  String get getContactInitials =>
      '${firstName!.isEmpty ? '' : firstName![0]}${lastName!.isEmpty ? '' : lastName![0]}';
}

extension CompareNull on AppContactEntity? {
  bool equalTo(AppContactEntity? contact) => this == null && contact == null
      ? true
      : this == null || contact == null
          ? false
          : this!.id == contact.id;
}

extension Compare on AppContactEntity {
  bool equalTo(AppContactEntity? contact) =>
      contact == null ? false : id == contact.id;
}

extension ChecksNull on AppContactEntity? {
  bool get isEmpty => this == null ? true : this!.isEmpty;
  bool get isNotEmpty => !isEmpty;
}

extension Checks on AppContactEntity {
  bool get isEmpty => firstName == null && lastName == null && mobile == null;
  bool get isNotEmpty => !isEmpty;
}
