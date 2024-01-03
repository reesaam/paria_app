import 'package:base_flutter_clean_getx_app/features/about/presentation/widgets/about_items_widgets.dart';
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
  Widget get body => Column(
      children: List<Widget>.generate(
          controller.listItems.length,
          (index) => AboutSectionWidget(
              titleText: controller.listTitles[index],
              itemText: controller.listItems[index])));
}
