import 'package:flutter/material.dart';

import '../../../core/core_widgets.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_text_styles.dart';
import '../general_components/app_dividers.dart';

class SettingsComponents {
  static Widget widgetSettingSection(Widget title, List<Widget> widgets) =>
      Padding(
          padding: AppPaddings.settingsSection,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            title,
            AppDividers.settingsDivider,
            Column(children: widgets),
          ]));

  static Widget widgetSectionTitle(String text) =>
      Text(text, style: AppTextStyles.settingsSectionTitle);

  static Widget widgetSettingItem(
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
}
