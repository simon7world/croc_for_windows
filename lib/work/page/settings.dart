import 'package:flutter/material.dart';

import '../../constant/const.dart';
import '../../constant/enums.dart';
import '../../generated/l10n.dart';
import 'item.dart';
import 'logo.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codeFocus = FocusNode();
    final relayFocus = FocusNode();

    codeFocus.addListener(() {
      if (!codeFocus.hasFocus) {
        Config.overwrite();
      }
    });
    relayFocus.addListener(() {
      if (!relayFocus.hasFocus) {
        Config.overwrite();
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Logo(),
        SpaceBetweenItem(
          label: S.of(context).settings_defaultCode,
          value: SizedBox(
            width: 200,
            height: 60,
            child: TextField(
              focusNode: codeFocus,
              controller: DefaultCodeTextEditingController,
              maxLength: 32,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ),
        SpaceBetweenItem(
          label: S.of(context).settings_relayServer,
          value: SizedBox(
            width: 200,
            height: 60,
            child: TextField(
              focusNode: relayFocus,
              controller: RelayServerTextEditingController,
              maxLength: 128,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
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
                        AppCodeCurve.value = curve;
                        Config.overwrite();
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
                  Config.overwrite();
                }
              },
              items: Lang.values.map<DropdownMenuItem<Lang>>((Lang lang) {
                return DropdownMenuItem<Lang>(
                  value: lang,
                  child: Text(lang.label),
                );
              }).toList(),
            )),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
        ),
      ],
    );
  }
}
