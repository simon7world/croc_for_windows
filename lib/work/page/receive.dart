import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:path/path.dart' as path;

import '../../common/textFieldWithCheckbox.dart';
import '../../config/config.dart';
import '../../constant/const.dart';
import '../../generated/l10n.dart';
import 'logo.dart';
import 'receive_model.dart';
import 'settings_model.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({Key? key}) : super(key: key);

  static final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    textStyle: const TextStyle(fontSize: 20),
  );

  void _openFolder() {
    launchUrlString(Receive.FilePickTextEditingController.text);
  }

  void _getLocation() async {
    final String? dir = await getDirectoryPath();
    if (dir != null) {
      Receive.FilePickTextEditingController.text = "$dir${path.separator}";
      Config.overwrite();
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (Receive.FilePickTextEditingController.text == "") {
      getDownloadsDirectory().then((value) => Receive.FilePickTextEditingController.text = value!.path);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Logo(),
        SizedBox(
          width: ContentWidth,
          height: TextFieldHeight,
          child: TextField(
            onTap: _getLocation,
            controller: Receive.FilePickTextEditingController,
            readOnly: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: S.of(context).receive_location,
            ),
          ),
        ),
        WidgetTextFieldWithCheckbox(
          textController: Receive.CodeTextEditingController,
          checkedNotifier: Receive.DefaultCode,
          textLabel: S.of(context).receive_code,
          checkboxLabel: S.of(context).receive_useDefaultCode,
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
                onPressed: () => Receive.receiveFile(context),
                child: Text(S.of(context).receive_receiving),
              ),
              ElevatedButton(
                style: _buttonStyle,
                onPressed: _openFolder,
                child: Text(S.of(context).receive_openFolder),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
