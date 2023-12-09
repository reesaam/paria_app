import 'package:get/get.dart';

import '../../feauters/about/presentation/manager/about_controller.dart';
import '../../feauters/homepage/presentation/manager/homepage_controller.dart';
import '../../feauters/settings/presentation/manager/settings_controller.dart';
import '../../feauters/splash_screen/presentation/manager/splash_screen_controller.dart';
import '../../feauters/update/presentation/manager/update_controller.dart';


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