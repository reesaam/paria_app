import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/elements/core_view.dart';
import '../components/main_components/app_bar.dart';
import '../controllers/about_controller.dart';

@RoutePage(name: 'AboutRoute')
class AboutPage extends CoreView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body => Column();
}
