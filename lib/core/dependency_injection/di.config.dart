// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_flutter_clean_getx_app/core/network/dio.dart' as _i8;
import 'package:base_flutter_clean_getx_app/core/network/network_exception.dart'
    as _i7;
import 'package:base_flutter_clean_getx_app/data/storage/app_local_storage.dart'
    as _i3;
import 'package:base_flutter_clean_getx_app/data/storage/app_shared_preferences.dart'
    as _i4;
import 'package:base_flutter_clean_getx_app/data/storage/local_storage_service.dart'
    as _i6;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioCore = _$DioCore();
    gh.factory<_i3.AppLocalStorage>(() => _i3.AppLocalStorageImpl());
    gh.factory<_i4.AppSharedPreferences>(() => _i4.AppSharedPreferencesImpl());
    gh.singleton<_i5.Dio>(dioCore.dio);
    gh.factory<_i6.LocalStorageService>(() => _i6.LocalStorageServiceImp());
    gh.factory<_i7.NetworkException>(
        () => _i7.NetworkException(message: gh<String>()));
    return this;
  }
}

class _$DioCore extends _i8.DioCore {}
