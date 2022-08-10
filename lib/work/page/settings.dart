import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../constant/enums.dart';
import '../../generated/l10n.dart';
import 'item.dart';
import 'logo.dart';
import 'settings_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
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
                controller: Settings.DefaultCodeTextEditingController,
                maxLength: 32,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            )),
        SpaceBetweenItem(
            label: S.of(context).settings_relayServer,
            value: SizedBox(
              width: 200,
              height: 60,
              child: TextField(
                focusNode: relayFocus,
                controller: Settings.RelayServerTextEditingController,
                maxLength: 128,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            )),
        SpaceBetweenItem(
            label: S.of(context).settings_encryptionCurve,
            value: ValueListenableBuilder(
                valueListenable: Settings.AppCodeCurve,
                builder: (final context, final CodeCurve curve, final child) {
                  return DropdownButton<CodeCurve>(
                    alignment: Alignment.center,
                    elevation: 9,
                    value: curve,
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).hintColor,
                    ),
                    onChanged: (final CodeCurve? curve) {
                      if (curve != null) {
                        Settings.AppCodeCurve.value = curve;
                        Config.overwrite();
                      }
                    },
                    items: CodeCurve.values.map<DropdownMenuItem<CodeCurve>>((final CodeCurve curve) {
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
              value: Settings.AppLang.value,
              underline: Container(
                height: 1,
                color: Theme.of(context).hintColor,
              ),
              onChanged: (final Lang? lang) {
                if (lang != null) {
                  Settings.AppLang.value = lang;
                  Config.overwrite();
                }
              },
              items: Lang.values.map<DropdownMenuItem<Lang>>((final Lang lang) {
                return DropdownMenuItem<Lang>(
                  value: lang,
                  child: Text(lang.label),
                );
              }).toList(),
            )),
        SpaceBetweenItem(
            label: S.of(context).settings_primaryColor,
            value: DropdownButton<Color>(
              alignment: Alignment.center,
              elevation: 9,
              value: Settings.AppPrimaryColor.value,
              underline: Container(
                height: 1,
                color: Theme.of(context).hintColor,
              ),
              onChanged: (final Color? color) {
                if (color != null) {
                  Settings.AppPrimaryColor.value = color;
                  Config.overwrite();
                }
              },
              items: Color.values.map<DropdownMenuItem<Color>>((final Color color) {
                return DropdownMenuItem<Color>(
                  value: color,
                  child: Text(color.label),
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
