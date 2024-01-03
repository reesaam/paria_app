import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/app_routing/app_routes.dart';
import '../data_models/core_data_models/app_page_detail/app_page_detail.dart';
import '../resources/app_texts.dart';

class AppPageDetails {
  ///Admin Pages
  static AppPageDetail adminStartPage = AppPageDetail(
    pageName: AppTexts.adminPageAdminStartPage,
    pageRoute: AppRoutes.adminStartPage,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail adminPagesTestPage = AppPageDetail(
    pageName: AppTexts.adminPageAdminPagesTestPage,
    pageRoute: AppRoutes.adminPagesTestPage,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail adminUITestPage = AppPageDetail(
    pageName: AppTexts.adminPageAdminUITestPage,
    pageRoute: AppRoutes.adminUITestPage,
    bottomBarItemNumber: -1,
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: AppTexts.pageSplashScreen,
    pageRoute: AppRoutes.splashScreen,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.pageHomepage,
    pageRoute: AppRoutes.homePage,
    bottomBarItemNumber: 0,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.pageSettings,
    pageRoute: AppRoutes.settings,
    bottomBarItemNumber: 1,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.pageAbout,
    pageRoute: AppRoutes.about,
    bottomBarItemNumber: -1,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.pageUpdate,
    pageRoute: AppRoutes.update,
    bottomBarItemNumber: -1,
  );
}
