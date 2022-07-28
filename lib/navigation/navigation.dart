import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavigationBox extends StatelessWidget {
  const NavigationBox({Key? key}) : super(key: key);

  void _click(String type) {
    print("click $type");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NavigationItem(
            label: "Send",
            icon: Icons.arrow_circle_up,
            onTap: () => _click("Send"),
          ),
          NavigationItem(
            label: "Receive",
            icon: Icons.arrow_circle_down,
            onTap: () => _click("Receive"),
          ),
          NavigationItem(
            label: "Settings",
            icon: Icons.widgets_outlined,
            onTap: () => _click("Settings"),
          ),
          NavigationItem(
            label: "About",
            icon: Icons.account_circle_outlined,
            onTap: () => _click("About"),
          ),
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
}
