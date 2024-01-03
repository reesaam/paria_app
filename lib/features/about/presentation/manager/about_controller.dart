import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class AboutController extends CoreController {

  List<String> listTitles = List.empty(growable: true);
  List<String> listItems = List.empty(growable: true);

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.about;
  }
}