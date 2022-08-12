import 'package:flutter/material.dart';

enum Select {
  FILE(code: "file"),
  FOLDER(code: "folder");

  const Select({required this.code});

  final String code;

  static Select findByCode(final String code) {
    return Select.values.firstWhere((l) => l.code == code, orElse: () => FILE);
  }
}

enum Color {
  TEAL(code: "teal", value: Colors.teal),
  BLUE(code: "blue", value: Colors.blue),
  READ(code: "red", value: Colors.red),
  AMBER(code: "amber", value: Colors.amber),
  BROWN(code: "brown", value: Colors.brown),
  PURPLE(code: "purple", value: Colors.deepPurple);

  const Color({required this.code, required this.value});

  final String code;
  final MaterialColor value;

  static Color findByCode(final String code) {
    return Color.values.firstWhere((l) => l.code == code, orElse: () => TEAL);
  }
}

enum Lang {
  EN(code: "en", label: "English", locale: Locale("en")),
  ZH_CN(code:"zh_CN", label: "简体中文", locale: Locale("zh", "CN")),
  ZH_TW(code:"zh_TW", label: "繁體中文", locale: Locale("zh", "TW"));

  const Lang({required this.code, required this.label, required this.locale});

  final String code;
  final String label;
  final Locale locale;

  static Lang findByCode(final String code) {
    return Lang.values.firstWhere((l) => l.code == code, orElse: () => EN);
  }
}

enum CodeCurve {
  P256(code: "p256", label: "P-256"),
  P348(code: "p348", label: "P-348"),
  P521(code: "p521", label: "P-521"),
  SIEC(code: "siec", label: "SIEC");

  const CodeCurve({required this.code, required this.label});

  final String code;
  final String label;

  static CodeCurve findByCode(final String code) {
    return CodeCurve.values.firstWhere((cc) => cc.code == code, orElse: () => P256);
  }
}