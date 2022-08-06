import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import 'item.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  final String _cfw = "github.com/simon7world/croc_for_windows";
  final String _c = "github.com/schollz/croc";

  void _launchUrl(String url) {
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Image.asset("images/croc_win.png", width: 400),
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_author,
          text: "Simon P. Chang",
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_version,
          text: "v1.0.0",
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_cfw,
          text: _cfw,
          onTap: () => _launchUrl("https://$_cfw"),
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_c,
          text: _c,
          onTap: () => _launchUrl("https://$_c"),
        ),
      ],
    );
  }
}
