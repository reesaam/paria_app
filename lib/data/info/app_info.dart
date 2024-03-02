import 'package:paria_app/data/resources/app_enums.dart';

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
    '0.1.2', //Apply New Structure Changes on the App
    '0.2.1', //Implementation Major Changes in Major Structure
    '0.2.2', //Contacts
    '0.2.3', //Accounts
    '0.2.4', //Entities and Models Implementation
    '0.2.5', //Data Backup and Restore
    '0.2.6', //
  ];

  static String get appCurrentVersion => versions.last;
  static int get appVersionsCounter => versions.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'pariaapp';
  static String get fileName => '${AppInfo.appNameInitials}_Backup.json';

  static bool get checkUpdate => false;
}
