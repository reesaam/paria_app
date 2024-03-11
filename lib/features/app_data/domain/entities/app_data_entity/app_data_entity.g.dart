// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppDataEntityImpl _$$AppDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$AppDataEntityImpl(
      appDataVersion:
          $enumDecodeNullable(_$AppDataVersionsEnumMap, json['appDataVersion']),
      appVersion: json['appVersion'] == null
          ? null
          : AppVersion.fromJson(json['appVersion'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : AppSettingDataEntity.fromJson(
              json['settings'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : AppContactEntitiesList.fromJson(
              json['contacts'] as Map<String, dynamic>),
      accounts: json['accounts'] == null
          ? null
          : AppAccountRecordEntitiesList.fromJson(
              json['accounts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppDataEntityImplToJson(_$AppDataEntityImpl instance) =>
    <String, dynamic>{
      'appDataVersion': _$AppDataVersionsEnumMap[instance.appDataVersion],
      'appVersion': instance.appVersion,
      'settings': instance.settings,
      'contacts': instance.contacts,
      'accounts': instance.accounts,
    };

const _$AppDataVersionsEnumMap = {
  AppDataVersions.v1: 'v1',
  AppDataVersions.v2: 'v2',
};
