import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  AppSnackBar(BuildContext context);

  static showSnackBar({
    required String text,
    String? title,
  }) {
    GetSnackBar(
      message: text,
      title: title,
      snackPosition: SnackPosition.TOP,
      animationDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 3),
      isDismissible: true,
    ).show();
  }
}
