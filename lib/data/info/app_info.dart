class AppInfo {
  static String get appName => 'Paria Assistant App';
  static String get appNameInitials => 'PAA';
  static String get website => '';
  static List<String> get versions => [
        '0.1.0', //Initialization
      ];
  static String get appCurrentVersion => versions.last;
  static int get appVersionsCounter => versions.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'pariaapp';
  static String get fileName => 'download file name';

  static bool get checkUpdate => false;
}
