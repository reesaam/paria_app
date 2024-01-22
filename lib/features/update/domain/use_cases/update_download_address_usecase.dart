import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/network/network_exception.dart';
import '../../data/repositories/update_repository.dart';

@injectable
class UpdateDownloadAddressUseCase
    implements UseCaseNoParams<NetworkException, String> {
  final UpdateRepository updateRepository;

  UpdateDownloadAddressUseCase({required this.updateRepository});

  @override
  Future<Either<NetworkException, String>> call() async =>
      await updateRepository.getUpdateDownloadAddress();
}
