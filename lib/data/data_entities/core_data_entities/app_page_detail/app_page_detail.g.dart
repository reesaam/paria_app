// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_page_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPageDetailImpl _$$AppPageDetailImplFromJson(Map<String, dynamic> json) =>
    _$AppPageDetailImpl(
      pageRoute: $enumDecode(_$AppRoutesEnumMap, json['pageRoute']),
      pageName: json['pageName'] as String?,
      bottomBarItemNumber: json['bottomBarItemNumber'] as int?,
      drawerPresence: json['drawerPresence'] as bool?,
      iconCode: json['iconCode'] as int?,
    );

Map<String, dynamic> _$$AppPageDetailImplToJson(_$AppPageDetailImpl instance) =>
    <String, dynamic>{
      'pageRoute': _$AppRoutesEnumMap[instance.pageRoute]!,
      'pageName': instance.pageName,
      'bottomBarItemNumber': instance.bottomBarItemNumber,
      'drawerPresence': instance.drawerPresence,
      'iconCode': instance.iconCode,
    };

const _$AppRoutesEnumMap = {
  AppRoutes.splashScreen: 'splashScreen',
  AppRoutes.homepage: 'homepage',
  AppRoutes.settings: 'settings',
  AppRoutes.update: 'update',
  AppRoutes.about: 'about',
  AppRoutes.notFound: 'notFound',
  AppRoutes.adminStartPage: 'adminStartPage',
  AppRoutes.adminTestPage: 'adminTestPage',
  AppRoutes.adminUITestPagePage: 'adminUITestPagePage',
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
