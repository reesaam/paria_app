import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/update/data/remote/data_sources/update_remote_data_source_impl.dart';
import '../../features/update/data/repositories/update_repository_impl.dart';

class AppRepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRepositoryImpl>(() => UpdateRepositoryImpl(), fenix: true);

    Get.lazyPut<UpdateRemoteDataSourceImpl>(() => UpdateRemoteDataSourceImpl(), fenix: true);

    Get.lazyPut(() => Dio(), fenix: true);
  }
}
