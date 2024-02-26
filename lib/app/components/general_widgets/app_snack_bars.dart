import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/info/app_defaults.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_paddings.dart';

class AppSnackBar {
  AppSnackBar._();

  static showSnackBar({
    required String text,
    String? title,
  }) {
    GetSnackBar(
      message: text,
      title: title,
      padding: AppPaddings.snackBar,
      backgroundColor: AppColors.snackBarBackground,
      snackPosition: appDefaultSnackPosition,
      animationDuration: appSnackBarDefaultAnimationDuration,
      duration: appSnackBarDefaultDuration,
      isDismissible: true,
    ).show();
  }
}
