import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/main_components/app_dialogs.dart';
import '../data/data_models/core_data_models/app_page_detail/app_page_detail.dart';
import '../data/storage/app_local_storage.dart';
import '../features/update/data/repositories/update_repository.dart';
import 'app_localization.dart';

bool get isRelease => false;

void appDebugPrint(message) => isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] ** $message **');

void popPage() {
  Get.back();
}

void saveAppData() => AppLocalStorage.to.saveAllData();

void loadAppData() => AppLocalStorage.to.loadAllData();

void clearAppData() => AppLocalStorage.to.clearStorage();

Future<bool> onBackButtonPressed(AppPageDetail pageDetail) async {
  bool response = true;
  pageDetail.bottomBarItemNumber == -1
      ? null
      : {appExitDialog(), response = false};
  return response;
}

// Future<String> checkAvailableVersion() async => await UpdateVersionUseCase(
//         updateRepository: UpdateRepository.to)
//     .call()
//     .then((value) => value.fold((l) => Texts.to.notAvailable, (r) => r));

Future<String> checkAvailableVersion() async {
  var result = await UpdateRepository.to.getAvailableVersion();
  return result.fold((l) => Texts.to.notAvailable, (r) => r);
}

void appExitDialog() => AppDialogs().appAlertDialogWithOkCancel(
    Texts.to.appExit, Texts.to.areYouSure, appExit, true);

void appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllData();
  appLogPrint('All App Data Saved');
  exit(0);
}
