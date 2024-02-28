import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contacts/data/models/contact_model/contact_model.dart';

part 'account_record_model.freezed.dart';
part 'account_record_model.g.dart';

@freezed
class AppAccountRecordModel with _$AppAccountRecordModel {
  const factory AppAccountRecordModel({
    final String? id,
    final AppContactModel? contact,
    final int? amount,
    final String? description,
    final DateTime? dateTime,
    final bool? cleared,
  }) = _AppAccountRecordModel;

  factory AppAccountRecordModel.fromJson(Map<String, dynamic> json) =>
      _$AppAccountRecordModelFromJson(json);
}

@unfreezed
class AppAccountRecordModelsList with _$AppAccountRecordModelsList {
  factory AppAccountRecordModelsList({
    @Default(<AppAccountRecordModel>[]) List<AppAccountRecordModel> recordsList
  }) = _AppAccountRecordModelsList;

  factory AppAccountRecordModelsList.fromJson(Map<String, dynamic> json) =>
      _$AppAccountRecordModelsListFromJson(json);
}