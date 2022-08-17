import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import '../generated/l10n.dart';

String get crocExePath {
  return path.join(File(Platform.resolvedExecutable).parent.path, "data", "flutter_assets", "croc", "croc.exe");
}

Future<void> showError(final BuildContext context, final String content) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (final BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).error),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(S.of(context).ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
