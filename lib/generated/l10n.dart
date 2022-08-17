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

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Pick a file/folder`
  String get send_filePick {
    return Intl.message(
      'Pick a file/folder',
      name: 'send_filePick',
      desc: '',
      args: [],
    );
  }

  /// `Code(optional)`
  String get send_code {
    return Intl.message(
      'Code(optional)',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Use default code`
  String get send_useDefaultCode {
    return Intl.message(
      'Use default code',
      name: 'send_useDefaultCode',
      desc: '',
      args: [],
    );
  }

  /// `Sending`
  String get send_sending {
    return Intl.message(
      'Sending',
      name: 'send_sending',
      desc: '',
      args: [],
    );
  }

  /// `Open folder`
  String get send_openFolder {
    return Intl.message(
      'Open folder',
      name: 'send_openFolder',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Storage location`
  String get receive_location {
    return Intl.message(
      'Storage location',
      name: 'receive_location',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get receive_code {
    return Intl.message(
      'Code',
      name: 'receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Use default code`
  String get receive_useDefaultCode {
    return Intl.message(
      'Use default code',
      name: 'receive_useDefaultCode',
      desc: '',
      args: [],
    );
  }

  /// `Receiving`
  String get receive_receiving {
    return Intl.message(
      'Receiving',
      name: 'receive_receiving',
      desc: '',
      args: [],
    );
  }

  /// `Open folder`
  String get receive_openFolder {
    return Intl.message(
      'Open folder',
      name: 'receive_openFolder',
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

  /// `Default Code(≥6)`
  String get settings_defaultCode {
    return Intl.message(
      'Default Code(≥6)',
      name: 'settings_defaultCode',
      desc: '',
      args: [],
    );
  }

  /// `Encryption Curve`
  String get settings_encryptionCurve {
    return Intl.message(
      'Encryption Curve',
      name: 'settings_encryptionCurve',
      desc: '',
      args: [],
    );
  }

  /// `Relay Server`
  String get settings_relayServer {
    return Intl.message(
      'Relay Server',
      name: 'settings_relayServer',
      desc: '',
      args: [],
    );
  }

  /// `Primary Color`
  String get settings_primaryColor {
    return Intl.message(
      'Primary Color',
      name: 'settings_primaryColor',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settings_language {
    return Intl.message(
      'Language',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get about_author {
    return Intl.message(
      'Author',
      name: 'about_author',
      desc: '',
      args: [],
    );
  }

  /// `CFW`
  String get about_cfw {
    return Intl.message(
      'CFW',
      name: 'about_cfw',
      desc: '',
      args: [],
    );
  }

  /// `CFW Version`
  String get about_cfwVersion {
    return Intl.message(
      'CFW Version',
      name: 'about_cfwVersion',
      desc: '',
      args: [],
    );
  }

  /// `Croc`
  String get about_croc {
    return Intl.message(
      'Croc',
      name: 'about_croc',
      desc: '',
      args: [],
    );
  }

  /// `Croc Version`
  String get about_crocVersion {
    return Intl.message(
      'Croc Version',
      name: 'about_crocVersion',
      desc: '',
      args: [],
    );
  }

  /// `Teal`
  String get color_teal {
    return Intl.message(
      'Teal',
      name: 'color_teal',
      desc: '',
      args: [],
    );
  }

  /// `Blue`
  String get color_blue {
    return Intl.message(
      'Blue',
      name: 'color_blue',
      desc: '',
      args: [],
    );
  }

  /// `Red`
  String get color_red {
    return Intl.message(
      'Red',
      name: 'color_red',
      desc: '',
      args: [],
    );
  }

  /// `Amber`
  String get color_amber {
    return Intl.message(
      'Amber',
      name: 'color_amber',
      desc: '',
      args: [],
    );
  }

  /// `Brown`
  String get color_brown {
    return Intl.message(
      'Brown',
      name: 'color_brown',
      desc: '',
      args: [],
    );
  }

  /// `Purple`
  String get color_purple {
    return Intl.message(
      'Purple',
      name: 'color_purple',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get select_file {
    return Intl.message(
      'File',
      name: 'select_file',
      desc: '',
      args: [],
    );
  }

  /// `Folder`
  String get select_folder {
    return Intl.message(
      'Folder',
      name: 'select_folder',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete parameters`
  String get error_incomplete {
    return Intl.message(
      'Incomplete parameters',
      name: 'error_incomplete',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
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
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
