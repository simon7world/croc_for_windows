// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_TW';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("關於"),
        "about_author": MessageLookupByLibrary.simpleMessage("作者"),
        "about_github": MessageLookupByLibrary.simpleMessage("GitHub"),
        "about_version": MessageLookupByLibrary.simpleMessage("版本"),
        "receive": MessageLookupByLibrary.simpleMessage("接收"),
        "send": MessageLookupByLibrary.simpleMessage("發送"),
        "settings": MessageLookupByLibrary.simpleMessage("設定"),
        "settings_defaultCode": MessageLookupByLibrary.simpleMessage("預設密碼"),
        "settings_encryptionCurve":
            MessageLookupByLibrary.simpleMessage("加密曲線"),
        "settings_language": MessageLookupByLibrary.simpleMessage("語言"),
        "settings_relayServer": MessageLookupByLibrary.simpleMessage("中繼伺服器")
      };
}
