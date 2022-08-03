import 'package:flutter/cupertino.dart';

final ValueNotifier<bool> LightTheme = ValueNotifier(false);
final ValueNotifier<Lang> AppLang = ValueNotifier(Lang.EN);
final ValueNotifier<CodeCurve> AppCodeCurve = ValueNotifier(CodeCurve.P256);
final PageController WorkPageController = PageController(initialPage: 0);

enum Lang {
  EN(label: "English", locale: Locale("en")),
  ZH_CN(label: "简体中文", locale: Locale("zh", "CN")),
  ZH_TW(label: "繁體中文", locale: Locale("zh", "TW"));

  const Lang({required this.label, required this.locale});

  final String label;
  final Locale locale;
}

enum CodeCurve {
  P256(label: "P-256", code: "p256"),
  P348(label: "P-348", code: "p348"),
  P521(label: "P-521", code: "p521"),
  SIEC(label: "SIEC", code: "siec");

  const CodeCurve({required this.label, required this.code});

  final String label;
  final String code;
}