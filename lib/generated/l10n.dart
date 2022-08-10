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

  /// `Code is`
  String get send_codeIs {
    return Intl.message(
      'Code is',
      name: 'send_codeIs',
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

  /// `Code is`
  String get receive_codeIs {
    return Intl.message(
      'Code is',
      name: 'receive_codeIs',
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

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Default Code`
  String get settings_defaultCode {
    return Intl.message(
      'Default Code',
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

  /// `Version`
  String get about_version {
    return Intl.message(
      'Version',
      name: 'about_version',
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

  /// `Croc`
  String get about_c {
    return Intl.message(
      'Croc',
      name: 'about_c',
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
