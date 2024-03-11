// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingDataEntityImpl _$$AppSettingDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingDataEntityImpl(
      darkMode: json['darkMode'] as bool? ?? false,
      language: $enumDecodeNullable(_$AppLanguagesEnumMap, json['language']) ??
          AppLanguages.english,
      calendar:
          $enumDecodeNullable(_$AppCalendarTypesEnumMap, json['calendar']) ??
              AppCalendarTypes.christian,
    );

Map<String, dynamic> _$$AppSettingDataEntityImplToJson(
        _$AppSettingDataEntityImpl instance) =>
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

_$AppSettingDataEntitiesListImpl _$$AppSettingDataEntitiesListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingDataEntitiesListImpl(
      appSettingsDataList: (json['appSettingsDataList'] as List<dynamic>?)
              ?.map((e) =>
                  AppSettingDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppSettingDataEntity>[],
    );

Map<String, dynamic> _$$AppSettingDataEntitiesListImplToJson(
        _$AppSettingDataEntitiesListImpl instance) =>
    <String, dynamic>{
      'appSettingsDataList': instance.appSettingsDataList,
    };
