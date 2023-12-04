// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_flutter_clean_getx_app/core/app_router/app_router.dart'
    as _i4;
import 'package:base_flutter_clean_getx_app/core/network/dio.dart' as _i9;
import 'package:base_flutter_clean_getx_app/core/network/network_exception.dart'
    as _i8;
import 'package:base_flutter_clean_getx_app/data/storage/app_local_storage.dart'
    as _i3;
import 'package:base_flutter_clean_getx_app/data/storage/app_shared_preferences.dart'
    as _i5;
import 'package:base_flutter_clean_getx_app/data/storage/local_storage_service.dart'
    as _i7;
import 'package:dio/dio.dart' as _i6;
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
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.AppSharedPreferences>(() => _i5.AppSharedPreferencesImpl());
    gh.singleton<_i6.Dio>(dioCore.dio);
    gh.factory<_i7.LocalStorageService>(() => _i7.LocalStorageServiceImp());
    gh.factory<_i8.NetworkException>(
        () => _i8.NetworkException(message: gh<String>()));
    return this;
  }
}

class _$DioCore extends _i9.DioCore {}
