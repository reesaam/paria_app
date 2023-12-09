import 'package:get/get.dart';

import '../../feauters/about/presentation/pages/about_view.dart';
import '../../feauters/homepage/presentation/pages/homepage_view.dart';
import '../../feauters/settings/presentation/pages/settings_view.dart';
import '../../feauters/splash_screen/presentation/pages/splash_screen_view.dart';
import '../../feauters/update/presentation/pages/update_view.dart';
import 'app_routes.dart';

class AppPages {
  static get pages => [
    ///Admin Pages
    // GetPage(name: AppRoutes.adminStartPage, page: AdminStartPage.new),
    // GetPage(name: AppRoutes.adminPagesTestPage, page: AdminPagesTestPage.new),
    // GetPage(name: AppRoutes.adminUITestPage, page: AdminUITestPage.new),

    ///Main App Pages
    GetPage(name: AppRoutes.splashScreen, page: SplashScreenPage.new),
    GetPage(name: AppRoutes.homePage, page: HomePage.new),
    GetPage(name: AppRoutes.settings, page: SettingsPage.new),
    GetPage(name: AppRoutes.update, page: UpdatePage.new),
    GetPage(name: AppRoutes.about, page: AboutPage.new),
  ];
}