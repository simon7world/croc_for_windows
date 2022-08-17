import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/textFieldWithCheckbox.dart';
import '../../config/config.dart';
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

  void _openFolder() {
    final path = Send.FilePickTextEditingController.text;
    if (path != "") {
      if (FileSystemEntity.isDirectorySync(path)) {
        launchUrlString(path);
      } else {
        launchUrlString(File(path).parent.path);
      }
    }
  }

  void _getFile() async {
    final XFile? file = await openFile();
    if (file != null) {
      Send.FilePickTextEditingController.text = file.path;
      Config.overwrite();
    }
  }

  void _getFolder() async {
    final String? path = await getDirectoryPath();
    if (path != null) {
      Send.FilePickTextEditingController.text = path;
      Config.overwrite();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Logo(),
        PopupMenuButton<Select>(
          elevation: 9,
          onSelected: (final Select select) {
            switch (select) {
              case Select.FILE:
                _getFile();
                break;
              case Select.FOLDER:
                _getFolder();
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
          onUncheck: (w) => w.changeText(""),
        ),
        SizedBox(
          width: 450,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: _buttonStyle,
                onPressed: () => Send.sendFile(context),
                child: Text(S.of(context).send_sending),
              ),
              ElevatedButton(
                style: _buttonStyle,
                onPressed: _openFolder,
                child: Text(S.of(context).send_openFolder),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
