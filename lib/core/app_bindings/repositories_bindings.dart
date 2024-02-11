import 'package:get/get.dart';

import '../../features/update/data/repositories/update_repository.dart';

class AppRepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRepository>(() => UpdateRepository.to, fenix: true);
  }
}