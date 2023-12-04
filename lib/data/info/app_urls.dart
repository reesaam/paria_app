import 'package:base_flutter_clean_getx_app/data/info/app_info.dart';

class AppURLs {
  static String apiBaseUrl = 'https://api.${AppInfo.baseUrl}';
  static String get appUrlResamHostVersion => 'https://${AppInfo.subDomain}.${AppInfo.baseUrl}/version.txt';
  static String get appUrlResamHostAddress => 'https://${AppInfo.subDomain}.${AppInfo.baseUrl}/address.txt';
  static String get appUrlResamHostAPKDownload => 'https://${AppInfo.subDomain}.${AppInfo.baseUrl}/app_sources/${AppInfo.fileName}.apk';
}