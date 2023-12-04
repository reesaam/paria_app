import 'package:base_flutter_clean_getx_app/core/app_bindings/core_bindings.dart';
import 'package:base_flutter_clean_getx_app/core/app_routing/app_pages.dart';
import 'package:base_flutter_clean_getx_app/core/app_routing/app_routes.dart';
import 'package:base_flutter_clean_getx_app/data/info/app_info.dart';
import 'package:base_flutter_clean_getx_app/data/resources/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  CoreBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      initialBinding: CoreBindings(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.startPage,
      theme: AppThemes.mainTheme,
      supportedLocales: const [Locale('en')],
    );
  }
}