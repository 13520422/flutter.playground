import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';

class Viewer extends StatelessWidget {
  final List<Component> listComponent;
  Viewer({required this.listComponent, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            /// View Code
          },
          child: Text('View Code'),
        ),
        SizedBox(height: 16.0),

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
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    constraints: BoxConstraints(minWidth: constrain.maxWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listComponent.map((e) => e.toWidgetViewer(context)).toList(),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
