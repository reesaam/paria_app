import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paria_app/data/resources/app_enums.dart';

import '../../../../features/accounts/domain/entities/account_balance_entity/account_balance_entity.dart';
import '../../../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';

part 'app_data_entity.freezed.dart';
part 'app_data_entity.g.dart';

@freezed
class AppDataEntity with _$AppDataEntity {
  const factory AppDataEntity({
    final AppDataVersions? version,
    final AppSettingDataEntity? appSettings,
    final AppContactEntitiesList? contacts,
    final AppAccountBalanceEntitiesList? accounts
  }) = _AppDataEntity;

  factory AppDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AppDataEntityFromJson(json);
}