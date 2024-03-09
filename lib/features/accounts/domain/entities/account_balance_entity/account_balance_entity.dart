import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contacts/domain/entities/contact_entity/contact_entity.dart';
import '../account_record_entity/account_record_entity.dart';

part 'account_balance_entity.freezed.dart';
part 'account_balance_entity.g.dart';

@freezed
class AppAccountBalanceEntity with _$AppAccountBalanceEntity {
  const factory AppAccountBalanceEntity({
    final AppContactEntity? contact,
    final List<AppAccountRecordEntity>? records,
    final int? balance,
    final int? count,
  }) = _AppAccountBalanceEntity;

  factory AppAccountBalanceEntity.fromJson(Map<String, dynamic> json) => _$AppAccountBalanceEntityFromJson(json);
}

@unfreezed
class AppAccountBalanceEntitiesList with _$AppAccountBalanceEntitiesList {
  factory AppAccountBalanceEntitiesList({@Default(<AppAccountBalanceEntity>[]) List<AppAccountBalanceEntity> balancesList}) = _AppAccountBalanceEntitiesList;

  factory AppAccountBalanceEntitiesList.fromJson(Map<String, dynamic> json) => _$AppAccountBalanceEntitiesListFromJson(json);
}
