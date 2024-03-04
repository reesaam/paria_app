import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../../features/update/data/remote/data_sources/update_remote_data_source_impl.dart';
import '../../../../../core/network/network_exception.dart';

abstract class UpdateRemoteDataSource {
  static UpdateRemoteDataSource get to =>
      Get.find<UpdateRemoteDataSourceImpl>();

  Future<Either<NetworkException, String>> getDownloadAddress();
  Future<Either<NetworkException, String>> getAvailableVersion();
  Future<Either<NetworkException, File?>> updateDownload();
}
