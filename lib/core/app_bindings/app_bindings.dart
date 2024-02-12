import 'package:get/get.dart';
import 'package:paria_app/features/accounts/presentation/manager/accounts_controller.dart';
import 'package:paria_app/features/contacts/presentation/manager/contacts_controller.dart';

import '../../features/about/presentation/manager/about_controller.dart';
import '../../features/homepage/presentation/manager/homepage_controller.dart';
import '../../features/settings/presentation/manager/settings_controller.dart';
import '../../features/splash_screen/presentation/manager/splash_screen_controller.dart';
import '../../features/update/presentation/manager/update_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(), fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<ContactsController>(() => ContactsController(), fenix: true);
    Get.lazyPut<AccountsController>(() => AccountsController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
  }
}