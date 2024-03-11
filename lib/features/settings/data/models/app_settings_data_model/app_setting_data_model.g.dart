// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingDataModelImpl _$$AppSettingDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingDataModelImpl(
      darkMode: json['darkMode'] as bool? ?? false,
      language: $enumDecodeNullable(_$AppLanguagesEnumMap, json['language']) ??
          AppLanguages.english,
      calendar:
          $enumDecodeNullable(_$AppCalendarTypesEnumMap, json['calendar']) ??
              AppCalendarTypes.christian,
    );

Map<String, dynamic> _$$AppSettingDataModelImplToJson(
        _$AppSettingDataModelImpl instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'language': _$AppLanguagesEnumMap[instance.language]!,
      'calendar': _$AppCalendarTypesEnumMap[instance.calendar]!,
    };

const _$AppLanguagesEnumMap = {
  AppLanguages.english: 'english',
  AppLanguages.deutsch: 'deutsch',
  AppLanguages.persian: 'persian',
};

const _$AppCalendarTypesEnumMap = {
  AppCalendarTypes.christian: 'christian',
  AppCalendarTypes.jalali: 'jalali',
};

_$AppSettingDataModelsListImpl _$$AppSettingDataModelsListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingDataModelsListImpl(
      appSettingsDataList: (json['appSettingsDataList'] as List<dynamic>?)
              ?.map((e) =>
                  AppSettingDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppSettingDataModel>[],
    );

Map<String, dynamic> _$$AppSettingDataModelsListImplToJson(
        _$AppSettingDataModelsListImpl instance) =>
    <String, dynamic>{
      'appSettingsDataList': instance.appSettingsDataList,
    };
