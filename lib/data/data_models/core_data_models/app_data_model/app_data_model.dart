import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import '../../../../features/contacts/domain/entities/contact_entity/contact_entity.dart';
import '../../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../../../resources/app_enums.dart';

part 'app_data_model.freezed.dart';
part 'app_data_model.g.dart';

@freezed
class AppDataModel with _$AppDataModel {
  const factory AppDataModel({
    final AppDataVersions? version,
    final String? appVersion,
    final AppSettingDataEntity? settings,
    final AppContactEntitiesList? contacts,
    final AppAccountRecordEntitiesList? accounts,
  }) = _AppDataModel;

  factory AppDataModel.fromJson(Map<String, dynamic> json) =>
      _$AppDataModelFromJson(json);
}