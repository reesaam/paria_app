import 'package:flutter/material.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';

import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_paddings.dart';

class AccountsSummary extends StatelessWidget {
  final int itemsBalance;
  final int itemsCount;
  final int itemsCountContacts;
  const AccountsSummary({
    super.key,
    required this.itemsBalance,
    required this.itemsCount,
    required this.itemsCountContacts,
  });

  @override
  Widget build(BuildContext context) => Card(
      child: Padding(
          padding: AppPaddings.accountsTopBar,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Texts.to.accountsSummaryBalance.withDoubleDots),
              Text(Texts.to.accountsSummaryItemCount.withDoubleDots),
              Text(Texts.to.accountsSummaryContactsCount.withDoubleDots),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(itemsBalance.toCurrency),
              Text(itemsCount.toString()),
              Text(itemsCountContacts.toString()),
            ]),
          ])));
}
