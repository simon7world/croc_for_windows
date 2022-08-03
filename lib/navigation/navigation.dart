import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../generated/l10n.dart';

class NavigationBox extends StatelessWidget {
  const NavigationBox({Key? key}) : super(key: key);

  void _click(String type) {
    switch (type) {
      case "send":
        WorkPageController.animateToPage(0, duration: const Duration(milliseconds: 250), curve: Curves.ease);
        break;
      case "receive":
        WorkPageController.animateToPage(1, duration: const Duration(milliseconds: 250), curve: Curves.ease);
        break;
      case "settings":
        WorkPageController.animateToPage(2, duration: const Duration(milliseconds: 250), curve: Curves.ease);
        break;
      case "about":
        WorkPageController.animateToPage(3, duration: const Duration(milliseconds: 250), curve: Curves.ease);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NavigationItem(
            label: S.of(context).send,
            icon: Icons.arrow_circle_up,
            onTap: () => _click("send"),
          ),
          NavigationItem(
            label: S.of(context).receive,
            icon: Icons.arrow_circle_down,
            onTap: () => _click("receive"),
          ),
          NavigationItem(
            label: S.of(context).settings,
            icon: Icons.widgets_outlined,
            onTap: () => _click("settings"),
          ),
          NavigationItem(
            label: S.of(context).about,
            icon: Icons.account_circle_outlined,
            onTap: () => _click("about"),
          ),
          Switch(
            value: LightTheme.value,
            onChanged: (value) {
              LightTheme.value = value;
            },
          )
        ],
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  const NavigationItem({Key? key, required this.label, required this.icon, this.onTap}) : super(key: key);

  final String label;
  final IconData icon;
  final GestureTapCallback? onTap;

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  var _hover = false;
  late Color _bgHoverColor;

  void _changeBgColor(event) {
    setState(() {
      if (event is PointerEnterEvent) {
        _hover = true;
      } else if (event is PointerExitEvent) {
        _hover = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _bgHoverColor = Theme.of(context).primaryColor;

    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _changeBgColor,
        onExit: _changeBgColor,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 200,
            color: _hover ? _bgHoverColor : null,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                  child: Icon(widget.icon),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
