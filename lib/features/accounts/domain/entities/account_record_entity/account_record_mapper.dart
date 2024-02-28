import 'package:paria_app/features/contacts/domain/entities/contact_entity/contacts_mapper.dart';

import '../../../data/models/account_record_model/account_record_model.dart';
import 'account_record_entity.dart';

extension OnAppAccountRecordEntity on AppAccountRecordEntity {
  AppAccountRecordModel get mapper => AppAccountRecordModel(
      id: id,
      contact: contact.mapper,
      amount: amount,
      description: description,
      dateTime: dateTime,
      cleared: cleared);
}

extension OnAppContactModel on AppAccountRecordModel {
  AppAccountRecordEntity get mapper => AppAccountRecordEntity(
      id: id,
      contact: contact.mapper,
      amount: amount,
      description: description,
      dateTime: dateTime,
      cleared: cleared);
}

extension OnAppAccountRecordEntityNull on AppAccountRecordEntity? {
  AppAccountRecordModel get mapper =>
      this?.mapper ?? const AppAccountRecordModel();
}

extension OnAppContactModelNull on AppAccountRecordModel? {
  AppAccountRecordEntity get mapper =>
      this?.mapper ?? const AppAccountRecordEntity();
}
