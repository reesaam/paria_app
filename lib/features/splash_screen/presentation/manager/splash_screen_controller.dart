import 'package:flutter_base_clean_getx_app/app/components/main_components/app_dialogs.dart';
import 'package:flutter_base_clean_getx_app/core/app_localization.dart';

import '../../../../app/functional_components/connectivity/connectivity.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class SplashScreenController extends CoreController {
  late bool internetStatus;

  @override
  void pageInit() {
    pageDetail = AppPageDetails.splashScreen;
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
    super.onReadyFunction();
  }
}
