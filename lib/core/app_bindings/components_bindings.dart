import 'package:get/get.dart';
import 'package:paria_app/app/functional_components/persmissions/permissions.dart';

import '../../app/functional_components/connectivity/connectivity.dart';


class AppComponentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionChecker>(() => ConnectionChecker(), fenix: true);
    Get.lazyPut<AppPermissions>(() => AppPermissions(), fenix: true);
  }
}