import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contacts/data/models/contact_model/contact_model.dart';

part 'account_balance_model.freezed.dart';
part 'account_balance_model.g.dart';

@freezed
class AppAccountBalanceModel with _$AppAccountBalanceModel {
  const factory AppAccountBalanceModel({
    final AppContactModel? contact,
    final int? balance,
    final int? count,
  }) = _AppAccountBalanceModel;

  factory AppAccountBalanceModel.fromJson(Map<String, dynamic> json) => _$AppAccountBalanceModelFromJson(json);
}

@unfreezed
class AppAccountBalanceModelsList with _$AppAccountBalanceModelsList {
  factory AppAccountBalanceModelsList({@Default(<AppAccountBalanceModel>[]) List<AppAccountBalanceModel> balancesList}) = _AppAccountBalanceModelsList;

  factory AppAccountBalanceModelsList.fromJson(Map<String, dynamic> json) => _$AppAccountBalanceModelsListFromJson(json);
}
