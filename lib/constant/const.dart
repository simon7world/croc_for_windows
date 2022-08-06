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
final ValueNotifier<String> AppDefaultCode = ValueNotifier("");
final ValueNotifier<String> AppRelayServer = ValueNotifier("");

final PageController WorkPageController = PageController(initialPage: 0);

class Config {
  Config();

  late bool _light;
  late String _lang, _curve, _code, _relay;

  Map<String, dynamic> toJson() => {
        "light": AppLightTheme.value,
        "lang": AppLang.value.code,
        "curve": AppCodeCurve.value.code,
        "code": AppDefaultCode.value,
        "relay": AppRelayServer.value,
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
    var config = Config.fromJson(convert.jsonDecode((await _find()).readAsStringSync()));
    AppLightTheme.value = config._light;
    AppLang.value = Lang.findByCode(config._lang);
    AppCodeCurve.value = CodeCurve.findByCode(config._curve);
    AppDefaultCode.value = config._code;
    AppRelayServer.value = config._relay;
  }

  static Future<void> overwrite() async {
    (await _find()).writeAsStringSync(convert.jsonEncode(Config()), flush: true);
  }
}
