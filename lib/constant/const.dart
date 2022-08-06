import 'package:flutter/cupertino.dart';

import 'enums.dart';

final ValueNotifier<bool> LightTheme = ValueNotifier(false);
final ValueNotifier<Lang> AppLang = ValueNotifier(Lang.EN);
final ValueNotifier<CodeCurve> AppCodeCurve = ValueNotifier(CodeCurve.P256);

final PageController WorkPageController = PageController(initialPage: 0);

class Config {
  var light = LightTheme.value;
  var lang = AppLang.value.code;
  var curve = AppCodeCurve.value.code;
  var code = "";
  var relay = "";

  Config();

  Map<String, dynamic> toJson() => {
        "light": light,
        "lang": lang,
        "curve": curve,
        "code": code,
        "relay": relay,
      };

  Config.fromJson(final Map<String, dynamic> json)
      : light = json["light"],
        lang = json["lang"],
        curve = json["curve"],
        code = json["code"],
        relay = json["relay"];
}
