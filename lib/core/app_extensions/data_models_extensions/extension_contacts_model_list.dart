import 'package:get/get.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/contacts/data/models/contact_model/contact_model.dart';

///Save Storage
extension RxStorage on Rx<AppContactModelsList> {
  void saveOnStorage() async => value.saveOnStorage();
}

extension Storage on AppContactModelsList {
  void saveOnStorage() async =>
      await AppLocalStorage.to.saveContacts(contacts: this);
  AppContactModelsList get loadFromStorage => AppLocalStorage.to.loadContacts();
}
