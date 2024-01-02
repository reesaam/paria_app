import 'package:base_flutter_clean_getx_app/core/app_extensions/data_types_extensions/extension_locale.dart';
import 'package:base_flutter_clean_getx_app/core/core_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';

class AppLocalization {
  static AppLocalization get to => Get.find();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languages => [english, deutsch, persian];
  static Locale get english => const Locale('en');
  static Locale get deutsch => const Locale('de');
  static Locale get persian => const Locale('fa');

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Variables
  Locale defaultLanguage = english;
  Locale currentLanguage = english;

  TextDirection defaultTextDirection = TextDirection.ltr;

  ///Functions
  setLanguage(Locale locale) {
    appDebugPrint('Prev Language: $currentLanguage');
    currentLanguage = locale;
    appLogPrint('Language change to: ${currentLanguage.getLanguageName}');
  }

  getTextDirection() =>
      currentLanguage == persian ? TextDirection.rtl : defaultTextDirection;
}

class Texts {
  static S get to => S.of(Get.context!);
}