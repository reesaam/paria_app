import 'package:flutter/material.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_date_time.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/core_functions.dart';
import 'package:paria_app/core/core_widgets.dart';
import 'package:paria_app/data/resources/app_colors.dart';
import 'package:paria_app/data/resources/app_text_styles.dart';
import 'package:paria_app/features/accounts/domain/entities/account_record_entity/account_record_entity.dart';
import 'package:paria_app/features/accounts/domain/entities/accounts_filter_entity/accounts_filter_entity.dart';

import '../../../../app/components/general_widgets/app_check_box.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_paddings.dart';

class AccountsRecordsTable extends StatelessWidget {
  final AppAccountRecordEntitiesList listRecords;
  final AppAccountsFilterEntity? filter;
  final bool showCleared;
  const AccountsRecordsTable({
    super.key,
    required this.listRecords,
    required this.showCleared,
    this.filter,
  });

  @override
  Widget build(BuildContext context) => Column(children: [
        _header(),
        _tableItems(),
      ]);

  _header() => Container();

  _tableItems() => listRecords.isEmpty
      ? _noRecords()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: listRecords.count,
          itemBuilder: (context, index) => filter == null
              ? _recordItem(listRecords.membersList[index])
              : _checkVisibility(
                      filter: filter!,
                      record: listRecords.membersList[index],
                      showCleared: showCleared)
                  ? shrinkSizedBox
                  : _recordItem(listRecords.membersList[index]));

  _noRecords() => Container(
      padding: AppPaddings.accountsNoRecordText,
      child: Text(Texts.to.accountsNoContacts));

  _recordItem(AppAccountRecordEntity record) => GestureDetector(
        child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            // shape: AppElements.cardTransparentOutlineBorderWithNoRadius,
            child: Row(children: [
              AppCheckBox(
                  value: record.cleared == true,
                  onChanged: (checked) => _changeRecordClearanceStatus(
                      record: record, checked: checked)),
              Text(
                  record.contact!.firstName ??
                      Texts.to.generalNotAvailableInitials,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Text(record.title ?? Texts.to.generalNotAvailableInitials,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(record.amount.toCurrency,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: record.amount! < 0
                      ? AppTextStyles.accountsTableItem
                          .copyWith(color: AppColors.error)
                      : AppTextStyles.accountsTableItem
                          .copyWith(color: AppColors.noError)),
              Text(record.dateTime!.toDateFormat,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ])),
      );

  bool _checkVisibility({
    required AppAccountsFilterEntity filter,
    required AppAccountRecordEntity record,
    required bool showCleared,
  }) {
    bool filtered = false;

    //Contact
    filter.contact == null
        ? null
        : filter.contact.equalTo(record.contact)
            ? null
            : filtered = true;

    //Description
    filter.description == null || filter.description == ''
        ? null
        : record.title == null || record.title == ''
            ? null
            : filtered = !record.title!.contains(filter.description!);

    //AmountDown
    filter.amountDown == null
        ? null
        : record.amount! < filter.amountDown!
            ? filtered = true
            : null;

    //AmountUp
    filter.amountUp == null
        ? null
        : filtered = record.amount! > filter.amountUp!;

    //DateTimeDown
    filter.dateTimeDown == null
        ? false
        : filtered = record.dateTime!.isBefore(filter.dateTimeDown!);

    //DateTimeUp
    filtered = filter.dateTimeUp == null
        ? false
        : filtered = record.dateTime!.isAfter(filter.dateTimeUp!);

    filtered = !showCleared && record.cleared == true;

    appDebugPrint('Filtered: $filtered');
    return filtered;
  }

  _changeRecordClearanceStatus({
    required AppAccountRecordEntity record,
    required bool? checked,
  }) {
    checked == true
        ? listRecords.clearRecord(record)
        : listRecords.unClearRecord(record);
  }
}
