import 'package:flutter/material.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';

import '../../../../data/resources/app_colors.dart';

class AboutSectionWidget extends StatelessWidget {
  final String titleText;
  final String itemText;
  const AboutSectionWidget({super.key, required this.titleText, required this.itemText});

  Widget _title() => Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text(titleText.isNotEmpty ? titleText.withDoubleDots : ''));

  Widget _item() => LayoutBuilder(
      builder: (context, constraints) => Card(
          color: AppColors.appDefaultColor,
          child: Container(width: constraints.maxWidth, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: Text(itemText, style: TextStyle(color: AppColors.textNormalLight)))));

  @override
  Widget build(BuildContext context) =>
      Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_title(), _item()]));
}
