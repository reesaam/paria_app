
import '../data_entities/core_data_entities/app_version/app_version.dart';
import 'app_versions.dart';

class AppInfo {
  static String get appName => 'Paria Assistant App';
  static String get appNameInitials => 'PAA';
  static String get website => '';
  static AppVersionsList get versions => appVersions;

  static AppVersion get appCurrentVersion => versions.versionsList.last;
  static int get appVersionsCounter => versions.versionsList.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'pariaapp';
  static String get fileName => '${AppInfo.appNameInitials}_Backup.json';

  static bool get checkUpdate => true;
}
