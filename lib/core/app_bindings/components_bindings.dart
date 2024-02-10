import 'package:get/get.dart';

import '../../app/functional_components/connectivity/connectivity.dart';


class AppComponentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionChecker>(() => ConnectionChecker(), fenix: true);
  }
}