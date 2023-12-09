import 'dart:io';
import 'package:base_flutter_clean_getx_app/feauters/update/domain/use_cases/update_download_address_usecase.dart';
import 'package:base_flutter_clean_getx_app/feauters/update/domain/use_cases/update_download_usecase.dart';

import 'package:base_flutter_clean_getx_app/feauters/update/data/repositories/update_repository.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart' as file_plus;
import 'package:path_provider/path_provider.dart';

import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/general_widgets/app_progress_indicator.dart';
import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/main_components/app_dialogs.dart';

class UpdateController extends CoreController {
  Rx<String> availableVersion = AppTexts.generalNotAvailable.obs;

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
    AppDialogs.appBottomDialogWithoutButton(AppTexts.updateCheckingUpdate,
        AppProgressIndicator.linearDefault(), false);

    String version = await checkAvailableVersion();
    popPage();

    if (version == AppInfo.appCurrentVersion) {
      appDebugPrint('No New Version Available');
      AppSnackBar.show(AppTexts.updateNoUpdateFound);
    } else {
      appDebugPrint('Available Version: $version');
      availableVersion.value = version;
      AppSnackBar.show(AppTexts.updateUpdateFound);
    }
  }

  downloadUpdate() async {
    AppDialogs.appBottomDialogWithoutButton(AppTexts.updateDownloading,
        AppProgressIndicator.linearDefault(), false);

    dlDir = await getExternalStorageDirectory();

    dlDir == null
        ? alertDirectoryOrFileNotFound(true)
        : {
            dlFile = File('${dlDir!.path}/${AppTexts.updateAppFilename}'),
            dlFile == null
                ? alertDirectoryOrFileNotFound(false)
                : {
                    dlFile!.existsSync() ? dlFile!.deleteSync() : null,
                    downloadAction(),
                  }
          };
  }

  downloadAction() async {
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
      });
    }

    AppSnackBar.show(AppTexts.updateDownloaded);

    AppDialogs.appAlertDialogWithOkCancel(AppTexts.updateInstallationTitle,
        AppTexts.updateInstallationContent, installUpdate, true);
  }

  void installUpdate() => file_plus.OpenFile.open(dlFile!.path);

  alertDirectoryOrFileNotFound(bool directoryError) =>
      AppDialogs.appAlertDialogWithOk(
          directoryError
              ? AppTexts.updateDirectoryNotFoundTitle
              : AppTexts.updateFileNotFoundTitle,
          directoryError
              ? AppTexts.updateDirectoryNotFoundContent
              : AppTexts.updateFileNotFoundContent,
          Get.back,
          true);

  checkAvailableUpdate() =>
      availableVersion.value == AppInfo.appCurrentVersion ||
      availableVersion.value == AppTexts.generalNotAvailable;
}
