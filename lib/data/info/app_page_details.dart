
import '../data_entities/core_data_entities/app_page_detail/app_page_detail.dart';
import '../resources/app_enums.dart';
import '../resources/app_icons.dart';

class AppPageDetails {

  static List<AppPageDetail> get listPages => [
    splashScreen,
    homepage,
    contacts,
    accounts,
    settings,
    about,
    update,
  ];

  static List<AppPageDetail> get listAdminPages => [
    adminStartPage,
    adminPagesTestPage,
    adminUITestPage,
  ];

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

  static AppPageDetail homepage = AppPageDetail(
    pageRoute: AppRoutes.homepage,
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  static AppPageDetail contacts = AppPageDetail(
    pageRoute: AppRoutes.contacts,
    iconCode: AppIcons.contacts.icon!.codePoint,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  static AppPageDetail accounts = AppPageDetail(
    pageRoute: AppRoutes.accounts,
    iconCode: AppIcons.accounts.icon!.codePoint,
    bottomBarItemNumber: 2,
    drawerPresence: true,
  );

  static AppPageDetail settings = AppPageDetail(
    pageRoute: AppRoutes.settings,
    iconCode: AppIcons.settings.icon!.codePoint,
    bottomBarItemNumber: 3,
    drawerPresence: true,
  );

  static AppPageDetail about = AppPageDetail(
    pageRoute: AppRoutes.about,
    iconCode: AppIcons.about.icon!.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail update = AppPageDetail(
    pageRoute: AppRoutes.update,
    iconCode: AppIcons.update.icon!.codePoint,
    drawerPresence: true,
  );
}
