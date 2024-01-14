import 'package:flutter/material.dart';
import 'package:flutter_base_clean_getx_app/core/app_localization.dart';
import 'package:flutter_base_clean_getx_app/data/resources/app_texts.dart';
import 'package:get/get.dart';

import '../../../data/resources/app_enums.dart';

extension LanguageName on Locale {
  String get getLanguageName => this == AppLocalization.persian
      ? AppTexts.languageNamePersian
      : getLanguage.name.capitalizeFirst!;
}

extension LanguageModel on Locale {
  AppLanguages get getLanguage {
    AppLanguages language = AppLanguages.english;
    switch (languageCode) {
      case 'en':
        language = AppLanguages.english;
        break;
      case 'de':
        language = AppLanguages.deutsch;
        break;
      case 'fa':
        language = AppLanguages.persian;
        break;
      default:
        break;
    }
    return language;
  }
}
