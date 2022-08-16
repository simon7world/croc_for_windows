import 'dart:io';

import 'package:path/path.dart' as path;

class Common {
  static String get crocExePath {
    return path.join(File(Platform.resolvedExecutable).parent.path, "data", "flutter_assets", "croc", "croc.exe");
  }
}
