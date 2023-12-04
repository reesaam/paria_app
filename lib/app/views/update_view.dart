import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/elements/core_view.dart';
import '../../data/info/app_info.dart';
import '../../data/resources/app_paddings.dart';
import '../../data/resources/app_spaces.dart';
import '../../data/resources/app_texts.dart';
import '../components/buttons/app_general_button.dart';
import '../components/main_components/app_bar.dart';
import '../controllers/update_controller.dart';

@RoutePage(name: 'UpdateRoute')
class UpdatePage extends CoreView<UpdateController> {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        widgetVersions(),
        AppSpaces.h40,
        widgetButtons(),
      ]);

  Widget widgetVersions() => Obx(() => Card(
          child: Column(children: [
        widgetVersion(AppTexts.updateCurrentVersion, AppInfo.appCurrentVersion),
        AppSpaces.h10,
        widgetVersion(
            AppTexts.updateAvailableVersion,
            controller.availableVersion.value == AppInfo.appCurrentVersion
                ? AppTexts.generalNotAvailable
                : controller.availableVersion.value),
      ])));

  Widget widgetVersion(String title, String version) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(version)]);

  Widget widgetButtons() => Obx(() => Padding(
      padding: AppPaddings.updateButtons,
      child: Column(children: [
        AppGeneralButton(
            text: AppTexts.updateCheckUpdate, onTap: controller.checkUpdate),
        AppGeneralButton(
            text: AppTexts.updateDownloadUpdate,
            onTap: controller.downloadUpdate,
            disabled: controller.checkAvailableUpdate()),
      ])));
}
