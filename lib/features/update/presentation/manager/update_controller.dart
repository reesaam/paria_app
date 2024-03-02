import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart' as file_plus;
import 'package:path_provider/path_provider.dart';

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

    String version = await checkAvailableVersion();
    popPage();

    if (version == AppInfo.appCurrentVersion) {
      appLogPrint('No New Version Available');
      AppSnackBar().showSnackBar(message: Texts.to.updateNoUpdateFound);
    } else {
      appLogPrint('Available Version: $version');
      availableVersion.value = version;
      AppSnackBar().showSnackBar(message: Texts.to.updateUpdateFound);
    }
  }

  downloadUpdate() async {
    AppDialogs().appBottomDialogWithoutButton(
        title: Texts.to.updateDownloading, form: AppProgressIndicator.linear());

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

    AppSnackBar().showSnackBar(message: Texts.to.updateDownloaded);

    AppDialogs().appAlertDialogWithOkCancel(
        title: Texts.to.updateInstallationTitle,
        text: Texts.to.updateInstallationContent,
        onTapOk: installUpdate,
        dismissible: true);
  }

  void installUpdate() => file_plus.OpenFile.open(dlFile!.path);

  alertDirectoryOrFileNotFound(bool directoryError) =>
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
