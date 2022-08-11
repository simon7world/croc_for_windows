import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/const.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: ContentWidth - 100,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SvgPicture.asset(
            "images/croc_logo.svg",
            width: ContentWidth - 100,
            semanticsLabel: 'Croc Logo',
          ),
          SvgPicture.asset(
            "images/windows_logo.svg",
            width: ContentWidth - 200,
            semanticsLabel: 'Windows Logo',
          ),
        ],
      ),
    );
  }
}
