import 'package:get/get.dart';

import '../../app/controllers/about_controller.dart';
import '../../app/controllers/homepage_controller.dart';
import '../../app/controllers/settings_controller.dart';
import '../../app/controllers/splash_screen_controller.dart';
import '../../app/controllers/update_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(), fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
  }
}