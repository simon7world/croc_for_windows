import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../constant/const.dart';
import '../../constant/enums.dart';
import '../../generated/l10n.dart';
import 'item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<String> _abc() async {
      final doc = await getApplicationDocumentsDirectory();
      final dir = Directory('${doc.path}\\Croc4Windows');
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
      }
      final config = File('${dir.path}\\config.json');
      if (!config.existsSync()) {
        config.createSync();
      }

      config.writeAsStringSync(jsonEncode(Config()), flush: true);

      var newConfig = Config.fromJson(jsonDecode(config.readAsStringSync()));
      print(newConfig.light);
      print(newConfig.lang);

      return dir.path;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Image.asset("images/croc_win.png", width: 400),
        ),
        SpaceBetweenItem(
          label: S.of(context).settings_defaultCode,
          value: Tooltip(
            message: "222222222",
            verticalOffset: -45,
            child: SizedBox(
              width: 200,
              height: 60,
              child: TextField(
                maxLength: 32,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        SpaceBetweenItem(
          label: S.of(context).settings_relayServer,
          value: Tooltip(
            message: "111111111",
            verticalOffset: -45,
            child: SizedBox(
              width: 200,
              height: 60,
              child: TextField(
                maxLength: 128,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        SpaceBetweenItem(
            label: S.of(context).settings_encryptionCurve,
            value: ValueListenableBuilder(
                valueListenable: AppCodeCurve,
                builder: (context, CodeCurve curve, child) {
                  return DropdownButton<CodeCurve>(
                    alignment: Alignment.center,
                    elevation: 9,
                    value: AppCodeCurve.value,
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).hintColor,
                    ),
                    onChanged: (CodeCurve? curve) {
                      if (curve != null) {
                        _abc();
                        AppCodeCurve.value = curve;
                      }
                    },
                    items: CodeCurve.values.map<DropdownMenuItem<CodeCurve>>((CodeCurve curve) {
                      return DropdownMenuItem<CodeCurve>(
                        value: curve,
                        child: Text(curve.label),
                      );
                    }).toList(),
                  );
                })),
        SpaceBetweenItem(
            label: S.of(context).settings_language,
            value: DropdownButton<Lang>(
              alignment: Alignment.center,
              elevation: 9,
              value: AppLang.value,
              underline: Container(
                height: 1,
                color: Theme.of(context).hintColor,
              ),
              onChanged: (Lang? lang) {
                if (lang != null) {
                  AppLang.value = lang;
                }
              },
              items: Lang.values.map<DropdownMenuItem<Lang>>((Lang lang) {
                return DropdownMenuItem<Lang>(
                  value: lang,
                  child: Text(lang.label),
                );
              }).toList(),
            )),
      ],
    );
  }
}
