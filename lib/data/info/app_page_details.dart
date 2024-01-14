import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/app_routing/app_routes.dart';
import '../data_models/core_data_models/app_page_detail/app_page_detail.dart';

class AppPageDetails {
  ///Admin Pages
  static AppPageDetail adminStartPage = AppPageDetail(
    pageName: Texts.to.adminStartPagePageName,
    pageRoute: AppRoutes.adminStartPage,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail adminPagesTestPage = AppPageDetail(
    pageName: Texts.to.adminTestPagePageName,
    pageRoute: AppRoutes.adminPagesTestPage,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail adminUITestPage = AppPageDetail(
    pageName: Texts.to.adminUITestPagePageName,
    pageRoute: AppRoutes.adminUITestPage,
    bottomBarItemNumber: -1,
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.splashScreenPageName,
    pageRoute: AppRoutes.splashScreen,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: AppRoutes.homePage,
    bottomBarItemNumber: 0,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: AppRoutes.settings,
    bottomBarItemNumber: 1,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.aboutPageName,
    pageRoute: AppRoutes.about,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.updatePageName,
    pageRoute: AppRoutes.update,
    bottomBarItemNumber: -1,
  );
}
