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
