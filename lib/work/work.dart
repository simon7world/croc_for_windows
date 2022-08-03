import 'package:croc_for_windows/work/page/settings.dart';
import 'package:flutter/cupertino.dart';

import '../const.dart';
import '../work/page/about.dart';

class WorkBox extends StatelessWidget {
  const WorkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
