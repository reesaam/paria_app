import 'package:base_flutter_clean_getx_app/data/resources/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension LanguageName on Locale {
  String get getLanguageName => getLanguage.name.capitalizeFirst!;
}

extension LanguageModel on Locale {
  AppLanguages get getLanguage {
    AppLanguages language = AppLanguages.english;
    switch(languageCode) {
      case 'en': language = AppLanguages.english; break;
      case 'de': language = AppLanguages.deutsch; break;
      case 'fa': language = AppLanguages.persian; break;
      default: break;
    }
    return language;
  }
}