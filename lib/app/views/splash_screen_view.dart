import 'package:flutter/material.dart';

import '../../core/elements/core_view.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenPage extends CoreView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget get body => Column();
}
