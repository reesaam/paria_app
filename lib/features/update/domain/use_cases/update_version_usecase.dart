import 'package:dartz/dartz.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/network/network_exception.dart';
import '../../data/repositories/update_repository.dart';

class UpdateVersionUseCase extends UseCaseNoParams<NetworkException, String> {
  final UpdateRepository updateRepository;
  UpdateVersionUseCase({required this.updateRepository});

  @override
  Future<Either<NetworkException, String>> call() async =>
      await updateRepository.getAvailableVersion();
}
