import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import 'item.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  final String _git = "github.com/simon7world/croc_for_windows";

  void _launchUrl(String url) {
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset("images/croc_win.png", width: 550),
        SpaceBetweenTextItem(
          label: S.of(context).about_author,
          text: "Simon Chang",
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_version,
          text: "v1.0.0",
        ),
        SpaceBetweenTextItem(
          label: S.of(context).about_github,
          text: _git,
          onTap: () => _launchUrl("https://$_git"),
        ),
      ],
    );
  }
}
