import 'package:flutter/material.dart';

import '../../../data/resources/app_icons.dart';

extension IconFunction on int? {
  Icon get toIcon => this == null
      ? AppIcons.none
      : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}
