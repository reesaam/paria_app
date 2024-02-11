import '../../core/app_localization.dart';
import '../../core/app_routing/app_routes.dart';
import '../data_entities/core_data_entities/app_page_detail/app_page_detail.dart';

class AppPageDetails {
  ///Admin Pages
  static AppPageDetail adminStartPage = AppPageDetail(
    pageName: Texts.to.adminStartPagePageName,
    pageRoute: AppRoutes.adminStartPage,
  );

  static AppPageDetail adminPagesTestPage = AppPageDetail(
    pageName: Texts.to.adminTestPagePageName,
    pageRoute: AppRoutes.adminPagesTestPage,
  );

  static AppPageDetail adminUITestPage = AppPageDetail(
    pageName: Texts.to.adminUITestPagePageName,
    pageRoute: AppRoutes.adminUITestPage,
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.splashScreenPageName,
    pageRoute: AppRoutes.splashScreen,
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: AppRoutes.homePage,
    bottomBarItemNumber: 0,
  );

  static AppPageDetail contacts = const AppPageDetail(
    pageName: 'Contacts',
    pageRoute: AppRoutes.contacts,
    bottomBarItemNumber: 1,
  );

  static AppPageDetail accounts = const AppPageDetail(
    pageName: 'Accounts',
    pageRoute: AppRoutes.accounts,
    bottomBarItemNumber: 2,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.settingsPageName,
    pageRoute: AppRoutes.settings,
    bottomBarItemNumber: 3,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.aboutPageName,
    pageRoute: AppRoutes.about,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.updatePageName,
    pageRoute: AppRoutes.update,
  );
}
