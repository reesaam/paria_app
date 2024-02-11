import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/settings/domain/entites/app_settings_data_entity/app_setting_data_entity.dart';


part 'app_data_entity.freezed.dart';
part 'app_data_entity.g.dart';

@freezed
class AppDataEntity with _$AppDataEntity {
  const factory AppDataEntity({
    final AppSettingDataEntity? settings,
  }) = _AppDataEntity;

  factory AppDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AppDataEntityFromJson(json);
}