import 'package:flutter/material.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_account_records_entity_list.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_accounts_filter_entity.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_date_time.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';

import '../../../../core/app_localization.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/core_widgets.dart';
import '../../../../data/resources/app_colors.dart';
import '../../../../data/resources/app_elements.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';
import '../../domain/entities/accounts_filter_entity/accounts_filter_entity.dart';

class AccountsRecordsTable extends StatelessWidget {
  final AppAccountRecordEntitiesList listRecords;
  final AppAccountsFilterEntity? filter;
  final Function(AppAccountRecordEntity) onTap;
  final Function(AppAccountRecordEntity) onLongPress;
  const AccountsRecordsTable({
    super.key,
    required this.listRecords,
    required this.onTap,
    required this.onLongPress,
    this.filter,
  });

  final List<int> _itemsExpansionList = const [8, 16, 4];

  @override
  Widget build(BuildContext context) => Padding(
      padding: AppPaddings.accountsTable,
      child: listRecords.isEmpty
          ? _noRecords()
          : ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: listRecords.count,
              itemBuilder: (context, index) => filter.isEmpty
                  ? listRecords.recordsList[index].cleared == true
                      ? shrinkSizedBox
                      : _recordItem(listRecords.recordsList[index])
                  : _checkVisibility(
                          filter: filter!,
                          record: listRecords.recordsList[index])
                      ? shrinkSizedBox
                      : _recordItem(listRecords.recordsList[index])));

  _noRecords() => Container(
      padding: AppPaddings.accountsNoRecordText,
      child: Text(Texts.to.accountsNoContacts));

  _recordItem(AppAccountRecordEntity record) => GestureDetector(
      onTap: () => onTap(record),
      onLongPress: () => onLongPress(record),
      child: Container(
        padding: AppPaddings.accountsTableItem,
        decoration: AppElements.shapeBoxDecoration.copyWith(
            color: record.cleared == true
                ? AppColors.appDefaultColor.withOpacity(0.2)
                : null),
        child: Row(children: [
          shrinkOneExpanded,
          Expanded(
              flex: _itemsExpansionList[0],
              child: Text(
                  record.contact!.firstName ??
                      Texts.to.generalNotAvailableInitials,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis)),
          shrinkOneExpanded,
          Expanded(
              flex: _itemsExpansionList[1],
              child: Text(record.description ?? Texts.to.generalNotAvailableInitials,
                  maxLines: 1, overflow: TextOverflow.ellipsis)),
          shrinkOneExpanded,
          Expanded(
              flex: _itemsExpansionList[2],
              child: Text(record.amount.toCurrency,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: record.amount! < 0
                      ? AppTextStyles.accountsTableItem
                          .copyWith(color: AppColors.error)
                      : AppTextStyles.accountsTableItem
                          .copyWith(color: AppColors.noError))),
          shrinkOneExpanded,
        ]),
      ));

  bool _checkVisibility({
    required AppAccountsFilterEntity? filter,
    required AppAccountRecordEntity record,
  }) {
    List<bool> filterList = List<bool>.empty(growable: true);
    if (filter.isNotEmpty) {
      filterList.add(filter!.contact.equalTo(record.contact));
      if (filter.description != null) {
        filterList.add(record.description?.contains(filter.description!) ?? false);
      }
      filterList.add(filter.cleared != true && record.cleared == true);
      filterList.add(filter.positives == true && record.amount! < 0);
      filterList.add(filter.negatives == true && record.amount! > 0);
      if (filter.amountDown != null) {
        filterList.add(record.amount! < filter.amountDown!);
      }
      if (filter.amountUp != null) {
        filterList.add(record.amount! > filter.amountUp!);
      }
      if (filter.dateTimeDown != null) {
        filterList.add(record.dateTime!.isBefore(filter.dateTimeDown!));
      }
      if (filter.dateTimeUp != null) {
        filterList.add(record.dateTime!.isAfter(filter.dateTimeUp!));
      }
      filterList.add(filter.cleared != true && record.cleared == true);
    }

    appDebugPrint('Filtered: ${filterList.contains(true)}');
    return filterList.contains(true);
  }
}
