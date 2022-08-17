import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';
import '../../util/common.dart';
import 'settings_model.dart';

class Receive {
  static final TextEditingController FilePickTextEditingController = TextEditingController(text: "");
  static final TextEditingController CodeTextEditingController = TextEditingController(text: "");

  static final ValueNotifier<bool> DefaultCode = ValueNotifier(false);

  static void receiveFile(final BuildContext context) async {
    final List<String> args = [];

    final relay = Settings.RelayServerTextEditingController.text;
    if (relay != "") {
      args.add("--relay");
      args.add('"$relay"');
    }

    args.add("--yes");
    args.add("--overwrite");

    final out = FilePickTextEditingController.text;
    if (out == "") {
      showError(context, S.of(context).error_incomplete);

      return;
    } else {
      args.add("--out");
      args.add(out);
    }

    final code = CodeTextEditingController.text;
    if (code == "") {
      showError(context, S.of(context).error_incomplete);

      return;
    } else {
      args.add(code);
    }

    final p = await Process.start(crocExePath, args);
    print("start");
    p.stdout.transform(utf8.decoder).forEach((element) {
      print("out $element");
    });
    p.stderr.transform(utf8.decoder).forEach((element) {
      print("err $element");
    });
    // print("[s]:\n$s");
    // print("[e]:\n$e");
  }
}
