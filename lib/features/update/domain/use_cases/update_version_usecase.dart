import 'package:base_flutter_clean_getx_app/core/elements/core_use_case.dart';
import 'package:base_flutter_clean_getx_app/core/network/network_exception.dart';
import 'package:base_flutter_clean_getx_app/features/update/data/repositories/update_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateVersionUseCase
    implements UseCaseNoParams<NetworkException, String> {
  final UpdateRepository updateRepository;

  UpdateVersionUseCase({required this.updateRepository});

  @override
  Future<Either<NetworkException, String>> call() async =>
      await updateRepository.getAvailableVersion();
}
