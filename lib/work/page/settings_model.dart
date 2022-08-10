import 'package:flutter/cupertino.dart';

import '../../constant/enums.dart';

class Settings {
  static final TextEditingController DefaultCodeTextEditingController = TextEditingController(text: "");
  static final TextEditingController RelayServerTextEditingController = TextEditingController(text: "");

  static final ValueNotifier<Color> AppPrimaryColor = ValueNotifier(Color.TEAL);
  static final ValueNotifier<Lang> AppLang = ValueNotifier(Lang.EN);
  static final ValueNotifier<CodeCurve> AppCodeCurve = ValueNotifier(CodeCurve.P256);
}