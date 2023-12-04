import 'package:get/get.dart';

import '../../app/views/about_view.dart';
import '../../app/views/homepage_view.dart';
import '../../app/views/settings_view.dart';
import '../../app/views/splash_screen_view.dart';
import '../../app/views/update_view.dart';
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