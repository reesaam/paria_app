import '../../../../app/functional_components/connectivity/connectivity.dart';
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
    internetStatus = await ConnectionChecker().checkInternet();
    super.onReadyFunction();
  }
}
