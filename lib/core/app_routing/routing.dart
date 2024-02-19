import 'package:flutter_base_clean_getx_app/core/app_extensions/extension_app_routes.dart';
import 'package:get/get.dart';

import '../../data/resources/app_enums.dart';

goToSplashScreenPage() => goToPage(AppRoutes.splashScreen);
goToHomePage() => goToPage(AppRoutes.homepage);
goToSettingsPage() => goToPage(AppRoutes.settings);
goToUpdatePage() => goToPage(AppRoutes.update);
goToAboutPage() => goToPage(AppRoutes.about);

goToPage(AppRoutes route) => AppRoutes.values.contains(route)
    ? Get.toNamed(route.route)
    : Get.toNamed(AppRoutes.notFound.route);