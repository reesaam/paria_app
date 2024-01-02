import 'package:get/get.dart';

import '../../core/app_bindings/localization_bindings.dart';
import 'admin_bindings.dart';
import 'app_bindings.dart';
import 'storage_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    AppStorageBindings().dependencies(); //Storage
    AppBindings().dependencies(); // Pages
    AppLocalizationBindings().dependencies(); //AppLocalization
    AdminBindings().dependencies(); // Admin related
  }
}