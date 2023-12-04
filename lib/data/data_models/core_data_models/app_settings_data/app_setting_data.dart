import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting_data.freezed.dart';
part 'app_setting_data.g.dart';

@freezed
class AppSettingData with _$AppSettingData {
  const factory AppSettingData({
    final bool? darkMode,
  }) = _AppSettingData;

  factory AppSettingData.fromJson(Map<String, dynamic> json) =>
      _$AppSettingDataFromJson(json);
}

@freezed
class AppSettingsDataList with _$AppSettingsDataList {
  factory AppSettingsDataList({
    @Default(<AppSettingData>[]) List<AppSettingData> appSettingsDataList
  }) = _AppSettingsDataList;

  factory AppSettingsDataList.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsDataListFromJson(json);
}