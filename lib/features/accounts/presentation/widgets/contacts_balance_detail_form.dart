import 'package:flutter/material.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';

import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_colors.dart';
import '../../../../data/resources/app_elements.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';

class ContactsBalanceItemDetailForm extends StatelessWidget {
  final List<AppAccountRecordEntity> contactRecords;
  const ContactsBalanceItemDetailForm({super.key, required this.contactRecords});

  @override
  Widget build(BuildContext context) => ListView.builder(
      shrinkWrap: true,
      itemCount: contactRecords.length,
      itemBuilder: (context, index) => Container(
          decoration: AppElements.shapeBoxDecoration.copyWith(
              color: index % 2 == 0
                  ? AppColors.appDefaultColor.withOpacity(0.1)
                  : null),
          padding: AppPaddings.contactsBalanceItemDetailsItem,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contactRecords[index].title ??
                    Texts.to.notAvailableInitials),
                Text(contactRecords[index].amount.toCurrency)
              ])));

}