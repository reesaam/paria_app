
import '../../core/elements/core_controller.dart';
import '../../data/info/app_page_details.dart';

class AboutController extends CoreController {

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.about;
  }
}