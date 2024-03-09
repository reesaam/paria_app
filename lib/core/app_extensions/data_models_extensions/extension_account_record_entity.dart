import '../../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';

extension StringProviders on AppAccountRecordEntity {
  String get getContactFullName => '${contact!.firstName ?? ''} ${contact!.lastName ?? ''}';
}

extension CompareNull on AppAccountRecordEntity? {
  bool equalTo(AppAccountRecordEntity? record) => this == null && record == null
      ? true
      : this == null || record == null
          ? false
          : this!.id == record.id;
}

extension Compare on AppAccountRecordEntity {
  bool equalTo(AppAccountRecordEntity record) => id == record.id;
}

extension ChecksNull on AppAccountRecordEntity? {
  bool get isEmpty => this == null || this!.isEmpty;
  bool get isNotEmpty => !isEmpty;
}

extension Checks on AppAccountRecordEntity {
  bool get isEmpty => contact == null && amount == null;
  bool get isNotEmpty => !isEmpty;
}
