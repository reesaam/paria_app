import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_page_detail.freezed.dart';
part 'app_page_detail.g.dart';

@freezed
class AppPageDetail with _$AppPageDetail {
  const factory AppPageDetail({
    required final String pageName,
    required final String pageRoute,
    final int? bottomBarItemNumber,
  }) = _AppPageDetail;

  factory AppPageDetail.fromJson(Map<String, dynamic> json) =>
      _$AppPageDetailFromJson(json);
}

@freezed
class AppPageDetailsList with _$AppPageDetailsList {
  factory AppPageDetailsList({
    @Default(<AppPageDetail>[]) List<AppPageDetail> pageDetailsList
  }) = _AppPageDetailsList;

  factory AppPageDetailsList.fromJson(Map<String, dynamic> json) =>
      _$AppPageDetailsListFromJson(json);
}