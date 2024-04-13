import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';

class Viewer extends StatefulWidget {
  final List<Component> listComponent;
  final Function onViewCode;
  void Function(void Function(void Function()))? innerSetState;
  Viewer({required this.listComponent, required this.onViewCode, this.innerSetState, super.key});

  @override
  State<Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
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
            widget.onViewCode.call();
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
                      children: widget.listComponent.map((e) => e.toWidgetViewer(context)).toList(),
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
