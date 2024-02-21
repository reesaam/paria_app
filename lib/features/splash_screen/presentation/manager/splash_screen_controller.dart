import 'package:get/get.dart';
import 'package:paria_app/core/app_routing/routing.dart';

import '../../../../app/components/main_components/app_dialogs.dart';
import '../../../../app/functional_components/connectivity/connectivity.dart';
import '../../../../app/functional_components/permissions/permissions.dart';
import '../../../../core/app_localization.dart';
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
        ? goToHomePage()
        : showUpdateDialog();
  }

  showUpdateDialog() => AppDialogs().appAlertDialogWithOkCancel(
      Texts.to.updateNewVersion, Texts.to.updateApprove, goToUpdate, false);


  goToUpdate() {
    goToHomePage();
    goToUpdatePage();
  }
}
