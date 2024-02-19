import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@freezed
class AppData with _$AppData {
  const factory AppData({
    @Default(AppSettingDataEntity()) AppSettingDataEntity setting,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);
}