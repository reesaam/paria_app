import 'package:get/get.dart';
import 'package:paria_app/app/components/general_widgets/app_snack_bars.dart';
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
  late String availableUpdate = AppInfo.appCurrentVersion;
  late String permissionsStatus;

  late String logoSource;
  late String appName;
  late String appVersion;

  @override
  void dataInit() async {
    permissionsStatus = await AppPermissions.to.checkAllPermissions();
    appDebugPrint('Permission Status: $permissionsStatus}');
    internetStatus = await ConnectionChecker.to.checkInternet();
    internetStatus
        ? availableUpdate = await checkAvailableVersion()
        : noInternetConnectionSnackBar();
    appDebugPrint('Available Update: $availableUpdate');
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
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 4));
    availableUpdate == AppInfo.appCurrentVersion
        ? goToHomePage()
        : _showUpdateDialog();
  }

  _showUpdateDialog() => AppDialogs().appAlertDialogWithOkCancel(
      title: Texts.to.updateNewVersion,
      text: Texts.to.updateApprove,
      onTapOk: _goToUpdate);

  _goToUpdate() {
    goToHomePage();
    goToUpdatePage();
  }
}
