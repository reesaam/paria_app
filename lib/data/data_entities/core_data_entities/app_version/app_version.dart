import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version.freezed.dart';
part 'app_version.g.dart';

@freezed
class AppVersion with _$AppVersion {
  const factory AppVersion({
    required final String version,
    final List<String>? changes,
    final bool? released,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);
}

@freezed
class AppVersionsList with _$AppVersionsList {
  factory AppVersionsList({
    @Default(<AppVersion>[]) List<AppVersion> versionsList
  }) = _AppVersionsList;

  factory AppVersionsList.fromJson(Map<String, dynamic> json) =>
      _$AppVersionsListFromJson(json);
}