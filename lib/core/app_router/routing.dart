import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_clean_getx_app/core/app_router/app_routes.dart';
import 'package:get/get.dart';

var _context = AutoRouter.of(Get.context!);

goToSplashScreenPage() => _context.pushNamed(AppRoutes.splashScreen);
goToHomePage() => _context.pushNamed(AppRoutes.homePage);
goToSettingsPage() => _context.pushNamed(AppRoutes.settings);
goToUpdatePage() => _context.pushNamed(AppRoutes.update);
goToAboutPage() => _context.pushNamed(AppRoutes.about);
