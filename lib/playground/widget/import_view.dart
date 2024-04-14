import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';

class ImportComponent extends StatefulWidget {
  final Function(List<Component>) onSubmit;
  final Function() onCancel;
  ImportComponent({required this.onSubmit, required this.onCancel, super.key});

  @override
  State<ImportComponent> createState() => _ViewerState();
}

class _ViewerState extends State<ImportComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String jsonStr = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///
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
                constraints: BoxConstraints(minWidth: constrain.maxWidth, minHeight: constrain.maxHeight),
                child: TextField(
                  maxLines: 1000, //or null
                  decoration: InputDecoration.collapsed(hintText: "Enter your content json"),
                  onChanged: (value) {
                    jsonStr = value;
                  },
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  /// View Code
                  try {
                    var jsonObj = json.decode(jsonStr);
                    var ls = <Component>[];
                    if (jsonObj is List) {
                      ///
                      for (var element in jsonObj) {
                        var ob = Component.fromJson(element);
                        if (ob != null) {
                          ls.add(ob);
                        }
                      }
                    } else {
                      var ob = Component.fromJson(jsonObj);
                      if (ob != null) {
                        ls.add(ob);
                      }
                    }
                    widget.onSubmit.call(ls);
                  } catch (e, strace) {
                    // TODO
                    var snackBar = SnackBar(content: Text('$e \n$strace'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    print('$e \n$strace');
                  }
                },
                child: Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onCancel.call();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
