import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_base_clean_getx_app/data/info/app_defaults.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionChecker {
  static ConnectionChecker get to => Get.find();

  Future<bool> checkInternet() async => await InternetConnection()
      .hasInternetAccess
      .timeout(appDefaultConnectionTimeOut);

  Future<InternetStatus> checkInternetStatus() async =>
      await InternetConnection().internetStatus;

  internetListener({Function? function}) => InternetConnection()
      .onStatusChange
      .listen((status) {})
      .onData((data) => function == null ? data : function());

  Future<ConnectivityResult> checkConnection() async =>
      await Connectivity().checkConnectivity();

  connectionListener({Function? function}) => Connectivity()
      .onConnectivityChanged
      .listen((status) {})
      .onData((data) => function == null ? data : function());
}
