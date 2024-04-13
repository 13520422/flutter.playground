import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';

class ViewCode extends StatefulWidget {
  final List<Component> listComponet;
  final Function onViewDesign;
  void Function(void Function(void Function()))? innerSetState;
  ViewCode({required this.listComponet, required this.onViewDesign, this.innerSetState, super.key});

  @override
  State<ViewCode> createState() => _ViewCodeState();
}

class _ViewCodeState extends State<ViewCode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.innerSetState?.call(setState);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            /// View Code
            widget.onViewDesign.call();
          },
          child: Text('View Design'),
        ),
        SizedBox(height: 16.0),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: LayoutBuilder(builder: (context, constrain) {
              return Container(
                constraints: BoxConstraints(minWidth: constrain.maxWidth),
                child: SelectableText(getJson()),
              );
            }),
          ),
        ),
      ],
    );
  }

  String getJson() {
    final _json = const JsonEncoder.withIndent('  ').convert(widget.listComponet);
    return _json;
  }
}
