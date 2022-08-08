import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../constant/const.dart';
import 'page/about.dart';
import 'page/settings.dart';

class WorkBox extends StatelessWidget {
  const WorkBox({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final mbColors = WindowButtonColors(
      iconNormal: Theme.of(context).highlightColor,
      mouseOver: Theme.of(context).backgroundColor,
      mouseDown: Theme.of(context).primaryColor,
      iconMouseOver: Colors.white,
      iconMouseDown: Colors.white,
    );
    final cbColors = WindowButtonColors(
      iconNormal: Theme.of(context).highlightColor,
      mouseOver: Colors.redAccent,
      mouseDown: Colors.red,
      iconMouseOver: Colors.white,
      iconMouseDown: Colors.white,
    );

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
                    MinimizeWindowButton(colors: mbColors),
                    MaximizeWindowButton(colors: mbColors),
                    CloseWindowButton(colors: cbColors),
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
