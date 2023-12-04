import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static get defaultSize => AppFonts.defaultFontSize;
  static get smallSize => defaultSize - 2;
  static get normalSize => defaultSize;
  static get bigSize => defaultSize + 3;
  static get titleSize => defaultSize + 5;
  static get bigTitleSize => defaultSize + 8;

  ///Card
  static TextStyle get cardTitle => TextStyle(color: AppColors.cardText, fontSize: bigSize);

  ///Text Fields
  static TextStyle get textFieldText => TextStyle(color: AppColors.textFieldText);
  static TextStyle get textFieldLabel => TextStyle(color: AppColors.textFieldLabel);
  static TextStyle get textFieldHint => TextStyle(color: AppColors.textFieldHint);

  ///Popup Menu
  static TextStyle get popupMenuItem => const TextStyle();

  ///AppBar
  static TextStyle get appBarTitle => TextStyle(color: AppColors.appBarText, fontSize: bigTitleSize);

  ///ModalBottomSheet
  static TextStyle get modalTitle => TextStyle(fontSize: titleSize);

  ///Dialogs
  static TextStyle get dialogAlertTitle => TextStyle(fontSize: titleSize);
  static TextStyle get dialogAlertText => TextStyle(fontSize: normalSize, color: AppColors.textNormalDark);

  ///Settings
  static TextStyle get settingsSectionTitle => TextStyle(fontSize: bigSize, color: AppColors.settingTitle);
  static TextStyle get settingsSectionItem => TextStyle(color: AppColors.settingItem);
}
