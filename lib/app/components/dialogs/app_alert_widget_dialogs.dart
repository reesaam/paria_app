import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_widgets.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../data/resources/app_text_styles.dart';
import '../buttons/app_general_button.dart';
import '../general_widgets/app_dividers.dart';

class AppAlertWidgetDialogs {
  _onTapCancel() => popPage();

  withOkCancel(
      {String? title,
      required Widget widget,
      required Function() onTapOk,
      bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: onTapOk),
      AppGeneralButton(text: Texts.to.cancel, onTap: _onTapCancel),
    ];
    await _appAlertWidgetDialog(
        title: title, widget: widget, buttons: buttons, dismissible: dismissible);
  }

  withOk(
      {String? title,
      required Widget widget,
      required Function() onTapOk,
      bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: onTapOk),
    ];
    await _appAlertWidgetDialog(
        title: title, widget: widget, buttons: buttons, dismissible: dismissible);
  }

  _appAlertWidgetDialog(
          {String? title,
          required Widget widget,
          required List<Widget> buttons,
          bool? dismissible}) async =>
      await showDialog(
          context: Get.context!,
          useSafeArea: true,
          useRootNavigator: true,
          barrierDismissible: dismissible ?? false,
          builder: (context) => Container(
              padding: AppPaddings.generalAlertDialog,
              child: AlertDialog(
                backgroundColor: AppColors.appBackground,
                shape: AppElements.defaultAlertBorderShape,
                title: title == null
                    ? shrinkSizedBox
                    : Column(children: [
                        Text(title, style: AppTextStyles.dialogAlertTitle),
                        AppDividers.generalDividerWithAppDefaultColor,
                      ]),
                content: widget,
                actions: [_renderButtonsAlertWidgetDialog(buttons)],
                actionsOverflowAlignment: OverflowBarAlignment.center,
                actionsOverflowDirection: VerticalDirection.down,
                actionsAlignment: MainAxisAlignment.center,
              )));

  Widget _renderButtonsAlertWidgetDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(
          Expanded(flex: length > 1 ? (30 ~/ length) : 10, child: buttons[i]));
      list.add(shrinkOneExpanded);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list);
  }
}
