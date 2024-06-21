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

  /// `flutter Localization`
  String get title {
    return Intl.message(
      'flutter Localization',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message(
      'Today',
      name: 'Today',
      desc: '',
      args: [],
    );
  }

  /// `+Add Task`
  String get Add_Task_Button {
    return Intl.message(
      '+Add Task',
      name: 'Add_Task_Button',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get None {
    return Intl.message(
      'None',
      name: 'None',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get Daily {
    return Intl.message(
      'Daily',
      name: 'Daily',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get Weekly {
    return Intl.message(
      'Weekly',
      name: 'Weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get Monthly {
    return Intl.message(
      'Monthly',
      name: 'Monthly',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get Task {
    return Intl.message(
      'Task',
      name: 'Task',
      desc: '',
      args: [],
    );
  }

  /// `You do not have any tasks yet, Add new tasks to make your days productive `
  String get Task_Message {
    return Intl.message(
      'You do not have any tasks yet, Add new tasks to make your days productive ',
      name: 'Task_Message',
      desc: '',
      args: [],
    );
  }

  /// `Task Completed`
  String get Task_Completed {
    return Intl.message(
      'Task Completed',
      name: 'Task_Completed',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get Delete_Task {
    return Intl.message(
      'Delete Task',
      name: 'Delete_Task',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add Task`
  String get Add_Task {
    return Intl.message(
      'Add Task',
      name: 'Add_Task',
      desc: '',
      args: [],
    );
  }

  /// `Enter title here`
  String get Enter_title_here {
    return Intl.message(
      'Enter title here',
      name: 'Enter_title_here',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Task_Title {
    return Intl.message(
      'Title',
      name: 'Task_Title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Note`
  String get Enter_your_Note {
    return Intl.message(
      'Enter your Note',
      name: 'Enter_your_Note',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get Task_note {
    return Intl.message(
      'Note',
      name: 'Task_note',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get Start_Time {
    return Intl.message(
      'Start Time',
      name: 'Start_Time',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get End_Time {
    return Intl.message(
      'End Time',
      name: 'End_Time',
      desc: '',
      args: [],
    );
  }

  /// `Remind`
  String get Remind {
    return Intl.message(
      'Remind',
      name: 'Remind',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get Repeat {
    return Intl.message(
      'Repeat',
      name: 'Repeat',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get Create_Task {
    return Intl.message(
      'Create Task',
      name: 'Create_Task',
      desc: '',
      args: [],
    );
  }

  /// `required`
  String get required {
    return Intl.message(
      'required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `All fields are required`
  String get All_fields_are_required {
    return Intl.message(
      'All fields are required',
      name: 'All_fields_are_required',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get Color {
    return Intl.message(
      'Color',
      name: 'Color',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get Email_Address {
    return Intl.message(
      'Email Address',
      name: 'Email_Address',
      desc: '',
      args: [],
    );
  }

  /// `please enter a valid email address`
  String get please_enter_a_valid_email_address {
    return Intl.message(
      'please enter a valid email address',
      name: 'please_enter_a_valid_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Username {
    return Intl.message(
      'Username',
      name: 'Username',
      desc: '',
      args: [],
    );
  }

  /// `please enter at least 4 characters.`
  String get please_enter_at_least_4_characters {
    return Intl.message(
      'please enter at least 4 characters.',
      name: 'please_enter_at_least_4_characters',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `password must be at least 6 characters long.`
  String get password_must_be_at_least_6_characters_long {
    return Intl.message(
      'password must be at least 6 characters long.',
      name: 'password_must_be_at_least_6_characters_long',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Signup {
    return Intl.message(
      'Sign up',
      name: 'Signup',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get Create_an_Account {
    return Intl.message(
      'Create an Account',
      name: 'Create_an_Account',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get I_already_have_an_account {
    return Intl.message(
      'I already have an account',
      name: 'I_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Hospital_Group`
  String get Hospital_Group {
    return Intl.message(
      'Hospital_Group',
      name: 'Hospital_Group',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `content Settings`
  String get content_Settings {
    return Intl.message(
      'content Settings',
      name: 'content_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get Social {
    return Intl.message(
      'Social',
      name: 'Social',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy and Security`
  String get Privacy_Security {
    return Intl.message(
      'Privacy and Security',
      name: 'Privacy_Security',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get Dark_Mode {
    return Intl.message(
      'Dark Mode',
      name: 'Dark_Mode',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search_Keyword {
    return Intl.message(
      'Search',
      name: 'Search_Keyword',
      desc: '',
      args: [],
    );
  }

  /// `Generate Presentations`
  String get Generate_Presentations {
    return Intl.message(
      'Generate Presentations',
      name: 'Generate_Presentations',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get PubMed_Articles {
    return Intl.message(
      'Articles',
      name: 'PubMed_Articles',
      desc: '',
      args: [],
    );
  }

  /// `Send a message.....`
  String get Send_Message {
    return Intl.message(
      'Send a message.....',
      name: 'Send_Message',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get App_Settings {
    return Intl.message(
      'App Settings',
      name: 'App_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Account Active`
  String get Account_Active {
    return Intl.message(
      'Account Active',
      name: 'Account_Active',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity`
  String get Opportunity {
    return Intl.message(
      'Opportunity',
      name: 'Opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get Sign_Out {
    return Intl.message(
      'Sign Out',
      name: 'Sign_Out',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Generate Presentations`
  String get generatePresentations {
    return Intl.message(
      'Generate Presentations',
      name: 'generatePresentations',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get todo {
    return Intl.message(
      'Todo',
      name: 'todo',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
