import 'package:flutter/cupertino.dart';

class Receive {
  static final TextEditingController FilePickTextEditingController = TextEditingController(text: "");
  static final TextEditingController CodeTextEditingController = TextEditingController(text: "");

  static final ValueNotifier<bool> DefaultCode = ValueNotifier(false);

  static void receiveFile() {
    print("receiveFile");
  }
}