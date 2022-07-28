import 'package:flutter/cupertino.dart';

class WorkBox extends StatelessWidget {
  const WorkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(
          child: Text("a"),
        ),
        Container(
          child: Text("b"),
        ),
      ],
    );
  }
}
