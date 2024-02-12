import 'package:intl/intl.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_locale.dart';
import 'package:paria_app/core/app_localization.dart';
import 'package:paria_app/data/resources/app_enums.dart';

extension CurrencyNull on int? {
  String get toCurrency => this == null ? '' : (this as int).toCurrency;
}

extension Currency on int {
  String get toCurrency =>
      NumberFormat.decimalPattern(AppLocalization.english.toString())
          .format(this);
}
