import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/main_components/app_dialogs.dart';
import '../data/data_models/core_data_models/app_page_detail/app_page_detail.dart';
import '../data/resources/app_texts.dart';
import '../data/storage/app_local_storage.dart';
import '../data/storage/app_shared_preferences.dart';
import 'dependency_injection/di.dart';

var _storage = diCore<AppLocalStorage>();
var _prefs = diCore<AppSharedPreferences>();

bool get isRelease => false;

void appDebugPrint(message) => isRelease ? null : debugPrint('$message');

void goToPage(AppPageDetail page) => page.bottomBarItemNumber == -1
    ? Get.toNamed(page.pageRoute!)
    : Get.offAllNamed(page.pageRoute!);

void popPage() {
  Get.back();
}

void saveAppData() {
  _prefs.saveData();
}

void loadAppData() {
  _prefs.loadData();
}

void clearAppData() {
  _storage.clearStorage();
  _prefs.clearData();
  appDebugPrint('** All App Data Cleared **');
}

Future<bool> onBackButtonPressed(AppPageDetail pageDetail) async {
  bool response = true;
  pageDetail.bottomBarItemNumber == -1
      ? null
      : {appExitDialog(), response = false};
  return response;
}

void appExitDialog() => AppDialogs.appAlertDialogWithOkCancel(
    AppTexts.appExit, AppTexts.areYouSure, appExit, true);

void appExit() {
  appDebugPrint('** App Exit Triggered **');
  _prefs.saveData();
  appDebugPrint('** All App Data Saved **');
  exit(0);
}
