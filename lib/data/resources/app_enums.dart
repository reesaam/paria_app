import 'package:flutter/material.dart';

enum AppBottomNavigationPages {
  homepage,
  settings,
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
  keySettings,
}
