import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/widget/add_component.dart';
import 'package:uuid/uuid.dart';

class CCStack extends Component {
  static const String runType = "CCStack";
  CCStack({
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

  static CCStack? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCStack(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    if (json["children"] != null) {
      for (var element in json["children"]) {
        var c = Component.fromJson(element);
        if (c != null) {
          component.children.add(c);
        }
      }
    }
    return component;
  }

  static CCStack? fromWidget(Stack widget) {
    var uuid = Uuid();
    var component = CCStack(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    if (widget.children.isNotEmpty) {
      for (var element in widget.children) {
        var c = Component.fromWidget(element);
        if (c != null) {
          component.children.add(c);
        }
      }
    }
    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["name"] = name;
    json["runtimeType"] = CCStack.runType;
    json["children"] = children.map((e) => e.toJson()).toList();
    return json;
  }

  @override
  Component copyWith({
    String? name,
    Function(Component?)? onUpdate,
    Function(Component)? onDelete,
    Function(Component)? onWrap,
    Function(Component)? onWrapChildren,
    List<Component>? children,
  }) {
    var stack = CCStack(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren!,
    );
    stack.children = children ?? this.children.map((e) => e.copyWith()).toList();
    return stack;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return Stack(
      key: UniqueKey(),
      children: children.map((e) => e.toWidgetViewer(context)).toList(),
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return Stack(
      children: children.map((e) => e.toWidgetViewer(context)).toList(),
    );
  }

  @override
  Widget toWidgetProperties(
    BuildContext context, {
    Function(Component?)? onUpdate,
    Function(Component)? onDelete,
    Function(Component)? onWrap,
    Function(Component)? onWrapChildren,
  }) {
    if (onUpdate != null) {
      this.onUpdate = onUpdate;
    }
    if (onDelete != null) {
      this.onDelete = onDelete;
    }
    if (onWrap != null) {
      this.onWrap = onWrap;
    }
    if (onWrapChildren != null) {
      this.onWrapChildren = onWrapChildren;
    }
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
                      Text("Row $name ${child != null ? "..." : ""}"),
                      IconButton(
                          onPressed: () {
                            onDelete?.call(this);
                          },
                          icon: Icon(Icons.close, size: 20)),
                      IconButton(
                          onPressed: () {
                            Component.copyComponent = copyWith();
                          },
                          icon: Icon(Icons.copy, size: 20))
                    ],
                  ),
                  SizedBox(width: 5),
                  ...children
                      .map((e) => e.toWidgetProperties(
                            context,
                            onUpdate: (Component? component) {
                              if (component != null) {
                                children.add(component);
                                onUpdate?.call(null);
                              }
                              onUpdate?.call(null);
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
                                children[index].onDelete = (p0) {
                                  children.removeAt(index);
                                  onUpdate?.call(null);
                                  innerSetState.call(() {});
                                };
                              }
                            },
                            onWrapChildren: (Component parent) {
                              ///
                              var index = children.indexWhere((element) => element == parent.children.first);
                              if (index >= 0) {
                                children.removeAt(index);
                                children.insert(index, parent);
                                children[index].onDelete = (p0) {
                                  children.removeAt(index);
                                  onUpdate?.call(null);
                                  innerSetState.call(() {});
                                };
                              }
                            },
                          ))
                      .toList()
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
            width: MediaQuery.of(context).size.width * widthDefaultComponent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Stack $name"),
                SizedBox(
                  height: 5,
                ),

                ///control
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AddComponent(
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
                              onUpdate?.call(null);
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
                                children[index].onDelete = (p0) {
                                  children.removeAt(index);
                                  onUpdate?.call(null);
                                  innerSetState.call(() {});
                                };
                              }
                            },
                            onWrapChildren: (Component parent) {
                              ///
                              var index = children.indexWhere((element) => element == parent.children.first);
                              if (index >= 0) {
                                children.removeAt(index);
                                children.insert(index, parent);
                                children[index].onDelete = (p0) {
                                  children.removeAt(index);
                                  onUpdate?.call(null);
                                  innerSetState.call(() {});
                                };
                              }
                            },
                          );
                        },
                      ),
                      AddComponent(
                        text: "Wrap by\nComponent",
                        onPressed: (BuildContext context) async {
                          /// add parent
                          Component.addComponent(
                            context: context,
                            childCount: 0,
                            onUpdate: (Component? parent) {
                              if (parent != null) {
                                parent.child = this;
                                onDelete = (p0) {
                                  parent.child = null;
                                  onUpdate?.call(null);
                                };
                                onWrap?.call(parent);
                              }
                              onUpdate?.call(null);
                              innerSetState.call(() {});
                            },
                            onDelete: onDelete!,
                            onWrap: onWrap!,
                            onWrapChildren: onWrapChildren!,
                            isChild: true,
                          );
                        },
                      ),
                      AddComponent(
                        text: "Wrap by\nChildren Component",
                        onPressed: (BuildContext context) async {
                          /// add parent
                          Component.addComponent(
                            context: context,
                            childCount: 0,
                            onUpdate: (Component? parent) {
                              if (parent != null) {
                                parent.children.add(this);
                                onDelete = (p0) {
                                  parent.children.removeWhere((element) => element == this);
                                  onUpdate?.call(null);
                                  innerSetState.call(() {});
                                };
                                onWrapChildren?.call(parent);
                              }
                              onUpdate?.call(null);
                              innerSetState.call(() {});
                            },
                            onDelete: onDelete!,
                            onWrap: onWrap!,
                            onWrapChildren: onWrapChildren!,
                            isChildren: true,
                          );
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          /// add child
                          onDelete?.call(this);
                        },
                        child: Text('Remove'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          /// add child
                          Component.copyComponent = copyWith();
                        },
                        child: Text('Copy'),
                      ),
                    ],
                  ),
                ),

                ///name
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
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

                SizedBox(height: 5),
                ...children
                    .map((e) => e.toWidgetProperties(
                          context,
                          onUpdate: (Component? component) {
                            if (component != null) {
                              children.add(component);
                              onUpdate?.call(null);
                            }
                            onUpdate?.call(null);
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
                              children[index].onDelete = (p0) {
                                children.removeAt(index);
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              };
                            }
                          },
                          onWrapChildren: (Component parent) {
                            ///
                            var index = children.indexWhere((element) => element == parent.children.first);
                            if (index >= 0) {
                              children.removeAt(index);
                              children.insert(index, parent);
                              children[index].onDelete = (p0) {
                                children.removeAt(index);
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              };
                            }
                          },
                        ))
                    .toList()
              ],
            ),
          );
        }),
      );
    });
  }
}
