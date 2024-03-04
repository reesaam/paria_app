import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_app_languages.dart';
import '../data/storage/app_local_storage.dart';
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

  TextDirection defaultTextDirection = TextDirection.ltr;

  getDefaultLocale() =>
      AppLocalStorage.to.loadSettings().language.getLocale;

  getTextDirection() =>
      AppLocalStorage.to.loadSettings().language.getLocale == persian
          ? TextDirection.rtl
          : defaultTextDirection;
}

class Texts {
  Texts._();
  static S get to => S.of(Get.context!);
}
