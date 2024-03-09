import 'package:flutter/material.dart';

import '../../../../app/components/general_widgets/app_dividers.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_contact_entity.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_elements.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_sizes.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';
import 'contact_avatar_widget.dart';

class ShowContactFormWidget extends StatelessWidget {
  final AppContactEntity contact;
  const ShowContactFormWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) => Form(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(children: [
          ContactAvatar(contact: contact, size: AppElements.contactsContactAvatarMaxRadius),
          AppSpaces.w20,
          Text(contact.getContactFullName, style: AppTextStyles.contactsShowContactFullName),
        ]),
        AppSpaces.h20,
        AppDividers.generalDivider,
        _widgetInfo(),
        _widgetAccount(),
      ]));

  Widget _title(String title) => Text(title, style: AppTextStyles.contactsShowContactSectionTitle);

  Widget _widgetInfo() => Padding(
      padding: AppPaddings.contactsShowContactItems,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _title(Texts.to.contactsShowContactTitleInfo.withDoubleDots),
        AppSpaces.h10,
        // _widgetInfoItem(Icon(Icons.numbers), 'ID:', contact.id ?? ''),
        _widgetInfoItem(AppIcons.mobile, Texts.to.contactsShowContactItemMobile.withDoubleDots, contact.mobile ?? ''),
        _widgetInfoItem(AppIcons.phone, Texts.to.contactsShowContactItemPhone.withDoubleDots, contact.phone ?? ''),
        _widgetInfoItem(AppIcons.email, Texts.to.contactsShowContactItemEmail.withDoubleDots, contact.email ?? ''),
        _widgetInfoItem(AppIcons.web, Texts.to.contactsShowContactItemWebLink.withDoubleDots, contact.webLink ?? ''),
      ]));

  Widget _widgetAccount() => Padding(
      padding: AppPaddings.contactsShowContactItems,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _title(Texts.to.contactsShowContactTitleAccount),
        AppSpaces.h10,
        _widgetInfoItem(AppIcons.accounts, Texts.to.contactsShowContactTitleBalance, contact.calculateBalance(false).balance.toCurrency),
        _widgetInfoItem(AppIcons.list, Texts.to.contactsShowContactTitleRecords, contact.calculateBalance(false).count.toCurrency),
      ]));

  Widget _widgetInfoItem(Icon icon, String title, String item) => Padding(
      padding: AppPaddings.contactsShowContactItem,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [icon.withSize(AppSizes.contactsShowContactIcon), AppSpaces.w10, Text(title, style: AppTextStyles.contactsShowContactInfoTitle)]),
        AppSpaces.w50,
        Flexible(child: Text(item, style: AppTextStyles.contactsShowContactInfoItem, maxLines: 1, overflow: TextOverflow.ellipsis)),
      ]));
}
