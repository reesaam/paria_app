import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/network/network_exception.dart';
import '../../data/repositories/update_repository.dart';

@injectable
class UpdateDownloadUseCase
    implements UseCaseNoParams<NetworkException, File?> {
  final UpdateRepository updateRepository;

  UpdateDownloadUseCase({required this.updateRepository});

  @override
  Future<Either<NetworkException, File?>> call() async =>
      await updateRepository.updateDownload();
}
