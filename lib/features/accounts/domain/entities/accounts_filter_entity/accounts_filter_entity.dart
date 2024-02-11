import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contacts/domain/entities/contact_entity/contact_entity.dart';

part 'accounts_filter_entity.freezed.dart';
part 'accounts_filter_entity.g.dart';

@unfreezed
class AppAccountsFilterEntity with _$AppAccountsFilterEntity {
  const factory AppAccountsFilterEntity({
    final AppContactEntity? contact,
    final int? amountUp,
    final int? amountDown,
    final DateTime? dateTimeUp,
    final DateTime? dateTimeDown,
    final String? description,
  }) = _AppAccountsFilterEntity;

  factory AppAccountsFilterEntity.fromJson(Map<String, dynamic> json) =>
      _$AppAccountsFilterEntityFromJson(json);
}

@unfreezed
class AppAccountsFilterEntitiesList with _$AppAccountsFilterEntitiesList {
  factory AppAccountsFilterEntitiesList({
    @Default(<AppAccountsFilterEntity>[]) List<AppAccountsFilterEntity> filtersList
  }) = _AppAccountsFilterEntitiesList;

  factory AppAccountsFilterEntitiesList.fromJson(Map<String, dynamic> json) =>
      _$AppAccountsFilterEntitiesListFromJson(json);
}