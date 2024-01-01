import 'core/app_bindings/core_bindings.dart';
import 'core/app_localization/app_localization_dependencies.dart';
import 'core/app_routing/app_pages.dart';
import 'core/app_routing/app_routes.dart';
import 'data/info/app_info.dart';
import 'data/resources/app_themes.dart';
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
      supportedLocales: AppLocalizationDependencies.languages,
      localizationsDelegates: AppLocalizationDependencies.localizationDelegates,
    );
  }
}