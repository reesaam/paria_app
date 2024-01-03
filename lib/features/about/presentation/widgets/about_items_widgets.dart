import 'package:flutter/material.dart';

class AboutSectionWidget extends StatelessWidget {
  final String titleText;
  final String itemText;
  const AboutSectionWidget({super.key, required this.titleText, required this.itemText});

  Widget _title() => Container();

  Widget _item() => Container();

  @override
  Widget build(BuildContext context) => Column(children: [_title(), _item()]);
}
