// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get languageName {
    return Intl.message(
      'English',
      name: 'languageName',
      desc: '',
      args: [],
    );
  }

  /// `Paria Assistant App`
  String get app_name {
    return Intl.message(
      'Paria Assistant App',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Splash Screen`
  String get splashScreenPageName {
    return Intl.message(
      'Splash Screen',
      name: 'splashScreenPageName',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homePageName {
    return Intl.message(
      'Home',
      name: 'homePageName',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contactsPageName {
    return Intl.message(
      'Contacts',
      name: 'contactsPageName',
      desc: '',
      args: [],
    );
  }

  /// `Contacts Balance`
  String get contactsBalancePageName {
    return Intl.message(
      'Contacts Balance',
      name: 'contactsBalancePageName',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get accountsPageName {
    return Intl.message(
      'Accounts',
      name: 'accountsPageName',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageName {
    return Intl.message(
      'Settings',
      name: 'settingsPageName',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get updatePageName {
    return Intl.message(
      'Update',
      name: 'updatePageName',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get aboutPageName {
    return Intl.message(
      'About',
      name: 'aboutPageName',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get empty {
    return Intl.message(
      '',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Not Available`
  String get notAvailable {
    return Intl.message(
      'Not Available',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get notAvailableInitials {
    return Intl.message(
      'N/A',
      name: 'notAvailableInitials',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get totalBalance {
    return Intl.message(
      'Total Balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure ?`
  String get areYouSure {
    return Intl.message(
      'Are you sure ?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?\nData will be lost with this Function.`
  String get areYouSureDataWillLost {
    return Intl.message(
      'Are you sure?\nData will be lost with this Function.',
      name: 'areYouSureDataWillLost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?\nData may be lost with this Function.`
  String get areYouSureDataMayLost {
    return Intl.message(
      'Are you sure?\nData may be lost with this Function.',
      name: 'areYouSureDataMayLost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?\nData will be exported and exposed.`
  String get areYouSureDataExport {
    return Intl.message(
      'Are you sure?\nData will be exported and exposed.',
      name: 'areYouSureDataExport',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?\nData will be imported and exposed.`
  String get areYouSureDataImport {
    return Intl.message(
      'Are you sure?\nData will be imported and exposed.',
      name: 'areYouSureDataImport',
      desc: '',
      args: [],
    );
  }

  /// `App Exit`
  String get appExit {
    return Intl.message(
      'App Exit',
      name: 'appExit',
      desc: '',
      args: [],
    );
  }

  /// `Internet Connection`
  String get connectionInternetNotAvailableTitle {
    return Intl.message(
      'Internet Connection',
      name: 'connectionInternetNotAvailableTitle',
      desc: '',
      args: [],
    );
  }

  /// `Internet Connection is not Available!\nPlease Check your Connection.`
  String get connectionInternetNotAvailableText {
    return Intl.message(
      'Internet Connection is not Available!\nPlease Check your Connection.',
      name: 'connectionInternetNotAvailableText',
      desc: '',
      args: [],
    );
  }

  /// `Not Available`
  String get generalNotAvailable {
    return Intl.message(
      'Not Available',
      name: 'generalNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get generalNotAvailableInitials {
    return Intl.message(
      'N/A',
      name: 'generalNotAvailableInitials',
      desc: '',
      args: [],
    );
  }

  /// `Sort By {type}`
  String sortBy(Object type) {
    return Intl.message(
      'Sort By $type',
      name: 'sortBy',
      desc: '',
      args: [type],
    );
  }

  /// `Today`
  String get homepageDateTimeTitle {
    return Intl.message(
      'Today',
      name: 'homepageDateTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `App Summary`
  String get homepageSummaryTitle {
    return Intl.message(
      'App Summary',
      name: 'homepageSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get homepageSummaryContacts {
    return Intl.message(
      'Contacts',
      name: 'homepageSummaryContacts',
      desc: '',
      args: [],
    );
  }

  /// `Accounts Records`
  String get homepageSummaryAccountRecords {
    return Intl.message(
      'Accounts Records',
      name: 'homepageSummaryAccountRecords',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get homepageSummaryTotalBalance {
    return Intl.message(
      'Total Balance',
      name: 'homepageSummaryTotalBalance',
      desc: '',
      args: [],
    );
  }

  /// `No Contacts`
  String get contactsNoContact {
    return Intl.message(
      'No Contacts',
      name: 'contactsNoContact',
      desc: '',
      args: [],
    );
  }

  /// `Add New Contact`
  String get contactsAddContactTitle {
    return Intl.message(
      'Add New Contact',
      name: 'contactsAddContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Contact`
  String get contactsEditContactTitle {
    return Intl.message(
      'Edit Contact',
      name: 'contactsEditContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Contacts`
  String get contactsNoContacts {
    return Intl.message(
      'No Contacts',
      name: 'contactsNoContacts',
      desc: '',
      args: [],
    );
  }

  /// `Show Contact`
  String get contactsOptionShow {
    return Intl.message(
      'Show Contact',
      name: 'contactsOptionShow',
      desc: '',
      args: [],
    );
  }

  /// `Edit Contact`
  String get contactsOptionEdit {
    return Intl.message(
      'Edit Contact',
      name: 'contactsOptionEdit',
      desc: '',
      args: [],
    );
  }

  /// `Remove Contact`
  String get contactsOptionRemove {
    return Intl.message(
      'Remove Contact',
      name: 'contactsOptionRemove',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get contactsShowContactTitleInfo {
    return Intl.message(
      'Personal Info',
      name: 'contactsShowContactTitleInfo',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get contactsShowContactItemMobile {
    return Intl.message(
      'Mobile',
      name: 'contactsShowContactItemMobile',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get contactsShowContactItemPhone {
    return Intl.message(
      'Phone',
      name: 'contactsShowContactItemPhone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contactsShowContactItemEmail {
    return Intl.message(
      'Email',
      name: 'contactsShowContactItemEmail',
      desc: '',
      args: [],
    );
  }

  /// `Web Link`
  String get contactsShowContactItemWebLink {
    return Intl.message(
      'Web Link',
      name: 'contactsShowContactItemWebLink',
      desc: '',
      args: [],
    );
  }

  /// `Account Info`
  String get contactsShowContactTitleAccount {
    return Intl.message(
      'Account Info',
      name: 'contactsShowContactTitleAccount',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get contactsShowContactTitleBalance {
    return Intl.message(
      'Balance',
      name: 'contactsShowContactTitleBalance',
      desc: '',
      args: [],
    );
  }

  /// `Records Count`
  String get contactsShowContactTitleRecords {
    return Intl.message(
      'Records Count',
      name: 'contactsShowContactTitleRecords',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get contactsAddContactFirstNameTitle {
    return Intl.message(
      'First Name',
      name: 'contactsAddContactFirstNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get contactsAddContactLastNameTitle {
    return Intl.message(
      'Last Name',
      name: 'contactsAddContactLastNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get contactsAddContactMobileTitle {
    return Intl.message(
      'Mobile',
      name: 'contactsAddContactMobileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get contactsAddContactPhoneTitle {
    return Intl.message(
      'Phone',
      name: 'contactsAddContactPhoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contactsAddContactEmailTitle {
    return Intl.message(
      'Email',
      name: 'contactsAddContactEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Web Link`
  String get contactsAddContactWebLinkTitle {
    return Intl.message(
      'Web Link',
      name: 'contactsAddContactWebLinkTitle',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any Contacts,\nPlease Add a Contact first`
  String get contactsAddEditModalErrorNoContactsAvailable {
    return Intl.message(
      'You don\'t have any Contacts,\nPlease Add a Contact first',
      name: 'contactsAddEditModalErrorNoContactsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Go to Contacts`
  String get contactsAddEditModalErrorNoContactsAvailableOnTap {
    return Intl.message(
      'Tap to Go to Contacts',
      name: 'contactsAddEditModalErrorNoContactsAvailableOnTap',
      desc: '',
      args: [],
    );
  }

  /// `Firstname or Lastname and Mobile should be entered.`
  String get contactsAddEditModalErrorFirstnameLastNameAndMobile {
    return Intl.message(
      'Firstname or Lastname and Mobile should be entered.',
      name: 'contactsAddEditModalErrorFirstnameLastNameAndMobile',
      desc: '',
      args: [],
    );
  }

  /// `Firstname or Lastname should be entered.`
  String get contactsAddEditModalErrorFirstnameLastName {
    return Intl.message(
      'Firstname or Lastname should be entered.',
      name: 'contactsAddEditModalErrorFirstnameLastName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile field can't be Blank`
  String get contactsAddEditModalErrorMobile {
    return Intl.message(
      'Mobile field can\'t be Blank',
      name: 'contactsAddEditModalErrorMobile',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get accountsSummaryBalance {
    return Intl.message(
      'Balance',
      name: 'accountsSummaryBalance',
      desc: '',
      args: [],
    );
  }

  /// `Items Count`
  String get accountsSummaryItemCount {
    return Intl.message(
      'Items Count',
      name: 'accountsSummaryItemCount',
      desc: '',
      args: [],
    );
  }

  /// `Contacts Count`
  String get accountsSummaryContactsCount {
    return Intl.message(
      'Contacts Count',
      name: 'accountsSummaryContactsCount',
      desc: '',
      args: [],
    );
  }

  /// `No Records Registered`
  String get accountsNoRecord {
    return Intl.message(
      'No Records Registered',
      name: 'accountsNoRecord',
      desc: '',
      args: [],
    );
  }

  /// `Records Table`
  String get accountsTableTitle {
    return Intl.message(
      'Records Table',
      name: 'accountsTableTitle',
      desc: '',
      args: [],
    );
  }

  /// `Show Cleared Records`
  String get accountsTableTitleMenuShowCleared {
    return Intl.message(
      'Show Cleared Records',
      name: 'accountsTableTitleMenuShowCleared',
      desc: '',
      args: [],
    );
  }

  /// `Hide Cleared Records`
  String get accountsTableTitleMenuHideCleared {
    return Intl.message(
      'Hide Cleared Records',
      name: 'accountsTableTitleMenuHideCleared',
      desc: '',
      args: [],
    );
  }

  /// `Show Positive Records Only`
  String get accountsTableTitleMenuShowPositives {
    return Intl.message(
      'Show Positive Records Only',
      name: 'accountsTableTitleMenuShowPositives',
      desc: '',
      args: [],
    );
  }

  /// `Show Negative Records Only`
  String get accountsTableTitleMenuShowNegatives {
    return Intl.message(
      'Show Negative Records Only',
      name: 'accountsTableTitleMenuShowNegatives',
      desc: '',
      args: [],
    );
  }

  /// `Show All Records`
  String get accountsTableTitleMenuShowAll {
    return Intl.message(
      'Show All Records',
      name: 'accountsTableTitleMenuShowAll',
      desc: '',
      args: [],
    );
  }

  /// `Mark as cleared`
  String get accountsTableItemMenuMarkAsCleared {
    return Intl.message(
      'Mark as cleared',
      name: 'accountsTableItemMenuMarkAsCleared',
      desc: '',
      args: [],
    );
  }

  /// `Mark as uncleared`
  String get accountsTableItemMenuMarkAsUncleared {
    return Intl.message(
      'Mark as uncleared',
      name: 'accountsTableItemMenuMarkAsUncleared',
      desc: '',
      args: [],
    );
  }

  /// `Show Record`
  String get accountsTableItemMenuShowRecord {
    return Intl.message(
      'Show Record',
      name: 'accountsTableItemMenuShowRecord',
      desc: '',
      args: [],
    );
  }

  /// `Edit Record`
  String get accountsTableItemMenuEditRecord {
    return Intl.message(
      'Edit Record',
      name: 'accountsTableItemMenuEditRecord',
      desc: '',
      args: [],
    );
  }

  /// `Remove Record`
  String get accountsTableItemMenuRemoveRecord {
    return Intl.message(
      'Remove Record',
      name: 'accountsTableItemMenuRemoveRecord',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get accountShowRecordTitle {
    return Intl.message(
      'Record',
      name: 'accountShowRecordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get accountShowRecordContact {
    return Intl.message(
      'Contact',
      name: 'accountShowRecordContact',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get accountShowRecordDescription {
    return Intl.message(
      'Description',
      name: 'accountShowRecordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get accountShowRecordAmount {
    return Intl.message(
      'Amount',
      name: 'accountShowRecordAmount',
      desc: '',
      args: [],
    );
  }

  /// `Date & Time`
  String get accountShowRecordDateTime {
    return Intl.message(
      'Date & Time',
      name: 'accountShowRecordDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get accountShowRecordClearedStatus {
    return Intl.message(
      'Status',
      name: 'accountShowRecordClearedStatus',
      desc: '',
      args: [],
    );
  }

  /// `Cleared`
  String get accountShowRecordCleared {
    return Intl.message(
      'Cleared',
      name: 'accountShowRecordCleared',
      desc: '',
      args: [],
    );
  }

  /// `Uncleared`
  String get accountShowRecordUncleared {
    return Intl.message(
      'Uncleared',
      name: 'accountShowRecordUncleared',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get accountsAddEditRecordContact {
    return Intl.message(
      'Contact',
      name: 'accountsAddEditRecordContact',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get accountsAddEditRecordDescription {
    return Intl.message(
      'Description',
      name: 'accountsAddEditRecordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get accountsAddEditRecordAmount {
    return Intl.message(
      'Amount',
      name: 'accountsAddEditRecordAmount',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get accountsAddEditRecordDate {
    return Intl.message(
      'Date',
      name: 'accountsAddEditRecordDate',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get accountsAddEditRecordNote {
    return Intl.message(
      'Note',
      name: 'accountsAddEditRecordNote',
      desc: '',
      args: [],
    );
  }

  /// `Add New Record`
  String get accountsAddContactTitle {
    return Intl.message(
      'Add New Record',
      name: 'accountsAddContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Record`
  String get accountsEditContactTitle {
    return Intl.message(
      'Edit Record',
      name: 'accountsEditContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Records`
  String get accountsNoContacts {
    return Intl.message(
      'No Records',
      name: 'accountsNoContacts',
      desc: '',
      args: [],
    );
  }

  /// `Show Record`
  String get accountsOptionShow {
    return Intl.message(
      'Show Record',
      name: 'accountsOptionShow',
      desc: '',
      args: [],
    );
  }

  /// `Edit Record`
  String get accountsOptionEdit {
    return Intl.message(
      'Edit Record',
      name: 'accountsOptionEdit',
      desc: '',
      args: [],
    );
  }

  /// `Remove Record`
  String get accountsOptionRemove {
    return Intl.message(
      'Remove Record',
      name: 'accountsOptionRemove',
      desc: '',
      args: [],
    );
  }

  /// `Contact and Amount should be entered.`
  String get accountsAddEditModalErrorContactAndAmount {
    return Intl.message(
      'Contact and Amount should be entered.',
      name: 'accountsAddEditModalErrorContactAndAmount',
      desc: '',
      args: [],
    );
  }

  /// `Contact must be selected`
  String get accountsAddEditModalErrorContact {
    return Intl.message(
      'Contact must be selected',
      name: 'accountsAddEditModalErrorContact',
      desc: '',
      args: [],
    );
  }

  /// `Amount field can't be Blank`
  String get accountsAddEditModalErrorAmount {
    return Intl.message(
      'Amount field can\'t be Blank',
      name: 'accountsAddEditModalErrorAmount',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Contact`
  String get accountsAddRecordChooseContact {
    return Intl.message(
      'Choose a Contact',
      name: 'accountsAddRecordChooseContact',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contactsBalanceTableHeaderContact {
    return Intl.message(
      'Contact',
      name: 'contactsBalanceTableHeaderContact',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get contactsBalanceTableHeaderBalance {
    return Intl.message(
      'Balance',
      name: 'contactsBalanceTableHeaderBalance',
      desc: '',
      args: [],
    );
  }

  /// `Count`
  String get contactsBalanceTableHeaderCount {
    return Intl.message(
      'Count',
      name: 'contactsBalanceTableHeaderCount',
      desc: '',
      args: [],
    );
  }

  /// `Contact Records`
  String get contactsBalanceItemDetailsDialogTitle {
    return Intl.message(
      'Contact Records',
      name: 'contactsBalanceItemDetailsDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get settingsLanguageModalSelectLanguage {
    return Intl.message(
      'Select Language',
      name: 'settingsLanguageModalSelectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Reset All Settings`
  String get settingsAppbarMenuResetSettings {
    return Intl.message(
      'Reset All Settings',
      name: 'settingsAppbarMenuResetSettings',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get settingsSectionTitleGeneral {
    return Intl.message(
      'General',
      name: 'settingsSectionTitleGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsSectionTitleGeneralLanguage {
    return Intl.message(
      'Language',
      name: 'settingsSectionTitleGeneralLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Calendar Type`
  String get settingsSectionTitleGeneralCalendar {
    return Intl.message(
      'Calendar Type',
      name: 'settingsSectionTitleGeneralCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settingsSectionGeneralItemDarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'settingsSectionGeneralItemDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get settingsSectionTitleUpdate {
    return Intl.message(
      'Update',
      name: 'settingsSectionTitleUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Current Version`
  String get settingsSectionTitleUpdateCurrentVersion {
    return Intl.message(
      'Current Version',
      name: 'settingsSectionTitleUpdateCurrentVersion',
      desc: '',
      args: [],
    );
  }

  /// `Available Version`
  String get settingsSectionTitleUpdateAvailableVersion {
    return Intl.message(
      'Available Version',
      name: 'settingsSectionTitleUpdateAvailableVersion',
      desc: '',
      args: [],
    );
  }

  /// `Backup`
  String get settingsSectionTitleBackup {
    return Intl.message(
      'Backup',
      name: 'settingsSectionTitleBackup',
      desc: '',
      args: [],
    );
  }

  /// `Backup Data`
  String get settingsSectionBackupBackup {
    return Intl.message(
      'Backup Data',
      name: 'settingsSectionBackupBackup',
      desc: '',
      args: [],
    );
  }

  /// `Restore Data`
  String get settingsSectionBackupRestore {
    return Intl.message(
      'Restore Data',
      name: 'settingsSectionBackupRestore',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get settingsSectionTitleStorage {
    return Intl.message(
      'Storage',
      name: 'settingsSectionTitleStorage',
      desc: '',
      args: [],
    );
  }

  /// `Erase All Contacts`
  String get settingsSectionStorageItemEraseContacts {
    return Intl.message(
      'Erase All Contacts',
      name: 'settingsSectionStorageItemEraseContacts',
      desc: '',
      args: [],
    );
  }

  /// `Erase All Accounts Records`
  String get settingsSectionStorageItemEraseAccountsRecords {
    return Intl.message(
      'Erase All Accounts Records',
      name: 'settingsSectionStorageItemEraseAccountsRecords',
      desc: '',
      args: [],
    );
  }

  /// `Erase All Data`
  String get settingsSectionStorageItemEraseAllData {
    return Intl.message(
      'Erase All Data',
      name: 'settingsSectionStorageItemEraseAllData',
      desc: '',
      args: [],
    );
  }

  /// `Current Version`
  String get updateCurrentVersion {
    return Intl.message(
      'Current Version',
      name: 'updateCurrentVersion',
      desc: '',
      args: [],
    );
  }

  /// `New Available Version`
  String get updateAvailableVersion {
    return Intl.message(
      'New Available Version',
      name: 'updateAvailableVersion',
      desc: '',
      args: [],
    );
  }

  /// `Check Update`
  String get updateCheckUpdate {
    return Intl.message(
      'Check Update',
      name: 'updateCheckUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Download Update`
  String get updateDownloadUpdate {
    return Intl.message(
      'Download Update',
      name: 'updateDownloadUpdate',
      desc: '',
      args: [],
    );
  }

  /// `New Version Found`
  String get updateNewVersion {
    return Intl.message(
      'New Version Found',
      name: 'updateNewVersion',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to download the New Version?`
  String get updateApprove {
    return Intl.message(
      'Do you want to download the New Version?',
      name: 'updateApprove',
      desc: '',
      args: [],
    );
  }

  /// `Checking for any Available Update ...`
  String get updateCheckingUpdate {
    return Intl.message(
      'Checking for any Available Update ...',
      name: 'updateCheckingUpdate',
      desc: '',
      args: [],
    );
  }

  /// `New Update is Available!`
  String get updateUpdateFound {
    return Intl.message(
      'New Update is Available!',
      name: 'updateUpdateFound',
      desc: '',
      args: [],
    );
  }

  /// `There is not any Update Available!`
  String get updateNoUpdateFound {
    return Intl.message(
      'There is not any Update Available!',
      name: 'updateNoUpdateFound',
      desc: '',
      args: [],
    );
  }

  /// `Downloading ...`
  String get updateDownloading {
    return Intl.message(
      'Downloading ...',
      name: 'updateDownloading',
      desc: '',
      args: [],
    );
  }

  /// `Update Downloaded!`
  String get updateDownloaded {
    return Intl.message(
      'Update Downloaded!',
      name: 'updateDownloaded',
      desc: '',
      args: [],
    );
  }

  /// `Update Installation`
  String get updateInstallationTitle {
    return Intl.message(
      'Update Installation',
      name: 'updateInstallationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to install the Update?\n\nWarning: Application will close!`
  String get updateInstallationContent {
    return Intl.message(
      'Do you want to install the Update?\n\nWarning: Application will close!',
      name: 'updateInstallationContent',
      desc: '',
      args: [],
    );
  }

  /// `Directory Error!`
  String get updateDirectoryNotFoundTitle {
    return Intl.message(
      'Directory Error!',
      name: 'updateDirectoryNotFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `There is not any Directory available to store Data`
  String get updateDirectoryNotFoundContent {
    return Intl.message(
      'There is not any Directory available to store Data',
      name: 'updateDirectoryNotFoundContent',
      desc: '',
      args: [],
    );
  }

  /// `File Error!`
  String get updateFileNotFoundTitle {
    return Intl.message(
      'File Error!',
      name: 'updateFileNotFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `File not found`
  String get updateFileNotFoundContent {
    return Intl.message(
      'File not found',
      name: 'updateFileNotFoundContent',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get aboutTitlesAppName {
    return Intl.message(
      '',
      name: 'aboutTitlesAppName',
      desc: '',
      args: [],
    );
  }

  /// `Developer Name`
  String get aboutTitlesDeveloperName {
    return Intl.message(
      'Developer Name',
      name: 'aboutTitlesDeveloperName',
      desc: '',
      args: [],
    );
  }

  /// `Developer WebSite`
  String get aboutTitlesDeveloperWebsite {
    return Intl.message(
      'Developer WebSite',
      name: 'aboutTitlesDeveloperWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Developer LinkedIn Profile`
  String get aboutTitlesDeveloperLinkedIn {
    return Intl.message(
      'Developer LinkedIn Profile',
      name: 'aboutTitlesDeveloperLinkedIn',
      desc: '',
      args: [],
    );
  }

  /// `Admin Start Page`
  String get adminStartPagePageName {
    return Intl.message(
      'Admin Start Page',
      name: 'adminStartPagePageName',
      desc: '',
      args: [],
    );
  }

  /// `Admin Pages Test Page`
  String get adminTestPagePageName {
    return Intl.message(
      'Admin Pages Test Page',
      name: 'adminTestPagePageName',
      desc: '',
      args: [],
    );
  }

  /// `Admin UI Test Page`
  String get adminUITestPagePageName {
    return Intl.message(
      'Admin UI Test Page',
      name: 'adminUITestPagePageName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
