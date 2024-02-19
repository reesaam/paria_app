// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingDataImpl _$$AppSettingDataImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingDataImpl(
      darkMode: json['darkMode'] as bool? ?? false,
      language: $enumDecodeNullable(_$AppLanguagesEnumMap, json['language']) ??
          AppLanguages.english,
    );

Map<String, dynamic> _$$AppSettingDataImplToJson(
        _$AppSettingDataImpl instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'language': _$AppLanguagesEnumMap[instance.language],
    };

const _$AppLanguagesEnumMap = {
  AppLanguages.english: 'english',
  AppLanguages.deutsch: 'deutsch',
  AppLanguages.persian: 'persian',
};

_$AppSettingsDataListImpl _$$AppSettingsDataListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsDataListImpl(
      appSettingsDataList: (json['appSettingsDataList'] as List<dynamic>?)
              ?.map((e) => AppSettingData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppSettingData>[],
    );

Map<String, dynamic> _$$AppSettingsDataListImplToJson(
        _$AppSettingsDataListImpl instance) =>
    <String, dynamic>{
      'appSettingsDataList': instance.appSettingsDataList,
    };
