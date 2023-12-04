import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static show(String text) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
