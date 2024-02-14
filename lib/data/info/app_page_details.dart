import '../data_entities/core_data_entities/app_page_detail/app_page_detail.dart';
import '../resources/app_enums.dart';

class AppPageDetails {
  ///Admin Pages
  static AppPageDetail adminStartPage = const AppPageDetail(
    pageRoute: AppRoutes.adminStartPage,
  );

  static AppPageDetail adminPagesTestPage = const AppPageDetail(
    pageRoute: AppRoutes.adminTestPage,
  );

  static AppPageDetail adminUITestPage = const AppPageDetail(
    pageRoute: AppRoutes.adminUITestPage,
  );

  ///Main Pages
  static AppPageDetail splashScreen = const AppPageDetail(
    pageRoute: AppRoutes.splashScreen,
  );

  static AppPageDetail homepage = const AppPageDetail(
    pageRoute: AppRoutes.homepage,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  static AppPageDetail contacts = const AppPageDetail(
    pageRoute: AppRoutes.contacts,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  static AppPageDetail contactsBalance = const AppPageDetail(
    pageRoute: AppRoutes.contactsBalance,
  );

  static AppPageDetail accounts = const AppPageDetail(
    pageRoute: AppRoutes.accounts,
    bottomBarItemNumber: 2,
    drawerPresence: true,
  );

  static AppPageDetail settings = const AppPageDetail(
    pageRoute: AppRoutes.settings,
    bottomBarItemNumber: 3,
    drawerPresence: true,
  );

  static AppPageDetail about = const AppPageDetail(
    pageRoute: AppRoutes.about,
    drawerPresence: true,
  );

  static AppPageDetail update = const AppPageDetail(
    pageRoute: AppRoutes.update,
    drawerPresence: true,
  );
}
