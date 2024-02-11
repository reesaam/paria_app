import 'package:get/get.dart';

import '../../app/functional_components/connectivity/connectivity.dart';
import '../../app/functional_components/permissions/permissions.dart';


class AppComponentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionChecker>(() => ConnectionChecker(), fenix: true);
    Get.lazyPut<AppPermissions>(() => AppPermissions(), fenix: true);
  }
}