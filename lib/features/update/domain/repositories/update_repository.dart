import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:paria_app/features/update/data/repositories/update_repository_impl.dart';

import '../../../../core/network/network_exception.dart';

abstract class UpdateRepository {
  static UpdateRepository get to => Get.find<UpdateRepositoryImpl>();

  Future<Either<NetworkException, String>> getAvailableVersion();
  Future<Either<NetworkException, String>> getUpdateDownloadAddress();
  Future<Either<NetworkException, File?>> updateDownload();
}
