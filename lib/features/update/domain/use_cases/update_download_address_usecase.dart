import 'package:dartz/dartz.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/network/network_exception.dart';
import '../repositories/update_repository.dart';

class UpdateDownloadAddressUseCase
    implements UseCaseNoParams<NetworkException, String> {
  final UpdateRepository updateRepository;

  UpdateDownloadAddressUseCase({required this.updateRepository});

  @override
  Future<Either<NetworkException, String>> call() async =>
      await updateRepository.getUpdateDownloadAddress();
}
