import 'package:flutter/material.dart';

import '../../core/app_extensions/data_types_extensions/extension_icon.dart';

class AppIcons {

  static Icon get none => const Icon(Icons.not_interested).withAppDefaultColor;

  ///General
  static Icon get close => const Icon(Icons.close_rounded);
  static Icon get version => const Icon(Icons.info_outline_rounded);
  static Icon get threeDots => const Icon(Icons.more_vert);
  static Icon get add => const Icon(Icons.add);
  static Icon get list => const Icon(Icons.list);
  static Icon get filter => const Icon(Icons.filter_alt);
  static Icon get noFilter => const Icon(Icons.filter_alt_off);
  static Icon get removeFilter => const Icon(Icons.highlight_remove_sharp);

  ///Icons
  static Icon get home => const Icon(Icons.home_rounded);
  static Icon get contacts => const Icon(Icons.person_rounded);
  static Icon get accounts => const Icon(Icons.attach_money_rounded);
  static Icon get settings => const Icon(Icons.settings_rounded);
  static Icon get about => const Icon(Icons.info_outline_rounded);
  static Icon get profile => const Icon(Icons.account_circle_rounded);

  ///Contacts
  static Icon get mobile => const Icon(Icons.phone_android);
  static Icon get phone => const Icon(Icons.phone);
  static Icon get email => const Icon(Icons.email);
  static Icon get web => const Icon(Icons.language);

  ///BottomNavigationBar Icons
  static Icon get bottomNavigationHomepage => home;
  static Icon get bottomNavigationContacts => contacts;
  static Icon get bottomNavigationAccounts => accounts;
  static Icon get bottomNavigationSettings => settings;

  ///List
  static Icon get listSearch => const Icon(Icons.search_rounded);
  static Icon get listSearchRemove => const Icon(Icons.clear_rounded);
}