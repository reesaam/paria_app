import 'package:intl/intl.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_locale.dart';
import 'package:paria_app/core/app_localization.dart';

extension CurrencyNull on int? {
  String get toCurrency => this == null ? '' : (this as int).toCurrency;
}

extension Currency on int {
  String get toCurrency =>
      NumberFormat.decimalPattern(AppLocalization.english.getLanguageName).format(this);
}