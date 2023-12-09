import 'package:flutter/material.dart';

import '../../../../core/elements/core_view.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../manager/about_controller.dart';

class AboutPage extends CoreView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body => Column();
}
