import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/main_components/app_dialogs.dart';
import '../data/data_models/core_data_models/app_page_detail/app_page_detail.dart';
import '../data/resources/app_texts.dart';
import '../data/storage/app_local_storage.dart';
import '../data/storage/app_shared_preferences.dart';
import '../features/update/data/repositories/update_repository.dart';
import '../features/update/domain/use_cases/update_version_usecase.dart';

bool get isRelease => false;

void appDebugPrint(message) => isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] ** $message **');

void goToPage(AppPageDetail page) => page.bottomBarItemNumber == -1
    ? Get.toNamed(page.pageRoute!)
    : Get.offAllNamed(page.pageRoute!);

void popPage() {
  Get.back();
}

void saveAppData() {
  AppSharedPreferences.to.saveData();
}

void loadAppData() {
  AppSharedPreferences.to.loadData();
}

void clearAppData() {
  AppLocalStorage.to.clearStorage();
  AppSharedPreferences.to.clearData();
  appLogPrint('All App Data Cleared');
}

Future<bool> onBackButtonPressed(AppPageDetail pageDetail) async {
  bool response = true;
  pageDetail.bottomBarItemNumber == -1
      ? null
      : {appExitDialog(), response = false};
  return response;
}

Future<String> checkAvailableVersion() async => await UpdateVersionUseCase(
        updateRepository: UpdateRepository.to)
    .call()
    .then((value) => value.fold((l) => AppTexts.generalNotAvailable, (r) => r));

void appExitDialog() => AppDialogs.appAlertDialogWithOkCancel(
    AppTexts.appExit, AppTexts.areYouSure, appExit, true);

void appExit() {
  appLogPrint('App Exit Triggered');
  AppSharedPreferences.to.saveData();
  appLogPrint('All App Data Saved');
  exit(0);
}
