import 'package:flutter/material.dart';

import '../../common/textFieldWithCheckbox.dart';
import '../../constant/const.dart';
import '../../generated/l10n.dart';
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
        SizedBox(
          width: 300,
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
