import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/core_widgets.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';

class AppGeneralButton extends StatelessWidget {
  const AppGeneralButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.leading,
    this.disabled,
  });

  final String text;
  final Function onTap;
  final IconData? icon;
  final IconData? leading;
  final bool? disabled;

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(AppColors.buttonBackgroundNormal),
          foregroundColor: disabled == true
              ? MaterialStateProperty.all(AppColors.buttonTextDisabled)
              : MaterialStateProperty.all(AppColors.buttonTextNormal),
          side: disabled == true
              ? MaterialStateProperty.all(AppElements.defaultBorderSideDisabled)
              : MaterialStateProperty.all(AppElements.defaultBorderSideFocused),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              AppElements.defaultBorderLowRadiusShape),
          splashFactory: InkSplash.splashFactory),
      statesController: disabled == true
          ? MaterialStatesController(<MaterialState>{MaterialState.focused})
          : MaterialStatesController(<MaterialState>{MaterialState.disabled}),
      onPressed: () => disabled == true ? null : onTap(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null ? shrinkSizedBox : Icon(icon),
            AutoSizeText(text),
            leading == null ? shrinkSizedBox : Icon(leading)
          ]));
}
