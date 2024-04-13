import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';

class Viewer extends StatefulWidget {
  final List<Component> listComponent;
  Viewer({required this.listComponent});
  @override
  State<Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Viewer oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [],
    );
  }
}
