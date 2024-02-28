import '../../../data/models/contact_model/contact_model.dart';
import 'contact_entity.dart';

extension OnAppContactEntity on AppContactEntity {
  AppContactModel get mapper => AppContactModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      phone: phone,
      email: email,
      webLink: webLink,
      profilePicture: profilePicture,
      accountRecordsCounter: accountRecordsCounter,
      balance: balance);
}

extension OnAppContactModel on AppContactModel {
  AppContactEntity get mapper => AppContactEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      phone: phone,
      email: email,
      webLink: webLink,
      profilePicture: profilePicture,
      accountRecordsCounter: accountRecordsCounter,
      balance: balance);
}

extension OnAppContactEntityNull on AppContactEntity? {
  AppContactModel get mapper => this?.mapper ?? const AppContactModel();
}

extension OnAppContactModelNull on AppContactModel? {
  AppContactEntity get mapper => this?.mapper ?? const AppContactEntity();
}
