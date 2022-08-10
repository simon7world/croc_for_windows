import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../constant/const.dart';
import '../generated/l10n.dart';
import '../work/work_model.dart';
import 'navigation_model.dart';

class NavigationBox extends StatelessWidget {
  const NavigationBox({Key? key}) : super(key: key);

  void _switch(final int page) {
    Work.PageViewController.animateToPage(page, duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 200,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          WindowTitleBarBox(
            child: MoveWindow(
              child: const Align(
                alignment: Alignment.center,
                child: Text("$AppShortName v$AppVersion"),
              ),
            ),
          ),
          NavigationItem(
            label: S.of(context).send,
            icon: Icons.arrow_circle_up,
            onTap: () => _switch(0),
          ),
          NavigationItem(
            label: S.of(context).receive,
            icon: Icons.arrow_circle_down,
            onTap: () => _switch(1),
          ),
          NavigationItem(
            label: S.of(context).settings,
            icon: Icons.widgets_outlined,
            onTap: () => _switch(2),
          ),
          NavigationItem(
            label: S.of(context).about,
            icon: Icons.account_circle_outlined,
            onTap: () => _switch(3),
          ),
          Switch(
            value: Navigation.AppLightTheme.value,
            onChanged: (final value) {
              Navigation.AppLightTheme.value = value;
              Config.overwrite();
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
  late bool _hover;

  void _changeBgColor(final event) {
    setState(() {
      if (event is PointerEnterEvent) {
        _hover = true;
      } else if (event is PointerExitEvent) {
        _hover = false;
      }
    });
  }

  @override
  void initState() {
    _hover = false;

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _changeBgColor,
        onExit: _changeBgColor,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            color: _hover ? Theme.of(context).primaryColor : null,
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
