import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/data_entities/core_data_entities/app_version/app_version.dart';
import '../../../../../data/resources/app_enums.dart';
import '../../../../accounts/data/models/account_record_model/account_record_model.dart';
import '../../../../contacts/data/models/contact_model/contact_model.dart';
import '../../../../settings/data/models/app_settings_data_model/app_setting_data_model.dart';

part 'app_data_model.freezed.dart';
part 'app_data_model.g.dart';

@freezed
class AppDataModel with _$AppDataModel {
  const factory AppDataModel({
    final AppDataVersions? appDataVersion,
    final AppVersion? appVersion,
    final AppSettingDataModel? settings,
    final AppContactModelsList? contacts,
    final AppAccountRecordModelsList? accounts,
  }) = _AppDataModel;

  factory AppDataModel.fromJson(Map<String, dynamic> json) => _$AppDataModelFromJson(json);
}
