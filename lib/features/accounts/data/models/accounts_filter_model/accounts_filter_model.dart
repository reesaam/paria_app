import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contacts/data/models/contact_model/contact_model.dart';

part 'accounts_filter_model.freezed.dart';
part 'accounts_filter_model.g.dart';

@freezed
class AppAccountsFilterModel with _$AppAccountsFilterModel {
  const factory AppAccountsFilterModel({
    final bool? cleared,
    final bool? positives,
    final bool? negatives,
    final AppContactModel? contact,
    final int? amountUp,
    final int? amountDown,
    final DateTime? dateTimeUp,
    final DateTime? dateTimeDown,
    final String? description,
  }) = _AppAccountsFilterModel;

  factory AppAccountsFilterModel.fromJson(Map<String, dynamic> json) => _$AppAccountsFilterModelFromJson(json);
}

@unfreezed
class AppAccountsFilterModelsList with _$AppAccountsFilterModelsList {
  factory AppAccountsFilterModelsList({@Default(<AppAccountsFilterModel>[]) List<AppAccountsFilterModel> filtersList}) = _AppAccountsFilterModelsList;

  factory AppAccountsFilterModelsList.fromJson(Map<String, dynamic> json) => _$AppAccountsFilterModelsListFromJson(json);
}
