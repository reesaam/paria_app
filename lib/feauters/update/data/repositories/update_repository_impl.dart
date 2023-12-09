import 'dart:io';

import 'package:base_flutter_clean_getx_app/core/network/network_exception.dart';
import 'package:base_flutter_clean_getx_app/feauters/update/data/remote/data_sources/update_remote_data_source.dart';
import 'package:base_flutter_clean_getx_app/feauters/update/data/repositories/update_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateRepository)
class UpdateRepositoryImpl implements UpdateRepository {
  final UpdateRemoteDataSource updateRemoteDataSource;

  UpdateRepositoryImpl({required this.updateRemoteDataSource});

  @override
  Future<Either<NetworkException, String>> getAvailableVersion() async =>
      updateRemoteDataSource.getAvailableVersion();

  @override
  Future<Either<NetworkException, String>> getUpdateDownloadAddress() =>
      updateRemoteDataSource.getDownloadAddress();

  @override
  Future<Either<NetworkException, File?>> updateDownload() async =>
      updateRemoteDataSource.updateDownload();
}
