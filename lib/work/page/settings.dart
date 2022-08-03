import 'package:flutter/material.dart';

import '../../const.dart';
import '../../generated/l10n.dart';
import 'item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset("images/croc_win.png", width: 550),
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
            value: DropdownButton<CodeCurve>(
              alignment: Alignment.centerRight,
              elevation: 9,
              value: AppCodeCurve.value,
              underline: Container(
                height: 1,
                color: Theme.of(context).hintColor,
              ),
              onChanged: (CodeCurve? curve) {
                if (curve != null) {
                  AppCodeCurve.value = curve;
                }
              },
              items: CodeCurve.values.map<DropdownMenuItem<CodeCurve>>((CodeCurve curve) {
                return DropdownMenuItem<CodeCurve>(
                  value: curve,
                  child: Text(curve.label),
                );
              }).toList(),
            )),
        SpaceBetweenItem(
            label: S.of(context).settings_language,
            value: DropdownButton<Lang>(
              alignment: Alignment.centerRight,
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
