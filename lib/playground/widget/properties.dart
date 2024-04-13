import 'package:flutter/material.dart';
import 'package:playground/component/component.dart';
import 'package:playground/widget/add_component.dart';

class Properties extends StatefulWidget {
  final List<Component> listComponent;
  final Function onUpdate;
  Properties({super.key, required this.listComponent, required this.onUpdate});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  @override
  void didUpdateWidget(covariant Properties oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext c) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Components (${widget.listComponent.length})"),
          SizedBox(height: 16.0),
          AddComponent(
            onPressed: (BuildContext context) async {
              /// add child
              Component.addComponent(
                context: context,
                childCount: widget.listComponent.length,
                onUpdate: (Component? component) {
                  if (component != null) {
                    widget.listComponent.add(component);
                    setState(() {});
                  }
                  widget.onUpdate.call();
                },
                onDelete: (Component component) {
                  widget.listComponent.removeWhere((element) => element == component);
                  setState(() {});
                  widget.onUpdate.call();
                },
                onWrap: (Component parent) {
                  var index = widget.listComponent.indexWhere((element) => element == parent.child);
                  if (index >= 0) {
                    widget.listComponent.removeAt(index);
                    widget.listComponent.insert(index, parent);
                  }
                  setState(() {});
                },
                onWrapChildren: (Component parent) {
                  var index = widget.listComponent.indexWhere((element) => element == parent.children.first);
                  if (index >= 0) {
                    widget.listComponent.removeAt(index);
                    widget.listComponent.insert(index, parent);
                  }
                  setState(() {});
                },
              );
            },
          ),
          SizedBox(height: 16.0),
          Expanded(
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
                      children: widget.listComponent
                          .map((e) => e.toWidgetProperties(
                                context,
                                onUpdate: (Component? component) {
                                  if (component != null) {
                                    widget.listComponent.add(component);
                                  }
                                  setState(() {});
                                  widget.onUpdate.call();
                                },
                                onDelete: (Component component) {
                                  widget.listComponent.removeWhere((element) => element == component);
                                  setState(() {});
                                  widget.onUpdate.call();
                                },
                                onWrap: (Component parent) {
                                  var index = widget.listComponent.indexWhere((element) => element == parent.child);
                                  if (index >= 0) {
                                    widget.listComponent.removeAt(index);
                                    widget.listComponent.insert(index, parent);
                                  }
                                  setState(() {});
                                },
                                onWrapChildren: (Component parent) {
                                  var index =
                                      widget.listComponent.indexWhere((element) => element == parent.children.first);
                                  if (index >= 0) {
                                    widget.listComponent.removeAt(index);
                                    widget.listComponent.insert(index, parent);
                                  }
                                  setState(() {});
                                },
                              ))
                          .toList(),
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
