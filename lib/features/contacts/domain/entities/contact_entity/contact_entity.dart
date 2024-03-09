import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_entity.freezed.dart';
part 'contact_entity.g.dart';

@freezed
class AppContactEntity with _$AppContactEntity {
  const factory AppContactEntity({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? mobile,
    final String? phone,
    final String? email,
    final String? webLink,
    final String? profilePicture,
    final int? accountRecordsCounter,
    final int? balance,
  }) = _AppContactEntity;

  factory AppContactEntity.fromJson(Map<String, dynamic> json) => _$AppContactEntityFromJson(json);
}

@unfreezed
class AppContactEntitiesList with _$AppContactEntitiesList {
  factory AppContactEntitiesList({
    @Default(<AppContactEntity>[]) List<AppContactEntity> contactsList,
  }) = _AppContactEntitiesList;

  factory AppContactEntitiesList.fromJson(Map<String, dynamic> json) => _$AppContactEntitiesListFromJson(json);
}
