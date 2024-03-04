import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;

import '../../../../../core/app_localization.dart';
import '../../../../../core/core_functions.dart';
import '../../../../../data/info/app_urls.dart';
import 'update_remote_data_source.dart';
import '../../../../../core/network/network_exception.dart';

class UpdateRemoteDataSourceImpl implements UpdateRemoteDataSource {
  Dio dio = get_x.Get.find<Dio>();
  UpdateRemoteDataSourceImpl();

  @override
  Future<Either<NetworkException, String>> getDownloadAddress() async{
    String address = Texts.to.notAvailableInitials;
    final Response response;
    try {
      response = await Dio().get(AppURLs.appUrlUpdateAddress);
      if (response.statusCode == 200) {
        appDebugPrint('Getting Update Download Address...');
        appDebugPrint('Data body: ${response.data}');
        appDebugPrint('Status Code: ${response.statusCode}');
        address = response.data;
        return Right(address);
      }
      return Left(NetworkException.handleResponse(response));
    } on DioException catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.parsingDataException());
    }
  }

  @override
  Future<Either<NetworkException, String>> getAvailableVersion() async {
    String version = Texts.to.notAvailableInitials;
    final Response response;
    try {
      response = await Dio().get(AppURLs.appUrlUpdateVersion);
      if (response.statusCode == 200) {
        appDebugPrint('Getting Available Version...');
        appDebugPrint('Data body: ${response.data}');
        appDebugPrint('Status Code: ${response.statusCode}');
        version = response.data;
        return Right(version);
      }
      return Left(NetworkException.handleResponse(response));
    } on DioException catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.parsingDataException());
    }
  }

  @override
  Future<Either<NetworkException, File?>> updateDownload() async {
    final Response response;
    File? file;

    try {
      response = await dio.get(AppURLs.appUrlUpdateAPKDownload);
      if (response.statusCode == 200) {
        appLogPrint('Downloading App...');
        appDebugPrint('Data body: ${response.data}');
        appDebugPrint('Status Code: ${response.statusCode}');
        await file!.writeAsBytes(response.data);
        return Right(file);
      }
      return Left(NetworkException.handleResponse(response));
    } on DioException catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.parsingDataException());
    }
  }
}
