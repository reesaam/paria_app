// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppDataImpl _$$AppDataImplFromJson(Map<String, dynamic> json) =>
    _$AppDataImpl(
      setting: json['setting'] == null
          ? null
          : AppSettingData.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppDataImplToJson(_$AppDataImpl instance) =>
    <String, dynamic>{
      'setting': instance.setting,
    };
