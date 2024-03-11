// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVersionImpl _$$AppVersionImplFromJson(Map<String, dynamic> json) =>
    _$AppVersionImpl(
      version: json['version'] as String,
      changes:
          (json['changes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      released: json['released'] as bool?,
    );

Map<String, dynamic> _$$AppVersionImplToJson(_$AppVersionImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'changes': instance.changes,
      'released': instance.released,
    };

_$AppVersionsListImpl _$$AppVersionsListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppVersionsListImpl(
      versionsList: (json['versionsList'] as List<dynamic>?)
              ?.map((e) => AppVersion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppVersion>[],
    );

Map<String, dynamic> _$$AppVersionsListImplToJson(
        _$AppVersionsListImpl instance) =>
    <String, dynamic>{
      'versionsList': instance.versionsList,
    };
