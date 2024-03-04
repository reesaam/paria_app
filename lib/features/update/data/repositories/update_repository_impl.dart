import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/network/network_exception.dart';
import '../remote/data_sources/update_remote_data_source.dart';
import '../../domain/repositories/update_repository.dart';

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
