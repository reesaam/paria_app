import 'package:get/get.dart';

import '../../features/update/domain/repositories/update_repository.dart';

class AppRepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRepository>(() => UpdateRepository.to, fenix: true);
  }
}