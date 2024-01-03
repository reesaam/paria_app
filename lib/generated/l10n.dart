// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Base Flutter Clean GetX App`
  String get app_name {
    return Intl.message(
      'Base Flutter Clean GetX App',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get pageHomepage {
    return Intl.message(
      'Home',
      name: 'pageHomepage',
      desc: '',
      args: [],
    );
  }

  /// `Splash Screen`
  String get pageSplashScreen {
    return Intl.message(
      'Splash Screen',
      name: 'pageSplashScreen',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get pageSettings {
    return Intl.message(
      'Settings',
      name: 'pageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get pageUpdate {
    return Intl.message(
      'Update',
      name: 'pageUpdate',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get pageAbout {
    return Intl.message(
      'About',
      name: 'pageAbout',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get setting_language_modal {
    return Intl.message(
      'Select Language',
      name: 'setting_language_modal',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
