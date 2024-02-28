import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/resources/app_enums.dart';

part 'app_setting_data_model.freezed.dart';
part 'app_setting_data_model.g.dart';

@freezed
class AppSettingDataModel with _$AppSettingDataModel {
  const factory AppSettingDataModel({
    @Default(false) bool darkMode,
    @Default(AppLanguages.english) AppLanguages language,
    @Default(AppCalendarTypes.christian) AppCalendarTypes calendar,
  }) = _AppSettingDataModel;

  factory AppSettingDataModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingDataModelFromJson(json);
}

@unfreezed
class AppSettingDataModelsList with _$AppSettingDataModelsList {
  factory AppSettingDataModelsList({
    @Default(<AppSettingDataModel>[]) List<AppSettingDataModel> appSettingsDataList
  }) = _AppSettingDataModelsList;

  factory AppSettingDataModelsList.fromJson(Map<String, dynamic> json) =>
      _$AppSettingDataModelsListFromJson(json);
}