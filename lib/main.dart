import 'package:base_flutter_clean_getx_app/core/app_router/app_router.dart';
import 'package:base_flutter_clean_getx_app/data/info/app_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      routerConfig: AppRouter().config(),
    );
  }
}