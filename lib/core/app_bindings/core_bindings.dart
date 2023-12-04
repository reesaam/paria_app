import 'package:get/get.dart';

import 'admin_bindings.dart';
import 'app_bindings.dart';
import 'storage_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    AppStorageBindings().dependencies();
    AppBindings().dependencies();
    AdminBindings().dependencies();
  }
}