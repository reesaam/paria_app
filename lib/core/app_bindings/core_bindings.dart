import 'package:get/get.dart';
import 'package:paria_app/core/app_bindings/components_bindings.dart';
import 'package:paria_app/core/app_bindings/repositories_bindings.dart';

import '../../core/app_bindings/localization_bindings.dart';
import 'admin_bindings.dart';
import 'app_bindings.dart';
import 'storage_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    AppStorageBindings().dependencies(); //Storage
    AppLocalizationBindings().dependencies(); //AppLocalization
    AppRepositoriesBindings().dependencies();
    AppComponentsBindings().dependencies();
    AppBindings().dependencies(); // Pages
    AdminBindings().dependencies(); // Admin related
  }
}