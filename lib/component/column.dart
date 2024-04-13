import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/widget/add_component.dart';

class CCColumn extends Component {
  MainAxisAlignment? mainAxisAlignment;
  MainAxisSize? mainAxisSize;
  CrossAxisAlignment? crossAxisAlignment;
  CCColumn({
    required String name,
    required Function(Component?) onUpdate,
    required Function(Component) onDelete,
    Function(Component)? onWrap,
    Function(Component)? onWrapChildren,
  }) {
    super.name = name;
    super.onUpdate = onUpdate;
    super.onDelete = onDelete;
    super.onWrap = onWrap;
    super.onWrapChildren = onWrapChildren;
  }

  @override
  Component copyWith({
    String? name,
    Function(Component?)? onUpdate,
    Function(Component)? onDelete,
    Function(Component)? onWrap,
    Function(Component)? onWrapChildren,
    List<Component>? children,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    var column = CCColumn(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );
    column.children = children ?? this.children.map((e) => e.copyWith()).toList();
    column.mainAxisAlignment = mainAxisAlignment ?? this.mainAxisAlignment;
    column.mainAxisSize = mainAxisSize ?? this.mainAxisSize;
    column.crossAxisAlignment = crossAxisAlignment ?? this.crossAxisAlignment;
    return column;
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

  @override
  Widget toWidgetProperties(BuildContext context) {
    // TODO: implement toWidget
    return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
      return GestureDetector(
        onTap: () {
          isExpand.value = !isExpand.value;
        },
        child: Obx(() {
          if (!isExpand.value) {
            return Container(
              margin: const EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Column $name ${child != null ? "..." : ""}"),
                      IconButton(
                          onPressed: () {
                            onDelete?.call(this);
                          },
                          icon: Icon(Icons.close, size: 20))
                    ],
                  ),
                  SizedBox(width: 5),
                  ...children.map((e) => e.toWidgetProperties(context)).toList()
                ],
              ),
            );
          }
          return Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Row $name"),
                SizedBox(
                  height: 5,
                ),

                ///control
                Row(
                  children: [
                    Flexible(
                      child: AddComponent(
                        onPressed: (BuildContext context) async {
                          /// add child
                          Component.addComponent(
                            context: context,
                            childCount: 0,
                            onUpdate: (Component? component) {
                              if (component != null) {
                                children.add(component);
                                onUpdate?.call(null);
                              }
                              innerSetState.call(() {});
                            },
                            onDelete: (Component component) {
                              children.removeWhere((element) => element == component);
                              onUpdate?.call(null);
                              innerSetState.call(() {});
                            },
                            onWrap: (Component parent) {
                              var index = children.indexWhere((element) => element == parent.child);
                              if (index >= 0) {
                                children.removeAt(index);
                                children.insert(index, parent);
                              }
                            },
                            onWrapChildren: (Component parent) {
                              ///
                              var index = children.indexWhere((element) => element == parent.children.first);
                              if (index >= 0) {
                                children.removeAt(index);
                                children.insert(index, parent);
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: AddComponent(
                        text: "Wrap by Component",
                        onPressed: (BuildContext context) async {
                          /// add parent
                          Component.addComponent(
                            context: context,
                            childCount: 0,
                            onUpdate: (Component? parent) {
                              if (parent != null) {
                                parent.child = this;
                                onWrap?.call(parent);
                              }
                              innerSetState.call(() {});
                            },
                            onDelete: onDelete!,
                            onWrap: onWrap!,
                            onWrapChildren: onWrapChildren!,
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: AddComponent(
                        text: "Wrap by Children Component",
                        onPressed: (BuildContext context) async {
                          /// add parent
                          Component.addComponent(
                            context: context,
                            childCount: 0,
                            onUpdate: (Component? parent) {
                              if (parent != null) {
                                parent.children.add(this);
                                onWrapChildren?.call(parent);
                              }
                              innerSetState.call(() {});
                            },
                            onDelete: onDelete!,
                            onWrap: onWrap!,
                            onWrapChildren: onWrapChildren!,
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          /// add child
                          onDelete?.call(this);
                        },
                        child: Text('Remove'),
                      ),
                    ),
                  ],
                ),

                ///name
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.text,
                    initialValue: name,
                    onChanged: (value) {
                      name = value;
                      onUpdate?.call(null);
                    },
                  ),
                ),

                ///style
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'MainAxisAlignment'),
                        keyboardType: TextInputType.text,
                        initialValue: mainAxisAlignment != null ? "$mainAxisAlignment" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectMainAxisAlignment(
                            context: c,
                            callBack: (MainAxisAlignment? align) {
                              innerSetState.call(() {
                                mainAxisAlignment = align;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'CrossAxisAlignment'),
                        keyboardType: TextInputType.text,
                        initialValue: crossAxisAlignment != null ? "$crossAxisAlignment" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectCrossAxisAlignment(
                            context: c,
                            callBack: (CrossAxisAlignment? align) {
                              innerSetState.call(() {
                                crossAxisAlignment = align;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'MainAxisSize'),
                        keyboardType: TextInputType.text,
                        initialValue: mainAxisSize != null ? "$mainAxisSize" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectMainAxisSize(
                            context: c,
                            callBack: (MainAxisSize? size) {
                              innerSetState.call(() {
                                mainAxisSize = size;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),

                SizedBox(height: 5),
                ...children.map((e) => e.toWidgetProperties(context)).toList()
              ],
            ),
          );
        }),
      );
    });
  }
}
