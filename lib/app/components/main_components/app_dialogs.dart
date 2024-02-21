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

class AppDialogs {
  _onTapCancel() => popPage();

  appBottomDialogWithoutButton(
      {String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [];
    await _appBottomDialogGeneral(
        title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  appBottomDialogWithOk(
      {String? title,
      required Widget form,
      required Function onTapOk,
      bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: onTapOk)
    ];
    await _appBottomDialogGeneral(
        title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  appBottomDialogWithCancel(
      {String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.cancel, onTap: _onTapCancel)
    ];
    await _appBottomDialogGeneral(
        title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  appBottomDialogWithOkCancel(
      {String? title,
      required Widget form,
      required Function onTapOk,
      bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: onTapOk),
      AppGeneralButton(text: Texts.to.cancel, onTap: _onTapCancel),
    ];
    await _appBottomDialogGeneral(
        title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  appAlertDialogWithOkCancel(
      {String? title,
      required String text,
      required Function onTapOk,
      bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: onTapOk),
      AppGeneralButton(text: Texts.to.cancel, onTap: _onTapCancel),
    ];
    await _appAlertDialog(
        title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  appAlertDialogWithOk(
      {String? title,
      required String text,
      required Function onTapOk,
      bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: onTapOk),
    ];
    await _appAlertDialog(
        title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  _appBottomDialogGeneral(
          {String? title,
          required Widget form,
          required List<Widget> buttons,
          bool? dismissible}) async =>
      await showModalBottomSheet(
          context: Get.context!,
          useSafeArea: true,
          useRootNavigator: true,
          showDragHandle: true,
          isScrollControlled: true,
          isDismissible: dismissible ?? false,
          shape: AppElements.defaultModalBorderShape,
          builder: (context) => SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Padding(
                      padding: AppPaddings.generalBottomModal,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title == null
                                      ? shrinkSizedBox
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                              Text(title ?? '',
                                                  style:
                                                      AppTextStyles.modalTitle),
                                              AppDividers
                                                  .generalDividerWithAppDefaultColor,
                                              AppSpaces.h20,
                                            ]),
                                  form,
                                ]),
                            AppSpaces.h40,
                            _renderButtonsBottomDialog(buttons),
                          ])),
                  AppSpaces.h20,
                ]),
              ));

  Widget _renderButtonsBottomDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(Expanded(flex: (20 ~/ length), child: buttons[i]));
      list.add(shrinkOneExpanded);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list);
  }

  _appAlertDialog(
          {String? title,
          required String text,
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
                  content: Text(text,
                      style: AppTextStyles.dialogAlertText, softWrap: true),
                  actions: [_renderButtonsAlertDialog(buttons)],
                  actionsAlignment: MainAxisAlignment.center,
                ),
              ));

  Widget _renderButtonsAlertDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(
          Expanded(flex: length > 1 ? (10 ~/ length) : 10, child: buttons[i]));
      list.add(shrinkOneExpanded);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list);
  }
}
