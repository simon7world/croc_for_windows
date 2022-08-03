import 'package:flutter/cupertino.dart';

final ValueNotifier<bool> LightTheme = ValueNotifier(false);
final ValueNotifier<Lang> AppLang = ValueNotifier(Lang.EN);
final PageController WorkPageController = PageController(initialPage: 0);

enum Lang {
  EN(label: "English", locale: Locale("en")),
  ZH_CN(label: "简体中文", locale: Locale("zh", "CN")),
  ZH_TW(label: "繁體中文", locale: Locale("zh", "TW"));

  const Lang({required this.label, required this.locale});

  final String label;
  final Locale locale;

  String get langLabel => label;
  Locale get langLocale => locale;
}