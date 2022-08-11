import 'package:flutter/material.dart';

import '../config/config.dart';
import '../constant/const.dart';
import '../work/page/settings_model.dart';
import 'textFieldWithCheckbox_model.dart';

class WidgetTextFieldWithCheckbox extends StatelessWidget {
  const WidgetTextFieldWithCheckbox(
      {Key? key,
      required this.textController,
      required this.checkedNotifier,
      required this.textLabel,
      required this.checkboxLabel,
      this.onCheck,
      this.onUncheck})
      : super(key: key);

  final TextEditingController textController;
  final ValueNotifier<bool> checkedNotifier;
  final String textLabel, checkboxLabel;
  final TextFieldWithCheckboxCallback? onCheck, onUncheck;

  static const Set<MaterialState> _interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  void changeText(String text) => textController.text = text;

  Color _getColor(Set<MaterialState> states) {
    if (states.any(_interactiveStates.contains)) {
      return Settings.AppPrimaryColor.value.value;
    }
    return Settings.AppPrimaryColor.value.value;
  }

  @override
  Widget build(final BuildContext context) {
    checkedNotifier.value ? onCheck?.call(this) : onUncheck?.call(this);

    return ValueListenableBuilder(
        valueListenable: checkedNotifier,
        builder: (final context, final bool checked, final child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: ContentWidth,
                height: TextFieldHeight + 20,
                child: TextField(
                  enabled: !checked,
                  maxLength: 32,
                  controller: textController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: textLabel,
                  ),
                ),
              ),
              SizedBox(
                width: ContentWidth,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(_getColor),
                      value: checked,
                      onChanged: (bool? value) {
                        (checkedNotifier.value = value!) ? onCheck?.call(this) : onUncheck?.call(this);
                        Config.overwrite();
                      },
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          (checkedNotifier.value = !checkedNotifier.value)
                              ? onCheck?.call(this)
                              : onUncheck?.call(this);
                          Config.overwrite();
                        },
                        child: Text(checkboxLabel),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
