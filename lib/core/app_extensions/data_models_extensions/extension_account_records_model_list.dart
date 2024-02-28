import 'package:get/get.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/accounts/data/models/account_record_model/account_record_model.dart';

///Save Storage
extension RxStorage on Rx<AppAccountRecordModelsList> {
  void saveOnStorage() async => value.saveOnStorage();
}

extension Storage on AppAccountRecordModelsList {
  void saveOnStorage() async =>
      await AppLocalStorage.to.saveAccountRecords(accountRecords: this);
  AppAccountRecordModelsList get loadFromStorage =>
      AppLocalStorage.to.loadAccountRecords();
}
