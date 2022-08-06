import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';

import '../constant/const.dart';
import 'page/about.dart';
import 'page/settings.dart';

class WorkBox extends StatelessWidget {
  const WorkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          WindowTitleBarBox(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MoveWindow(),
                ),
                Row(
                  children: <Widget>[
                    MinimizeWindowButton(),
                    MaximizeWindowButton(),
                    CloseWindowButton(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: WorkPageController,
              children: <Widget>[
                Container(
                  child: Text("aaaaaaaaa"),
                ),
                Container(
                  child: Text("bbbbbbbbbbbb"),
                ),
                const SettingsPage(),
                const AboutPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
