import 'package:flutter/material.dart';

import '../../../../core/core_widgets.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../../../app/components/general_widgets/app_dividers.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../core/app_localization.dart';

class SettingsWidgets {
  Widget widgetSettingSection(Widget title, List<Widget> widgets) => Padding(
      padding: AppPaddings.settingsSection,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        title,
        AppDividers.settingsDivider,
        Column(children: widgets),
      ]));

  Widget widgetSectionTitle(String text) =>
      Text(text, style: AppTextStyles.settingsSectionTitle);

  Widget widgetSettingItem(
          String text, Widget? leading, Function? wholeItemFunction) =>
      InkWell(
          onTap: wholeItemFunction == null ? null : () => wholeItemFunction(),
          child: Padding(
              padding: AppPaddings.settingsItem,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: AppTextStyles.settingsSectionItem),
                    leading ?? shrinkSizedBox,
                  ])));

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
