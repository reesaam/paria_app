import 'package:flutter/material.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_paddings.dart';

class SettingsLanguageWidgets {
  Widget widgetSelectLanguageForm(Function function) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          AppLocalization.languages.length,
              (index) => InkWell(
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      padding: AppPaddings.modalItems,
                      child: Text(
                          AppLocalization.languages[index].getLanguageName))),
              onTap: () => function(index))));
}