
import '../../core/app_localization.dart';
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
  static AppPageDetail adminStartPage = AppPageDetail(
    pageName: Texts.to.adminStartPagePageName,
    pageRoute: AppRoutes.adminStartPage,
  );

  static AppPageDetail adminPagesTestPage = AppPageDetail(
    pageName: Texts.to.adminTestPagePageName,
    pageRoute: AppRoutes.adminTestPage,
  );

  static AppPageDetail adminUITestPage = AppPageDetail(
    pageName: Texts.to.adminUITestPagePageName,
    pageRoute: AppRoutes.adminUITestPagePage,
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.splashScreenPageName,
    pageRoute: AppRoutes.splashScreen,
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: AppRoutes.homepage,
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  static AppPageDetail contacts = AppPageDetail(
    pageName: Texts.to.contactsPageName,
    pageRoute: AppRoutes.contacts,
    iconCode: AppIcons.contacts.icon!.codePoint,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  static AppPageDetail accounts = AppPageDetail(
    pageName: Texts.to.accountsPageName,
    pageRoute: AppRoutes.accounts,
    iconCode: AppIcons.accounts.icon!.codePoint,
    bottomBarItemNumber: 2,
    drawerPresence: true,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.settingsPageName,
    pageRoute: AppRoutes.settings,
    iconCode: AppIcons.settings.icon!.codePoint,
    bottomBarItemNumber: 3,
    drawerPresence: true,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.aboutPageName,
    pageRoute: AppRoutes.about,
    iconCode: AppIcons.about.icon!.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.updatePageName,
    pageRoute: AppRoutes.update,
    iconCode: AppIcons.update.icon!.codePoint,
    drawerPresence: true,
  );
}
