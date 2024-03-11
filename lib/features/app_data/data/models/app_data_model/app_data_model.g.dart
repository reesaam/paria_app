// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppDataModelImpl _$$AppDataModelImplFromJson(Map<String, dynamic> json) =>
    _$AppDataModelImpl(
      appDataVersion:
          $enumDecodeNullable(_$AppDataVersionsEnumMap, json['appDataVersion']),
      appVersion: json['appVersion'] == null
          ? null
          : AppVersion.fromJson(json['appVersion'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : AppSettingDataModel.fromJson(
              json['settings'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : AppContactModelsList.fromJson(
              json['contacts'] as Map<String, dynamic>),
      accounts: json['accounts'] == null
          ? null
          : AppAccountRecordModelsList.fromJson(
              json['accounts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppDataModelImplToJson(_$AppDataModelImpl instance) =>
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
