import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../features/accounts/domain/entities/accounts_filter_entity/accounts_filter_entity.dart';

extension CompareNull on AppAccountsFilterEntity? {
  bool equalTo(AppAccountsFilterEntity? filter) =>
      this == null && filter == null
          ? true
          : this == null || filter == null
              ? false
              : this!.equalTo(filter);
}

extension Compare on AppAccountsFilterEntity {
  bool equalTo(AppAccountsFilterEntity? filter) => filter == null
      ? false
      : contact.equalTo(filter.contact) &&
          cleared == filter.cleared &&
          positives == filter.positives &&
          negatives == filter.negatives &&
          amountUp == filter.amountUp &&
          amountDown == filter.amountDown &&
          dateTimeUp.equalTo(filter.dateTimeUp) &&
          dateTimeDown.equalTo(filter.dateTimeDown);
}

extension RxChecksNull on Rx<AppAccountsFilterEntity?> {
  bool get isEmpty =>
      value == null ? true : value.equalTo(const AppAccountsFilterEntity());
  bool get isNotEmpty => !isEmpty;
}

extension RxChecks on Rx<AppAccountsFilterEntity> {
  bool get isEmpty => value.equalTo(const AppAccountsFilterEntity());
  bool get isNotEmpty => !isEmpty;
}

extension ChecksNull on AppAccountsFilterEntity? {
  bool get isEmpty => this == null ? true : equalTo(const AppAccountsFilterEntity());
  bool get isNotEmpty => !isEmpty;
}

extension Checks on AppAccountsFilterEntity {
  bool get isEmpty => equalTo(const AppAccountsFilterEntity());
  bool get isNotEmpty => !isEmpty;
}

extension RxActions on Rx<AppAccountsFilterEntity> {
  AppAccountsFilterEntity get clear => value = const AppAccountsFilterEntity();
}
