class AppInfo {
  static String get appName => 'Paria Assistant App';
  static String get appNameInitials => 'PAA';
  static String get website => '';
  static List<String> get versions => [
        '0.0.1',
        '0.0.2',
        '0.0.3',
        '0.0.4',
        '0.0.5',
        '0.0.6', // Major Refactor
        '0.0.7', // Some Refactor / Edit Contact Correction for Edit Records / AddEdit Contact and Record Validation Messages
        '0.1.0', //Initialization with new structure
        '0.1.1', //Implementation on new structure
      ];

  static String get appCurrentVersion => versions.last;
  static int get appVersionsCounter => versions.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'pariaapp';
  static String get fileName => 'download file name';

  static bool get checkUpdate => false;
}
