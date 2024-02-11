import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../app/functional_components/connectivity/connectivity.dart';
import '../../../../app/functional_components/persmissions/permissions.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/app_routing/app_routes.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_logos.dart';

class SplashScreenController extends CoreController {
  late bool internetStatus;
  late String availableUpdate;
  late String permissionsStatus;

  late String logoSource;
  late String appName;
  late String appVersion;

  @override
  void dataInit() async {
    // clearAppData();
    // loadAppData();
    availableUpdate = await checkAvailableVersion();
    permissionsStatus = await AppPermissions.to.checkAllPermissions();
    appDebugPrint(availableUpdate);
    appDebugPrint(permissionsStatus);
    appDebugPrint('SplashScreen DataInit Finish');
  }
  late String availableUpdate;
  late String permissionsStatus;

  late String logoSource;
  late String appName;
  late String appVersion;

  @override
  void dataInit() async {
    // clearAppData();
    // loadAppData();
    // availableUpdate = await checkAvailableVersion();
    availableUpdate = AppInfo.appCurrentVersion;
    permissionsStatus = await AppPermissions.to.checkAllPermissions();
    appDebugPrint(availableUpdate);
    appDebugPrint(permissionsStatus);
    appDebugPrint('SplashScreen DataInit Finish');
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.splashScreen;

    logoSource = AppLogos.appAnimatedLogo;
    appName = AppInfo.appName;
    appVersion = '${Texts.to.version}: ${AppInfo.appCurrentVersion}';

    logoSource = AppLogos.appLogo;
    appName = AppInfo.appName;
    appVersion = '${Texts.to.version}: ${AppInfo.appCurrentVersion}';
  }

  @override
  void onReadyFunction() async {
    internetStatus = await ConnectionChecker.to.checkInternet();
    internetStatus
        ? null
        : await AppDialogs().appAlertDialogWithOk(
            Texts.to.connectionInternetNotAvailableTitle,
            Texts.to.connectionInternetNotAvailableText,
            popPage,
            false);
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 4));
    availableUpdate == AppInfo.appCurrentVersion
        ? goToHomepage()
        : showUpdateDialog();
  }

  showUpdateDialog() => AppDialogs().appAlertDialogWithOkCancel(Texts.to.updateNewVersion,
      Texts.to.updateApprove, goToUpdatePage, false);

  goToHomepage() => Get.offAndToNamed(AppRoutes.homePage);
  goToUpdatePage() => Get.offAndToNamed(AppRoutes.homePage)
      ?.then((value) => Get.toNamed(AppRoutes.update));

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 4));
    availableUpdate == AppInfo.appCurrentVersion
        ? goToHomepage()
        : showUpdateDialog();
  }

  showUpdateDialog() => AppDialogs().appAlertDialogWithOkCancel(
      Texts.to.updateNewVersion, Texts.to.updateApprove, goToUpdatePage, false);

  goToHomepage() => Get.offAndToNamed(AppRoutes.homePage);

  goToUpdatePage() => Get.offAndToNamed(AppRoutes.homePage)
      ?.then((value) => Get.toNamed(AppRoutes.update));
}
