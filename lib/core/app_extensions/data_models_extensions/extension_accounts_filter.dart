import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_contact.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../../features/accounts/domain/entities/accounts_filter_entity/accounts_filter_entity.dart';

extension CompareNull on AppAccountsFilterEntity? {
  bool equalTo(AppAccountsFilterEntity? filter) => this == null && filter == null
      ? true
      : this == null || filter == null
          ? false
          : this!.contact.equalTo(filter.contact) &&
              this!.description == filter.description &&
              this!.amountUp == filter.amountUp &&
              this!.amountDown == filter.amountDown &&
              this!.dateTimeUp!.equalTo(filter.dateTimeUp!) &&
              this!.dateTimeDown!.equalTo(filter.dateTimeDown!);
}

extension Compare on AppAccountsFilterEntity {
  bool equalTo(AppAccountsFilterEntity? filter) => filter == null
      ? false
      : contact.equalTo(filter.contact) &&
          description == filter.description &&
          amountUp == filter.amountUp &&
          amountDown == filter.amountDown &&
          dateTimeUp.equalTo(filter.dateTimeUp) &&
          dateTimeDown.equalTo(filter.dateTimeDown);
}

extension RxChecksNull on Rx<AppAccountsFilterEntity?> {
  bool get isEmpty => value == null ? true : value.equalTo(const AppAccountsFilterEntity());
}

extension RxChecks on Rx<AppAccountsFilterEntity> {
  bool get isEmpty => value.equalTo(const AppAccountsFilterEntity());
}

extension Checks on AppAccountsFilterEntity {
  bool get isEmpty => equalTo(const AppAccountsFilterEntity());
}

extension RxActions on Rx<AppAccountsFilterEntity> {
  AppAccountsFilterEntity get clear => value = const AppAccountsFilterEntity();
}
