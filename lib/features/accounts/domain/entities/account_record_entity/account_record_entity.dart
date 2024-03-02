import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contacts/domain/entities/contact_entity/contact_entity.dart';

part 'account_record_entity.freezed.dart';
part 'account_record_entity.g.dart';

@freezed
class AppAccountRecordEntity with _$AppAccountRecordEntity {
  const factory AppAccountRecordEntity({
    final String? id,
    final AppContactEntity? contact,
    final int? amount,
    final String? description,
    final DateTime? dateTime,
    final String? note,
    final bool? cleared,
  }) = _AppAccountRecordEntity;

  factory AppAccountRecordEntity.fromJson(Map<String, dynamic> json) =>
      _$AppAccountRecordEntityFromJson(json);
}

@unfreezed
class AppAccountRecordEntitiesList with _$AppAccountRecordEntitiesList {
  factory AppAccountRecordEntitiesList({
    @Default(<AppAccountRecordEntity>[]) List<AppAccountRecordEntity> recordsList
  }) = _AppAccountRecordEntitiesList;

  factory AppAccountRecordEntitiesList.fromJson(Map<String, dynamic> json) =>
      _$AppAccountRecordEntitiesListFromJson(json);
}