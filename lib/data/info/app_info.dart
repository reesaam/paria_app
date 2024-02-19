class AppInfo {
  static String get appName => 'Base Flutter Clean GetX App';
  static String get appNameInitials => 'BFCGA';
  static String get website => '';
  static List<String> get versions => [
        '0.0.1', //Initialization
      ];
  static String get appCurrentVersion => versions.last;
  static int get appVersionsCounter => versions.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'basefluttercleangetxapp';
  static String get fileName => '${AppInfo.appNameInitials}_Backup.json';

  static bool get checkUpdate => false;
}
