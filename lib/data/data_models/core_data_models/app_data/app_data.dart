import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_settings_data/app_setting_data.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@freezed
class AppData with _$AppData {
  const factory AppData({
    final AppSettingData? setting,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);
}