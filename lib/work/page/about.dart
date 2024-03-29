import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/const.dart';
import '../../generated/l10n.dart';
import 'item.dart';
import 'logo.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const String _cfw = "github.com/simon7world/croc_for_windows";
  static const String _c = "github.com/schollz/croc";

  void _launchUrl(final String url) {
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Logo(),
        SpaceBetweenTextItem(
          label: S.of(context).about_author,
          text: "Simon P. Chang",
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_cfw,
          text: _cfw,
          onTap: () => _launchUrl("https://$_cfw"),
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_cfwVersion,
          text: AppVersion,
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_croc,
          text: _c,
          onTap: () => _launchUrl("https://$_c"),
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_crocVersion,
          text: CrocVersion,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
        ),
      ],
    );
  }
}
