import 'package:base_flutter_clean_getx_app/data/info/app_info.dart';

class AppTexts {
  ///App Pages
  static String get pageHomepage => 'Home';
  static String get pageSplashScreen => 'Splash Screen';
  static String get pageSettings => 'Settings';
  static String get pageUpdate => 'Update';
  static String get pageAbout => 'About';

  ///App Admin Pages
  static String get adminPageAdminStartPage => 'Admin Start Page';
  static String get adminPageAdminPagesTestPage => 'Admin Pages Test Page';
  static String get adminPageAdminUITestPage => 'Admin UI Test Page';

  ///General
  static String get generalVersion => 'Version';
  static String get generalOK => 'OK';
  static String get generalCancel => 'Cancel';
  static String get generalEmpty => '';
  static String get generalNotAvailable => 'Not Available';
  static String get generalNotAvailableInitials => 'N/A';
  static String get total => 'Total';
  static String get from => 'From';
  static String get to => 'To';
  static String get warning => 'Warning';
  static String get alert => 'Alert!';
  static String get information => 'Information';
  static String get areYouSureDataWillLost => 'Are you sure?\nData will be lost with this Function.';
  static String get areYouSureDataMayLost => 'Are you sure?\nData may be lost with this Function.';
  static String get areYouSureDataExport => 'Are you sure?\nData will be exported and exposed.';
  static String get areYouSure => 'Are you sure ?';
  static String get appExit => 'App Exit';

  ///Settings
  static String get settingAppbarMenuResetSettings => 'Reset All Settings';

  static String get settingSectionTitleGeneral => 'General';
  static String get settingSectionTitleGeneralLanguage => 'Language';
  static String get settingSectionTitleGeneralCalendar => 'Calendar Type';
  static String get settingSectionGeneralItemDarkMode => 'Dark Mode';

  static String get settingSectionTitleUpdate => 'Update';
  static String get settingSectionTitleUpdateCurrentVersion => 'Current Version:';
  static String get settingSectionTitleUpdateAvailableVersion => 'Available Version:';

  static String get settingSectionTitleBackup => 'Backup';
  static String get settingSectionBackupBackup => 'Backup Data';
  static String get settingSectionBackupRestore => 'Restore Data';

  static String get settingSectionTitleStorage => 'Storage';
  static String get settingSectionStorageItemEraseAllData => 'Erase All Data';

  static String get settingBackupFilename => '${AppInfo.appNameInitials}_Backup.json';

  ///Update
  static String get updateAppFilename => '${AppInfo.appNameInitials}_app.apk';
  static String get updateCurrentVersion => 'Current Version:';
  static String get updateAvailableVersion => 'New Available Version:';
  static String get updateCheckUpdate => 'Check Update';
  static String get updateDownloadUpdate => 'Download Update';
  static String get updateNewVersion => 'New Version Found';
  static String get updateApprove => 'Do you want to download the New Version?';
  static String get updateCheckingUpdate => 'Checking for any Available Update ...';
  static String get updateUpdateFound => 'New Update is Available!';
  static String get updateNoUpdateFound => 'There is not any Update Available!';
  static String get updateDownloading => 'Downloading ...';
  static String get updateDownloaded => 'Update Downloaded!';
  static String get updateInstallationTitle => 'Update Installation';
  static String get updateInstallationContent => 'Do you want to install the Update?\n\nWarning: Application will close!';
  static String get updateDirectoryNotFoundTitle => 'Directory Error!';
  static String get updateDirectoryNotFoundContent => 'There is not any Directory available to store Data';
  static String get updateFileNotFoundTitle => 'File Error!';
  static String get updateFileNotFoundContent => 'File not found';

  ///Dio
  static String get dioHeaderContentType => 'Content-Type';
  static String get dioHeaderContentTypeData => 'application/json';
  static String get dioHeaderConnection => 'Connection';
  static String get dioHeaderConnectionData => 'keep-alive';
}