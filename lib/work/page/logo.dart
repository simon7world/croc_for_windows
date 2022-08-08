import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 400,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SvgPicture.asset(
            "images/croc_logo.svg",
            width: 400,
            semanticsLabel: 'Croc Logo',
          ),
          SvgPicture.asset(
            "images/windows_logo.svg",
            width: 300,
            semanticsLabel: 'Windows Logo',
          ),
        ],
      ),
    );
  }
}
