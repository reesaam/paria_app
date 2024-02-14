import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paria_app/data/resources/app_enums.dart';

part 'app_page_detail.freezed.dart';
part 'app_page_detail.g.dart';

@freezed
class AppPageDetail with _$AppPageDetail {
  const factory AppPageDetail({
    required final AppRoutes pageRoute,
    final int? bottomBarItemNumber,
    final bool? drawerPresence,
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