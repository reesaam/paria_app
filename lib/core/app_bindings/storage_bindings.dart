import 'package:base_flutter_clean_getx_app/core/dependency_injection/di.dart';
import 'package:get/get.dart';

import '../../data/storage/app_local_storage.dart';
import '../../data/storage/app_shared_preferences.dart';

class AppStorageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSharedPreferences>(() => diCore<AppSharedPreferences>(), fenix: true);
    Get.lazyPut<AppLocalStorage>(() => diCore<AppLocalStorage>(), fenix: true);
  }
}