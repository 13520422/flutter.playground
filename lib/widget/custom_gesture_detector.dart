import 'package:flutter/material.dart';
import 'package:playground/component/button.dart';

class CustomGestureDetector extends StatelessWidget {
  String? action;
  dynamic data;
  Widget? child;
  CustomGestureDetector({super.key, this.action, this.data, this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      key: UniqueKey(),
      onTap: () {
        CCButton.actionButon[action ?? ""]?.call(data);
      },
      child: ColoredBox(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
