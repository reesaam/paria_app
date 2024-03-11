// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppDataEntity _$AppDataEntityFromJson(Map<String, dynamic> json) {
  return _AppDataEntity.fromJson(json);
}

/// @nodoc
mixin _$AppDataEntity {
  AppDataVersions? get appDataVersion => throw _privateConstructorUsedError;
  AppVersion? get appVersion => throw _privateConstructorUsedError;
  AppSettingDataEntity? get settings => throw _privateConstructorUsedError;
  AppContactEntitiesList? get contacts => throw _privateConstructorUsedError;
  AppAccountRecordEntitiesList? get accounts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataEntityCopyWith<AppDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataEntityCopyWith<$Res> {
  factory $AppDataEntityCopyWith(
          AppDataEntity value, $Res Function(AppDataEntity) then) =
      _$AppDataEntityCopyWithImpl<$Res, AppDataEntity>;
  @useResult
  $Res call(
      {AppDataVersions? appDataVersion,
      AppVersion? appVersion,
      AppSettingDataEntity? settings,
      AppContactEntitiesList? contacts,
      AppAccountRecordEntitiesList? accounts});

  $AppVersionCopyWith<$Res>? get appVersion;
  $AppSettingDataEntityCopyWith<$Res>? get settings;
  $AppContactEntitiesListCopyWith<$Res>? get contacts;
  $AppAccountRecordEntitiesListCopyWith<$Res>? get accounts;
}

/// @nodoc
class _$AppDataEntityCopyWithImpl<$Res, $Val extends AppDataEntity>
    implements $AppDataEntityCopyWith<$Res> {
  _$AppDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appDataVersion = freezed,
    Object? appVersion = freezed,
    Object? settings = freezed,
    Object? contacts = freezed,
    Object? accounts = freezed,
  }) {
    return _then(_value.copyWith(
      appDataVersion: freezed == appDataVersion
          ? _value.appDataVersion
          : appDataVersion // ignore: cast_nullable_to_non_nullable
              as AppDataVersions?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettingDataEntity?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as AppContactEntitiesList?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as AppAccountRecordEntitiesList?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppVersionCopyWith<$Res>? get appVersion {
    if (_value.appVersion == null) {
      return null;
    }

    return $AppVersionCopyWith<$Res>(_value.appVersion!, (value) {
      return _then(_value.copyWith(appVersion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSettingDataEntityCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $AppSettingDataEntityCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppContactEntitiesListCopyWith<$Res>? get contacts {
    if (_value.contacts == null) {
      return null;
    }

    return $AppContactEntitiesListCopyWith<$Res>(_value.contacts!, (value) {
      return _then(_value.copyWith(contacts: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppAccountRecordEntitiesListCopyWith<$Res>? get accounts {
    if (_value.accounts == null) {
      return null;
    }

    return $AppAccountRecordEntitiesListCopyWith<$Res>(_value.accounts!,
        (value) {
      return _then(_value.copyWith(accounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppDataEntityImplCopyWith<$Res>
    implements $AppDataEntityCopyWith<$Res> {
  factory _$$AppDataEntityImplCopyWith(
          _$AppDataEntityImpl value, $Res Function(_$AppDataEntityImpl) then) =
      __$$AppDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppDataVersions? appDataVersion,
      AppVersion? appVersion,
      AppSettingDataEntity? settings,
      AppContactEntitiesList? contacts,
      AppAccountRecordEntitiesList? accounts});

  @override
  $AppVersionCopyWith<$Res>? get appVersion;
  @override
  $AppSettingDataEntityCopyWith<$Res>? get settings;
  @override
  $AppContactEntitiesListCopyWith<$Res>? get contacts;
  @override
  $AppAccountRecordEntitiesListCopyWith<$Res>? get accounts;
}

/// @nodoc
class __$$AppDataEntityImplCopyWithImpl<$Res>
    extends _$AppDataEntityCopyWithImpl<$Res, _$AppDataEntityImpl>
    implements _$$AppDataEntityImplCopyWith<$Res> {
  __$$AppDataEntityImplCopyWithImpl(
      _$AppDataEntityImpl _value, $Res Function(_$AppDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appDataVersion = freezed,
    Object? appVersion = freezed,
    Object? settings = freezed,
    Object? contacts = freezed,
    Object? accounts = freezed,
  }) {
    return _then(_$AppDataEntityImpl(
      appDataVersion: freezed == appDataVersion
          ? _value.appDataVersion
          : appDataVersion // ignore: cast_nullable_to_non_nullable
              as AppDataVersions?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettingDataEntity?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as AppContactEntitiesList?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as AppAccountRecordEntitiesList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppDataEntityImpl implements _AppDataEntity {
  const _$AppDataEntityImpl(
      {this.appDataVersion,
      this.appVersion,
      this.settings,
      this.contacts,
      this.accounts});

  factory _$AppDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppDataEntityImplFromJson(json);

  @override
  final AppDataVersions? appDataVersion;
  @override
  final AppVersion? appVersion;
  @override
  final AppSettingDataEntity? settings;
  @override
  final AppContactEntitiesList? contacts;
  @override
  final AppAccountRecordEntitiesList? accounts;

  @override
  String toString() {
    return 'AppDataEntity(appDataVersion: $appDataVersion, appVersion: $appVersion, settings: $settings, contacts: $contacts, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppDataEntityImpl &&
            (identical(other.appDataVersion, appDataVersion) ||
                other.appDataVersion == appDataVersion) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.accounts, accounts) ||
                other.accounts == accounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, appDataVersion, appVersion, settings, contacts, accounts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppDataEntityImplCopyWith<_$AppDataEntityImpl> get copyWith =>
      __$$AppDataEntityImplCopyWithImpl<_$AppDataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppDataEntityImplToJson(
      this,
    );
  }
}

abstract class _AppDataEntity implements AppDataEntity {
  const factory _AppDataEntity(
      {final AppDataVersions? appDataVersion,
      final AppVersion? appVersion,
      final AppSettingDataEntity? settings,
      final AppContactEntitiesList? contacts,
      final AppAccountRecordEntitiesList? accounts}) = _$AppDataEntityImpl;

  factory _AppDataEntity.fromJson(Map<String, dynamic> json) =
      _$AppDataEntityImpl.fromJson;

  @override
  AppDataVersions? get appDataVersion;
  @override
  AppVersion? get appVersion;
  @override
  AppSettingDataEntity? get settings;
  @override
  AppContactEntitiesList? get contacts;
  @override
  AppAccountRecordEntitiesList? get accounts;
  @override
  @JsonKey(ignore: true)
  _$$AppDataEntityImplCopyWith<_$AppDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
