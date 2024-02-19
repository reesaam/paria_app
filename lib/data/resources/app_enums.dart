import 'package:flutter/material.dart';

enum AppRoutes {
  splashScreen('Splash Screen'),
  homepage('HomePage'),
  contacts('Contacts'),
  contactsBalance('Contacts Balance'),
  accounts('Accounts'),
  settings('Settings'),
  update('Update'),
  about('About'),
  notFound('Page Not Found'),
  adminStartPage('Admin Start Page'),
  adminTestPage('Admin Test Page'),
  adminUITestPage('Admin UI Test Page');

  final String pageLabel;
  const AppRoutes(this.pageLabel);
}

enum AppBottomNavigationPages {
  homepage(AppRoutes.homepage),
  contacts(AppRoutes.contacts),
  accounts(AppRoutes.accounts),
  settings(AppRoutes.settings);

  final AppRoutes appRoute;
  const AppBottomNavigationPages(this.appRoute);
}

enum AppLanguages {
  english('English', Locale('en')),
  deutsch('Deutsch', Locale('de')),
  persian('Persian', Locale('fa'));

  final String languageName;
  final Locale locale;
  const AppLanguages(this.languageName, this.locale);
}

enum AppCalendarTypes {
  christian('Christian'),
  jalali('Jalali');

  final String calendarName;

  const AppCalendarTypes(this.calendarName);
}

enum AppStorageKeys {
  keyContacts,
  keyAccounts,
  keySettings,
}
