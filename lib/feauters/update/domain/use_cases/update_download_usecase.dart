import 'dart:io';

import 'package:base_flutter_clean_getx_app/core/elements/core_use_case.dart';
import 'package:base_flutter_clean_getx_app/core/network/network_exception.dart';
import 'package:base_flutter_clean_getx_app/feauters/update/data/repositories/update_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateDownloadUseCase
    implements UseCaseNoParams<NetworkException, File?> {
  final UpdateRepository updateRepository;

  UpdateDownloadUseCase({required this.updateRepository});

  @override
  Future<Either<NetworkException, File?>> call() async =>
      await updateRepository.updateDownload();
}
