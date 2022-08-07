import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'enums.dart';

const AppVersion = "1.0.0";
const AppName = "Croc for Windows";
const AppShortName = "CFW";
const AppFontFamily = "Microsoft YaHei";

final ValueNotifier<bool> AppLightTheme = ValueNotifier(false);
final ValueNotifier<Lang> AppLang = ValueNotifier(Lang.EN);
final ValueNotifier<CodeCurve> AppCodeCurve = ValueNotifier(CodeCurve.P256);

final PageController WorkPageController = PageController(initialPage: 0);
final TextEditingController DefaultCodeTextEditingController = TextEditingController(text: "");
final TextEditingController RelayServerTextEditingController = TextEditingController(text: "");

class Config {
  Config();

  late bool _light;
  late String _lang, _curve, _code, _relay;

  Map<String, dynamic> toJson() => {
        "light": AppLightTheme.value,
        "lang": AppLang.value.code,
        "curve": AppCodeCurve.value.code,
        "code": DefaultCodeTextEditingController.text,
        "relay": RelayServerTextEditingController.text,
      };

  Config.fromJson(final Map<String, dynamic> json)
      : _light = json["light"],
        _lang = json["lang"],
        _curve = json["curve"],
        _code = json["code"],
        _relay = json["relay"];

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
    AppLang.value = Lang.findByCode(config._lang);
    AppCodeCurve.value = CodeCurve.findByCode(config._curve);
    DefaultCodeTextEditingController.text = config._code;
    RelayServerTextEditingController.text = config._relay;
  }

  static Future<void> overwrite() async {
    (await _find()).writeAsStringSync(convert.jsonEncode(Config()), flush: true);
  }
}
