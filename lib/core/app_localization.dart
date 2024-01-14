import 'package:flutter/material.dart';
import 'package:flutter_base_clean_getx_app/core/app_extensions/data_types_extensions/extenstion_app_languages.dart';
import 'package:flutter_base_clean_getx_app/data/resources/app_enums.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../data/storage/app_local_storage.dart';
import '../generated/l10n.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../core/core_functions.dart';

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

  getLocale() => AppLocalStorage.to.loadSettings().language!.getLocale;

  getTextDirection() =>
      AppLocalStorage.to.loadSettings().language!.getLocale == persian
          ? TextDirection.rtl
          : defaultTextDirection;
}

class Texts {
  Texts._();
  static S get to => S.of(Get.context!);
}
