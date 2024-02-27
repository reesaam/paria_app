import 'package:flutter/material.dart';
import 'package:paria_app/app/components/general_widgets/app_dividers.dart';
import 'package:paria_app/core/app_extensions/data_models_extensions/extension_contact.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_date_time.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_icon.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_int.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';

import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_sizes.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../domain/entities/account_record_entity/account_record_entity.dart';

class ShowAccountRecordFormWidget extends StatelessWidget {
  final AppAccountRecordEntity record;
  const ShowAccountRecordFormWidget({super.key, required this.record});

  @override
  Widget build(BuildContext context) => Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(Texts.to.accountShowRecordTitle.withDoubleDots,
            style: AppTextStyles.accountsShowRecordTitle),
        AppDividers.generalDividerWithAppDefaultColor,
        AppSpaces.h20,
        // _widgetInfoItem(Icon(Icons.numbers), 'ID:', record.id ?? ''),
        _widgetInfoItem(
            AppIcons.contacts,
            Texts.to.accountShowRecordContact.withDoubleDots,
            record.contact?.getContactFullName ?? ''),
        _widgetInfoItem(
            AppIcons.description,
            Texts.to.accountShowRecordDescription.withDoubleDots,
            record.title ?? ''),
        _widgetInfoItem(
            AppIcons.currency,
            Texts.to.accountShowRecordAmount.withDoubleDots,
            record.amount.toCurrency ?? ''),
        _widgetInfoItem(
            AppIcons.dateTime,
            Texts.to.accountShowRecordDateTime.withDoubleDots,
            record.dateTime?.toLocal().toDateTimeFormat ?? ''),
        _widgetInfoItem(
            AppIcons.info,
            Texts.to.accountShowRecordClearedStatus.withDoubleDots,
            record.cleared == true
                ? Texts.to.accountShowRecordCleared
                : Texts.to.accountShowRecordUncleared),
      ]));

  Widget _widgetInfoItem(Icon icon, String title, String item) => Padding(
      padding: AppPaddings.accountsShowRecordItem,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          icon.withSize(AppSizes.accountsShowRecordIcon),
          AppSpaces.w10,
          Text(title, style: AppTextStyles.accountsShowRecordInfoTitle)
        ]),
        AppSpaces.w50,
        Flexible(
          child: Text(item,
              style: AppTextStyles.accountsShowRecordInfoItem,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
      ]));
}
