import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../util/common.dart';

class Send {
  static final TextEditingController FilePickTextEditingController = TextEditingController(text: "");
  static final TextEditingController CodeTextEditingController = TextEditingController(text: "");

  static final ValueNotifier<bool> DefaultCode = ValueNotifier(false);

  static void sendFile() {

    final args = ["", ""];

    Process.run(Common.crocExePath, args);
  }
}