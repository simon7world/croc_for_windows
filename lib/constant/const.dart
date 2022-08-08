import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'enums.dart';

const AppVersion = "1.0.0";
const AppName = "Croc for Windows";
const AppShortName = "CFW";
const AppFontFamily = "Microsoft YaHei";

final ValueNotifier<bool> AppLightTheme = ValueNotifier(false);
final ValueNotifier<Color> AppPrimaryColor = ValueNotifier(Color.TEAL);
final ValueNotifier<Lang> AppLang = ValueNotifier(Lang.EN);
final ValueNotifier<CodeCurve> AppCodeCurve = ValueNotifier(CodeCurve.P256);

final PageController WorkPageController = PageController(initialPage: 0);
final TextEditingController DefaultCodeTextEditingController = TextEditingController(text: "");
final TextEditingController RelayServerTextEditingController = TextEditingController(text: "");

class Config {
  late bool _light;
  late String _color, _lang, _curve, _code, _relay;

  Config();

  Config.fromJson(final Map<String, dynamic> json)
      : _light = json["light"] ?? AppLightTheme.value,
        _color = json["color"] ?? AppPrimaryColor.value.code,
        _lang = json["lang"] ?? AppLang.value.code,
        _curve = json["curve"] ?? AppCodeCurve.value.code,
        _code = json["code"] ?? DefaultCodeTextEditingController.text,
        _relay = json["relay"] ?? RelayServerTextEditingController.text;

  Map<String, dynamic> toJson() => {
        "light": AppLightTheme.value,
        "color": AppPrimaryColor.value.code,
        "lang": AppLang.value.code,
        "curve": AppCodeCurve.value.code,
        "code": DefaultCodeTextEditingController.text,
        "relay": RelayServerTextEditingController.text,
      };

  static Future<io.File> _find() async {
    final doc = await getApplicationDocumentsDirectory();
    final dir = io.Directory(path.join(doc.path, "Croc4Windows"));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    final config = io.File(path.join(dir.path, "config.json"));
    if (!config.existsSync()) {
      config.createSync();
    }

    return config;
  }

  static Future<void> load() async {
    final config = Config.fromJson(convert.jsonDecode((await _find()).readAsStringSync()));
    AppLightTheme.value = config._light;
    AppPrimaryColor.value = Color.findByCode(config._color);
    AppLang.value = Lang.findByCode(config._lang);
    AppCodeCurve.value = CodeCurve.findByCode(config._curve);
    DefaultCodeTextEditingController.text = config._code;
    RelayServerTextEditingController.text = config._relay;
  }

  static Future<void> overwrite() async {
    (await _find()).writeAsStringSync(convert.jsonEncode(Config()), flush: true);
  }
}
