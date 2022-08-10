import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../constant/enums.dart';
import '../navigation/navigation_model.dart';
import '../work/page/settings_model.dart';

class Config {
  late bool _light;
  late String _color, _lang, _curve, _code, _relay;

  Config();

  Config.fromJson(final Map<String, dynamic> json)
      : _light = json["light"] ?? Navigation.AppLightTheme.value,
        _color = json["color"] ?? Settings.AppPrimaryColor.value.code,
        _lang = json["lang"] ?? Settings.AppLang.value.code,
        _curve = json["curve"] ?? Settings.AppCodeCurve.value.code,
        _code = json["code"] ?? Settings.DefaultCodeTextEditingController.text,
        _relay = json["relay"] ?? Settings.RelayServerTextEditingController.text;

  Map<String, dynamic> toJson() => {
    "light": Navigation.AppLightTheme.value,
    "color": Settings.AppPrimaryColor.value.code,
    "lang": Settings.AppLang.value.code,
    "curve": Settings.AppCodeCurve.value.code,
    "code": Settings.DefaultCodeTextEditingController.text,
    "relay": Settings.RelayServerTextEditingController.text,
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
    Navigation.AppLightTheme.value = config._light;
    Settings.AppPrimaryColor.value = Color.findByCode(config._color);
    Settings.AppLang.value = Lang.findByCode(config._lang);
    Settings.AppCodeCurve.value = CodeCurve.findByCode(config._curve);
    Settings.DefaultCodeTextEditingController.text = config._code;
    Settings.RelayServerTextEditingController.text = config._relay;
  }

  static Future<void> overwrite() async {
    (await _find()).writeAsStringSync(convert.jsonEncode(Config()), flush: true);
  }
}
