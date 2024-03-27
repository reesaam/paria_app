import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:paria_app/features/splash_screen/presentation/manager/splash_screen_controller.dart';

@GenerateNiceMocks([MockSpec<SplashScreenController>()])
import 'splash_screen_controller_test.mocks.dart';

void main() {
  final MockSplashScreenController controller = MockSplashScreenController();

  group('Data Initialization', () {
    setUp(() {
      controller.dataInit();
      controller.pageInit();
    });

    test('Data Initialization', () {
      expect(controller.permissionsStatus, isNotNull);
      expect(controller.internetStatus, isNotNull);
    });

    test('Page Initialization', () {
      expect(controller.pageDetail, isNotNull);
      expect(controller.logoSource, isNotNull);
      expect(controller.appName, isNotNull);
      expect(controller.appVersion, isNotNull);
    });

    test('Update', () {
      if(controller.internetStatus) {
        expect(controller.availableUpdate, isNotNull);
      }
    });
  });
}
