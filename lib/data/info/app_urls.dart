import 'app_info.dart';

class AppURLs {
  static String apiBaseUrl = 'https://api.${AppInfo.baseUrl}';

  //Update
  static String get appUrlUpdateVersion => 'https://${AppInfo.subDomain}.${AppInfo.baseUrl}/version.txt';
  static String get appUrlUpdateAddress => 'https://${AppInfo.subDomain}.${AppInfo.baseUrl}/address.txt';
  static String get appUrlUpdateAPKDownload => 'https://${AppInfo.subDomain}.${AppInfo.baseUrl}/app_sources/${AppInfo.fileName}.apk';
}