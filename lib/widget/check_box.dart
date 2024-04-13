import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef WidgetCheckBox = Widget Function(BuildContext context, bool isChecked);

class CheckBoxWidget extends StatefulWidget {
  final WidgetCheckBox? layout;
  final WidgetCheckBox? checkBox;
  final Widget? leading;
  final RxBool isChecked;
  final RxBool isDisabled;
  final ValueChanged<bool>? onChanged;

  CheckBoxWidget({
    Key? key,
    required this.isChecked,
    required this.isDisabled,
    this.layout,
    this.checkBox,
    @required this.onChanged,
    this.leading,
  }) : super(key: key) {}

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: widget.isDisabled.value
              ? null
              : () {
                  if (widget.onChanged != null) {
                    widget.onChanged!(!widget.isChecked.value);
                  }
                },
          child: IgnorePointer(
            //to ignore inner clicks or custom clicks from custom layout
            ignoring: true,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  widget.leading ?? Container(),
                  widget.leading == null ? Container() : const SizedBox(width: 10),
                  widget.layout != null
                      ? Expanded(child: widget.layout!(context, widget.isChecked.value))
                      : Container(),
                  widget.checkBox != null
                      ? widget.checkBox!(context, widget.isChecked.value)
                      : Checkbox(value: widget.isChecked.value, onChanged: widget.isDisabled.value ? null : (b) {}),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),
        ));
  }
}
