import 'package:flutter/material.dart';

enum Color {
  TEAL(code: "teal", label: "Teal", value: Colors.teal),
  BLUE(code: "blue", label: "Blue", value: Colors.blue),
  READ(code: "red", label: "Red", value: Colors.red),
  AMBER(code: "amber", label: "Amber", value: Colors.amber),
  BROWN(code: "brown", label: "Brown", value: Colors.brown),
  PURPLE(code: "purple", label: "Purple", value: Colors.deepPurple);

  const Color({required this.code, required this.label, required this.value});

  final String code;
  final String label;
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
  P256(label: "P-256", code: "p256",),
  P348(label: "P-348", code: "p348",),
  P521(label: "P-521", code: "p521",),
  SIEC(label: "SIEC", code: "siec",);

  const CodeCurve({required this.label, required this.code});

  final String label;
  final String code;

  static CodeCurve findByCode(final String code) {
    return CodeCurve.values.firstWhere((cc) => cc.code == code, orElse: () => P256);
  }
}