import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart' as file_plus;
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../app/functional_components/connectivity/connectivity.dart';
import '../../../../core/app_localization.dart';
import '../../../../features/update/domain/use_cases/update_download_address_usecase.dart';
import '../../../../features/update/domain/use_cases/update_download_usecase.dart';
import '../../../../features/update/data/repositories/update_repository.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/general_widgets/app_progress_indicator.dart';
import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/main_components/app_dialogs.dart';

class UpdateController extends CoreController {
  Rx<String> availableVersion = Texts.to.notAvailable.obs;

  File? dlFile;
  Directory? dlDir;

  Rx<bool> downloaded = false.obs;

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.update;
  }

  @override
  void onInitFunction() {
    downloaded
        .listen((data) {})
        .onData((data) => data == true ? popPage() : null);
  }

  @override
  void onReadyFunction() async {
    AppInfo.checkUpdate ? await checkUpdate() : null;
  }

  checkUpdate() async {
    AppDialogs().appBottomDialogWithoutButton(
        title: Texts.to.updateCheckingUpdate,
        form: AppProgressIndicator.linear());
    bool internetStatus = await ConnectionChecker.to.checkInternet();
    popPage();
    internetStatus ? _checkUpdateFunction() : noInternetConnectionSnackBar();
  }

  _checkUpdateFunction() async {
    String version = await checkAvailableVersion();
    if (version == AppInfo.appCurrentVersion) {
      appLogPrint('No New Version Available');
      AppSnackBar().showSnackBar(message: Texts.to.updateNoUpdateFound);
    } else {
      appLogPrint('Available Version: $version');
      availableVersion.value = version;
      AppSnackBar().showSnackBar(
          message:
              '${Texts.to.updateUpdateFound}\n${Texts.to.version.withDoubleDots} $version');
    }
  }

  downloadUpdate() async {
    AppDialogs().appBottomDialogWithoutButton(
        title: Texts.to.updateDownloading, form: AppProgressIndicator.linear());
    bool internetStatus = await ConnectionChecker.to.checkInternet();
    internetStatus ? _downloadAction() : noInternetConnectionSnackBar();
  }

  _downloadAction() async {
    dlDir = await getExternalStorageDirectory();
    if (dlDir != null) {
      dlFile = File('${dlDir!.path}/${AppTexts.updateAppFilename}');
    }

    if (dlDir != null && dlFile != null) {
      dlFile!.existsSync() ? dlFile!.deleteSync() : null;
      downloaded.value = false;
      String downloadAddress = '';
      final resultAddress = await UpdateDownloadAddressUseCase(
              updateRepository: UpdateRepository.to)
          .call();
      resultAddress.fold((l) => null, (r) => downloadAddress = r);

      if (downloadAddress.isNotEmpty) {
        final result =
            await UpdateDownloadUseCase(updateRepository: UpdateRepository.to)
                .call();
        result.fold((l) => null, (r) {
          dlFile = r;
          downloaded.value = true;
          appDebugPrint(dlFile?.length());
          AppSnackBar().showSnackBar(message: Texts.to.updateDownloaded);
          AppDialogs().appAlertDialogWithOkCancel(
              title: Texts.to.updateInstallationTitle,
              text: Texts.to.updateInstallationContent,
              onTapOk: _installUpdate,
              dismissible: true);
        });
      }
    } else {
      _alertDirectoryOrFileNotFound(dlDir == null);
    }
  }

  void _installUpdate() => dlFile == null
      ? _alertDirectoryOrFileNotFound(false)
      : file_plus.OpenFile.open(dlFile!.path);

  _alertDirectoryOrFileNotFound(bool directoryError) =>
      AppDialogs().appAlertDialogWithOk(
          title: directoryError
              ? Texts.to.updateDirectoryNotFoundTitle
              : Texts.to.updateFileNotFoundTitle,
          text: directoryError
              ? Texts.to.updateDirectoryNotFoundContent
              : Texts.to.updateFileNotFoundContent,
          onTapOk: popPage,
          dismissible: true);

  checkAvailableUpdate() =>
      availableVersion.value == AppInfo.appCurrentVersion ||
      availableVersion.value == Texts.to.notAvailable;
}
