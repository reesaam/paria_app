import 'package:base_flutter_clean_getx_app/data/info/app_developer_info.dart';

import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class AboutController extends CoreController {

  List<String> listTitles = List.empty(growable: true);
  List<String> listItems = List.empty(growable: true);

  @override
  void dataInit() {
    // clearAppData();
    _fillData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.about;
  }

  _fillData() {
    listTitles = [
      'Developer Name'
    ];
    listItems = [
      AppDeveloperInfo.fullName,
    ];
  }
}