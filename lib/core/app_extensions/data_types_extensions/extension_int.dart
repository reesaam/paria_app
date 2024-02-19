import 'package:flutter/material.dart';
import 'package:flutter_base_clean_getx_app/data/resources/app_icons.dart';

extension IconFunction on int? {
  Icon get toIcon => this == null
      ? AppIcons.none
      : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}
