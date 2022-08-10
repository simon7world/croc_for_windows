import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../generated/l10n.dart';
import 'logo.dart';
import 'send_model.dart';

class SendPage extends StatelessWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final filePickFocus = FocusNode();

    filePickFocus.addListener(() async {
      if (filePickFocus.hasFocus) {
        final String? path = await getDirectoryPath();
        if (path != null) {
          print(path);
        }
      }
    });

    getDownloadsDirectory().then((value) => Send.FilePickTextEditingController.text = value!.path);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Logo(),
        SizedBox(
          width: 200,
          height: 60,
          child: TextField(
            focusNode: filePickFocus,
            controller: Send.FilePickTextEditingController,
            readOnly: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: S.of(context).send_filePick,
            ),
          ),
        )
      ],
    );
  }
}
