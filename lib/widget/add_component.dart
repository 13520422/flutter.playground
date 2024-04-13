import 'package:flutter/material.dart';

class AddComponent extends StatefulWidget {
  String? text;
  final Function(BuildContext) onPressed;
  AddComponent({required this.onPressed, this.text});
  @override
  State<AddComponent> createState() => _AState();
}

class _AState extends State<AddComponent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {
        widget.onPressed.call(context);
      },
      child: Text(widget.text ?? 'Add component'),
    );
  }
}
