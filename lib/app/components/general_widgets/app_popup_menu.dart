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
    this.lightColorIcon,
  });

  final List<AppPopupMenuItem> listItems;
  final Icon? icon;
  final String? text;
  final bool? lightColorIcon;

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      padding: AppPaddings.zero,
      color: AppColors.appBackground,
      shape: AppElements.defaultBorderShape,
      icon: icon == null
          ? lightColorIcon == true
              ? AppIcons.threeDots.withAppAppBackgroundColor
              : AppIcons.threeDots.withColor(AppColors.textNormalDark)
          : lightColorIcon == true
              ? icon!.withAppAppBackgroundColor
              : icon!.withColor(AppColors.textNormalDark),
      child: text == null ? null : Text(text!),
      itemBuilder: (context) => List<AppPopupMenuItem>.generate(listItems.length, (index) => AppPopupMenuItem(text: listItems[index].text, onTapFunction: () => listItems[index].onTap())));
}
