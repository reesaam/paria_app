import 'package:flutter/material.dart';

import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_paddings.dart';
import 'app_popup_menu_item.dart';

class AppPopupMenu extends StatelessWidget {
  const AppPopupMenu({
    super.key,
    required this.listItems,
    this.icon,
    this.text,
    this.lightColor,
  });

  final List<AppPopupMenuItem> listItems;
  final Icon? icon;
  final String? text;
  final bool? lightColor;

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      padding: AppPaddings.zero,
      shape: AppElements.defaultBorderShape,
      icon: icon == null
          ? lightColor == true
              ? AppIcons.threeDots.withAppAppBackgroundColor
              : AppIcons.threeDots.withColor(AppColors.textNormalDark)
          : lightColor == true
              ? icon!.withAppAppBackgroundColor
              : icon!.withColor(AppColors.textNormalDark),
      child: text == null ? null : Text(text!),
      itemBuilder: (context) => List<AppPopupMenuItem>.generate(
          listItems.length,
          (index) => AppPopupMenuItem(
              text: listItems[index].text,
              onTapFunction: () => listItems[index].onTap())));
}
