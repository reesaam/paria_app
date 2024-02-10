// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_page_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPageDetailImpl _$$AppPageDetailImplFromJson(Map<String, dynamic> json) =>
    _$AppPageDetailImpl(
      pageName: json['pageName'] as String?,
      pageRoute: json['pageRoute'] as String?,
      bottomBarItemNumber: json['bottomBarItemNumber'] as int?,
    );

Map<String, dynamic> _$$AppPageDetailImplToJson(_$AppPageDetailImpl instance) =>
    <String, dynamic>{
      'pageName': instance.pageName,
      'pageRoute': instance.pageRoute,
      'bottomBarItemNumber': instance.bottomBarItemNumber,
    };

_$AppPageDetailsListImpl _$$AppPageDetailsListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppPageDetailsListImpl(
      pageDetailsList: (json['pageDetailsList'] as List<dynamic>?)
              ?.map((e) => AppPageDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppPageDetail>[],
    );

Map<String, dynamic> _$$AppPageDetailsListImplToJson(
        _$AppPageDetailsListImpl instance) =>
    <String, dynamic>{
      'pageDetailsList': instance.pageDetailsList,
    };
