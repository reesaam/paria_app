import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_clean_getx_app/core/app_router/app_routes.dart';
import 'package:injectable/injectable.dart';

import '../../app/views/about_view.dart';
import '../../app/views/homepage_view.dart';
import '../../app/views/settings_view.dart';
import '../../app/views/splash_screen_view.dart';
import '../../app/views/update_view.dart';

part 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: SplashScreenRoute.page, path: AppRoutes.splashScreen),
    AutoRoute(initial: true, page: HomeRoute.page, path: AppRoutes.homePage),
    AutoRoute(initial: true, page: SettingsRoute.page, path: AppRoutes.settings),
    AutoRoute(initial: true, page: UpdateRoute.page, path: AppRoutes.update),
    AutoRoute(initial: true, page: AboutRoute.page, path: AppRoutes.about),
  ];
}