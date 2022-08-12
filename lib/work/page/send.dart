import 'package:flutter/material.dart';

import '../../common/textFieldWithCheckbox.dart';
import '../../constant/const.dart';
import '../../constant/enums.dart';
import '../../generated/l10n.dart';
import '../../constant/exL10n.dart';
import 'logo.dart';
import 'send_model.dart';
import 'settings_model.dart';

class SendPage extends StatelessWidget {
  const SendPage({Key? key}) : super(key: key);

  static final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    textStyle: const TextStyle(fontSize: 20),
  );

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Logo(),
        PopupMenuButton<Select>(
          onSelected: (Select select) {
            switch (select) {
              case Select.FILE:
                break;
              case Select.FOLDER:
                break;
            }
          },
          child: SizedBox(
            width: ContentWidth,
            height: TextFieldHeight,
            child: TextField(
              controller: Send.FilePickTextEditingController,
              enabled: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: S.of(context).send_filePick,
              ),
            ),
          ),
          itemBuilder: (context) => Select.values.map<PopupMenuEntry<Select>>((final Select select) {
            return PopupMenuItem<Select>(
              value: select,
              child: Text(S.of(context).get("select_${select.code}")),
            );
          }).toList(),
        ),
        WidgetTextFieldWithCheckbox(
          textController: Send.CodeTextEditingController,
          checkedNotifier: Send.DefaultCode,
          textLabel: S.of(context).send_code,
          checkboxLabel: S.of(context).send_useDefaultCode,
          onCheck: (w) => w.changeText(Settings.DefaultCodeTextEditingController.text),
        ),
        ElevatedButton(
          style: _buttonStyle,
          onPressed: Send.sendFile,
          child: Text(S.of(context).send_sending),
        ),
      ],
    );
  }
}
