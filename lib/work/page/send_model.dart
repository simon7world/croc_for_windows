import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import '../../generated/l10n.dart';

import '../../util/common.dart';
import 'settings_model.dart';

class Send {
  static final TextEditingController FilePickTextEditingController = TextEditingController(text: "");
  static final TextEditingController CodeTextEditingController = TextEditingController(text: "");

  static final ValueNotifier<bool> DefaultCode = ValueNotifier(false);

  static void sendFile(final BuildContext context) async {
    print("sendFile");

    final List<String> args = [];

    final relay = Settings.RelayServerTextEditingController.text;
    if (relay != "") {
      args.add("--relay");
      args.add(relay);
    }

    args.add("send");

    final code = CodeTextEditingController.text;
    if (code != "") {
      args.add("--code");
      args.add(code);
    }

    final file = FilePickTextEditingController.text;
    if (file == "") {
      showError(context, S.of(context).error_incomplete);

      return;
    } else {
      args.add(file);
    }

    final p = await Process.start(crocExePath, args);
    print("start");
    p.stdout.transform(utf8.decoder).forEach((element) {
      print("out $element");
    });
    p.stderr.transform(utf8.decoder).forEach((element) {
      print("err $element");
    });
  }
}
