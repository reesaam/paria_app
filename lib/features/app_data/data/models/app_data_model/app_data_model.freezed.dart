// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppDataModel _$AppDataModelFromJson(Map<String, dynamic> json) {
  return _AppDataModel.fromJson(json);
}

/// @nodoc
mixin _$AppDataModel {
  AppDataVersions? get appDataVersion => throw _privateConstructorUsedError;
  AppVersion? get appVersion => throw _privateConstructorUsedError;
  AppSettingDataModel? get settings => throw _privateConstructorUsedError;
  AppContactModelsList? get contacts => throw _privateConstructorUsedError;
  AppAccountRecordModelsList? get accounts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataModelCopyWith<AppDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataModelCopyWith<$Res> {
  factory $AppDataModelCopyWith(
          AppDataModel value, $Res Function(AppDataModel) then) =
      _$AppDataModelCopyWithImpl<$Res, AppDataModel>;
  @useResult
  $Res call(
      {AppDataVersions? appDataVersion,
      AppVersion? appVersion,
      AppSettingDataModel? settings,
      AppContactModelsList? contacts,
      AppAccountRecordModelsList? accounts});

  $AppVersionCopyWith<$Res>? get appVersion;
  $AppSettingDataModelCopyWith<$Res>? get settings;
  $AppContactModelsListCopyWith<$Res>? get contacts;
  $AppAccountRecordModelsListCopyWith<$Res>? get accounts;
}

/// @nodoc
class _$AppDataModelCopyWithImpl<$Res, $Val extends AppDataModel>
    implements $AppDataModelCopyWith<$Res> {
  _$AppDataModelCopyWithImpl(this._value, this._then);

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
              as AppSettingDataModel?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as AppContactModelsList?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as AppAccountRecordModelsList?,
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
  $AppSettingDataModelCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $AppSettingDataModelCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppContactModelsListCopyWith<$Res>? get contacts {
    if (_value.contacts == null) {
      return null;
    }

    return $AppContactModelsListCopyWith<$Res>(_value.contacts!, (value) {
      return _then(_value.copyWith(contacts: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppAccountRecordModelsListCopyWith<$Res>? get accounts {
    if (_value.accounts == null) {
      return null;
    }

    return $AppAccountRecordModelsListCopyWith<$Res>(_value.accounts!, (value) {
      return _then(_value.copyWith(accounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppDataModelImplCopyWith<$Res>
    implements $AppDataModelCopyWith<$Res> {
  factory _$$AppDataModelImplCopyWith(
          _$AppDataModelImpl value, $Res Function(_$AppDataModelImpl) then) =
      __$$AppDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppDataVersions? appDataVersion,
      AppVersion? appVersion,
      AppSettingDataModel? settings,
      AppContactModelsList? contacts,
      AppAccountRecordModelsList? accounts});

  @override
  $AppVersionCopyWith<$Res>? get appVersion;
  @override
  $AppSettingDataModelCopyWith<$Res>? get settings;
  @override
  $AppContactModelsListCopyWith<$Res>? get contacts;
  @override
  $AppAccountRecordModelsListCopyWith<$Res>? get accounts;
}

/// @nodoc
class __$$AppDataModelImplCopyWithImpl<$Res>
    extends _$AppDataModelCopyWithImpl<$Res, _$AppDataModelImpl>
    implements _$$AppDataModelImplCopyWith<$Res> {
  __$$AppDataModelImplCopyWithImpl(
      _$AppDataModelImpl _value, $Res Function(_$AppDataModelImpl) _then)
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
    return _then(_$AppDataModelImpl(
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
              as AppSettingDataModel?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as AppContactModelsList?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as AppAccountRecordModelsList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppDataModelImpl implements _AppDataModel {
  const _$AppDataModelImpl(
      {this.appDataVersion,
      this.appVersion,
      this.settings,
      this.contacts,
      this.accounts});

  factory _$AppDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppDataModelImplFromJson(json);

  @override
  final AppDataVersions? appDataVersion;
  @override
  final AppVersion? appVersion;
  @override
  final AppSettingDataModel? settings;
  @override
  final AppContactModelsList? contacts;
  @override
  final AppAccountRecordModelsList? accounts;

  @override
  String toString() {
    return 'AppDataModel(appDataVersion: $appDataVersion, appVersion: $appVersion, settings: $settings, contacts: $contacts, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppDataModelImpl &&
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
  _$$AppDataModelImplCopyWith<_$AppDataModelImpl> get copyWith =>
      __$$AppDataModelImplCopyWithImpl<_$AppDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppDataModelImplToJson(
      this,
    );
  }
}

abstract class _AppDataModel implements AppDataModel {
  const factory _AppDataModel(
      {final AppDataVersions? appDataVersion,
      final AppVersion? appVersion,
      final AppSettingDataModel? settings,
      final AppContactModelsList? contacts,
      final AppAccountRecordModelsList? accounts}) = _$AppDataModelImpl;

  factory _AppDataModel.fromJson(Map<String, dynamic> json) =
      _$AppDataModelImpl.fromJson;

  @override
  AppDataVersions? get appDataVersion;
  @override
  AppVersion? get appVersion;
  @override
  AppSettingDataModel? get settings;
  @override
  AppContactModelsList? get contacts;
  @override
  AppAccountRecordModelsList? get accounts;
  @override
  @JsonKey(ignore: true)
  _$$AppDataModelImplCopyWith<_$AppDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
