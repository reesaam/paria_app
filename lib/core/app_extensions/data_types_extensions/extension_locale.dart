import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/resources/app_enums.dart';
import '../../../data/resources/app_texts.dart';
import '../../app_localization.dart';

extension LanguageName on Locale {
  String get getLanguageName => this == AppLocalization.persian ? AppTexts.languageNamePersian : getLanguage.name.capitalizeFirst!;
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
