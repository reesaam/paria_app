import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizationDependencies {
    static List<Locale> get languages => [_english, _deutsch, _persian];

    static Locale get _english => const Locale('en');
    static Locale get _deutsch => const Locale('du');
    static Locale get _persian => const Locale('fa');

    static get localizationDelegates => [_material, _widgets, _cupertino];

    static get _material => GlobalMaterialLocalizations.delegate;
    static get _widgets => GlobalWidgetsLocalizations.delegate;
    static get _cupertino => GlobalCupertinoLocalizations.delegate;
}