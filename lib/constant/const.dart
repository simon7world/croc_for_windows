import 'dart:io';

import '../util/common.dart';

const AppVersion = "v1.0.0";
const AppName = "Croc for Windows";
const AppShortName = "CFW";
const AppFontFamily = "Microsoft YaHei";

const ContentWidth = 500.0;
const TextFieldHeight = 60.0;

var _cv = "";

String get CrocVersion {
  if (_cv == "") {
    final ret = Process.runSync(crocExePath, ["--version"]).stdout as String;
    _cv = ret.split(" ")[2];
  }

  return _cv;
}
