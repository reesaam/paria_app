import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppDataVersions {
  v1(1);

  final int number;
  const AppDataVersions(this.number);
}

enum AppRoutes {
  splashScreen,
  homepage,
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

enum AppStorageKeys {
  keySettings,
}
