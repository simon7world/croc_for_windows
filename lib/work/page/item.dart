import 'package:flutter/material.dart';

import '../../constant/const.dart';

class SpaceBetweenItem extends StatelessWidget {
  const SpaceBetweenItem({Key? key, required this.label, required this.value}) : super(key: key);

  final String label;
  final Widget value;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: ContentWidth,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          value,
        ],
      ),
    );
  }
}

class SpaceBetweenTextItem extends StatelessWidget {
  const SpaceBetweenTextItem({Key? key, required this.label, required this.text, this.onTap}) : super(key: key);

  final String label, text;
  final GestureTapCallback? onTap;

  @override
  Widget build(final BuildContext context) {
    final Widget textW = Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal),
    );
    final Widget textOnTapW = GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );

    return SizedBox(
      width: ContentWidth,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          onTap == null ? textW : textOnTapW,
        ],
      ),
    );
  }
}
