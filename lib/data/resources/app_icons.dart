import 'package:flutter/material.dart';

import '../../core/app_extensions/data_types_extensions/extension_icon.dart';

class AppIcons {

  static Icon get none => const Icon(Icons.not_interested).withAppDefaultColor;

  ///General
  static Icon get close => const Icon(Icons.close_rounded);
  static Icon get version => const Icon(Icons.info_outline_rounded);
  static Icon get threeDots => const Icon(Icons.more_vert);
  static Icon get add => const Icon(Icons.add);

  ///Icons
  static Icon get home => const Icon(Icons.home_rounded);
  static Icon get contacts => const Icon(Icons.person_rounded);
  static Icon get accounts => const Icon(Icons.attach_money_rounded);
  static Icon get settings => const Icon(Icons.settings_rounded);
  static Icon get about => const Icon(Icons.info_outline_rounded);
  static Icon get profile => const Icon(Icons.account_circle_rounded);

  ///BottomNavigationBar Icons
  static Icon get bottomNavigationHomepage => home;
  static Icon get bottomNavigationContacts => contacts;
  static Icon get bottomNavigationAccounts => accounts;
  static Icon get bottomNavigationSettings => settings;

  ///List
  static Icon get listSearch => const Icon(Icons.search_rounded);
  static Icon get listSearchRemove => const Icon(Icons.clear_rounded);
}