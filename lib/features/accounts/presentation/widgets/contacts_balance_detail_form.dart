import 'package:flutter/material.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_colors.dart';
import '../../../../data/resources/app_elements.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../domain/entities/account_balance_entity/account_balance_entity.dart';

class ContactsBalanceItemDetailForm extends StatelessWidget {
  final AppAccountBalanceEntity balance;
  const ContactsBalanceItemDetailForm({super.key, required this.balance});

  @override
  Widget build(BuildContext context) => ListView.builder(
      shrinkWrap: true,
      itemCount: balance.count,
      itemBuilder: (context, index) => Container(
          decoration: AppElements.shapeBoxDecoration.copyWith(color: index % 2 == 0 ? null : AppColors.appDefaultColor.withOpacity(0.1)),
          padding: AppPaddings.contactsBalanceItemDetailsItem,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(balance.records?[index].description ?? Texts.to.notAvailableInitials), Text(balance.records?[index].amount.toCurrency ?? '')])));
}
