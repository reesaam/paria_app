import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/resources/app_enums.dart';

part 'app_setting_data_entity.freezed.dart';
part 'app_setting_data_entity.g.dart';

@freezed
class AppSettingDataEntity with _$AppSettingData {
  const factory AppSettingDataEntity({
    final bool? darkMode,
    final AppLanguages? language,
  }) = AppSettingDataEntity;

  factory AppSettingDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AppSettingDataEntityFromJson(json);
}

@freezed
class AppSettingDataEntitiesList with _$AppSettingDataEntitiesList {
  factory AppSettingDataEntitiesList({
    @Default(<AppSettingDataEntity>[]) List<AppSettingDataEntity> appSettingsDataList
  }) = _AppSettingDataEntitiesList;

  factory AppSettingDataEntitiesList.fromJson(Map<String, dynamic> json) =>
      _$AppSettingDataEntitiesListFromJson(json);
}