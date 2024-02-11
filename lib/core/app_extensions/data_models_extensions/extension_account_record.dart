import '../../../../../core/app_extensions/data_models_extensions/extension_contact.dart';
import '../../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';

extension StringProviders on AppAccountRecordEntity {
  String get getContactFullName =>
      '${contact!.firstName ?? ''} ${contact!.lastName ?? ''}';
}

extension CompareNull on AppAccountRecordEntity? {
  bool equalTo(AppAccountRecordEntity? record) => this == null && record == null
      ? true
      : this == null || record == null
          ? false
          : this!.contact.equalTo(record.contact) &&
              this!.title == record.title &&
              this!.amount == record.amount &&
              this!.dateTime.equalTo(record.dateTime) &&
              this!.cleared == record.cleared;
}

extension Compare on AppAccountRecordEntity {
  bool equalTo(AppAccountRecordEntity record) => id == record.id;
}

extension ChecksNull on AppAccountRecordEntity? {
  bool get isEmpty =>
      this == null ? true : equalTo(const AppAccountRecordEntity());
}

extension Checks on AppAccountRecordEntity {
  bool get isEmpty => equalTo(const AppAccountRecordEntity());
}
