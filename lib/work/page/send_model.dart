import 'package:flutter/cupertino.dart';

class Send {
  static final TextEditingController FilePickTextEditingController = TextEditingController(text: "");
  static final TextEditingController CodeTextEditingController = TextEditingController(text: "");

  static final ValueNotifier<bool> DefaultCode = ValueNotifier(false);

  static void sendFile() {
    print("sendFile");
  }
}