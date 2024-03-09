import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class AppContactModel with _$AppContactModel {
  const factory AppContactModel({
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
  }) = _AppContactModel;

  factory AppContactModel.fromJson(Map<String, dynamic> json) => _$AppContactModelFromJson(json);
}

@unfreezed
class AppContactModelsList with _$AppContactModelsList {
  factory AppContactModelsList({
    @Default(<AppContactModel>[]) List<AppContactModel> contactsList,
  }) = _AppContactModelsList;

  factory AppContactModelsList.fromJson(Map<String, dynamic> json) => _$AppContactModelsListFromJson(json);
}
