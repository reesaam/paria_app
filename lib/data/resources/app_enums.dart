import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppDataVersions {
  v1(1),
  v2(2);

  final int number;
  const AppDataVersions(this.number);
}

enum AppRoutes {
  splashScreen,
  homepage,
  contacts,
  contactsBalance,
  accounts,
  settings,
  update,
  about,
  notFound,
  adminStartPage,
  adminTestPage,
  adminUITestPagePage,
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

enum ContactsSortType {
  nameAZ('Name A->Z'),
  nameZA('Name Z->A'),
  balanceInc('Balance Inc'),
  balanceDec('Balance Dec'),
  recordsCountInc('Records Count Inc'),
  recordsCountDec('Records Count Dec');

  final String value;
  const ContactsSortType(this.value);
}

enum RecordsSortType {
  contactAZ('Contact  A->Z'),
  contactZA('Contact  Z->A'),
  amountInc('Amount  Inc'),
  amountDec('Amount  Dec'),
  dateInc('Date  Inc'),
  dateDec('Date  Dec');

  final String value;
  const RecordsSortType(this.value);
}
