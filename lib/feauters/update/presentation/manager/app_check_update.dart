import 'package:base_flutter_clean_getx_app/core/network/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../../../core/core_functions.dart';
import '../../../../data/info/app_urls.dart';
import '../../../../data/resources/app_texts.dart';

class AppCheckUpdate {
  Future<String> checkVersion() async {
    String version = AppTexts.generalNotAvailableInitials;
    final Response response;

    try {
      response = await Dio().get(AppURLs.appUrlResamHostVersion);
      if (response.statusCode == 200) {
        appDebugPrint('Data HTTP Get:');
        appDebugPrint('Data body: ${response.data}');
        appDebugPrint('Status Code: ${response.statusCode}');
        response.statusCode == 200 ? version = response.data : null;
      }
    } on DioException catch (ex) {
      appDebugPrint(ex);
    } catch (ex) {
      appDebugPrint(ex);
    }
    return version;
  }
}
