import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/widget/add_component.dart';
import 'package:playground/widget/custom_gesture_detector.dart';
import 'package:uuid/uuid.dart';

class CCFlexible extends Component {
  static const String runType = "CCFlexible";

  ///using function_tree or template
  int? flex;
  CCFlexible({
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
    Component? child,
    int? flex,
  }) {
    var component = CCFlexible(
      name: name ?? this.name ?? "",
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren!,
    );
    component.child = child ?? this.child?.copyWith();
    component.flex = flex ?? this.flex;
    return component;
  }

  static CCFlexible? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCFlexible(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.flex = json["flex"];
    if (json["child"] != null) {
      component.child = Component.fromJson(json["child"]);
    }
    return component;
  }

  static CCFlexible? fromWidget(Flexible widget) {
    var uuid = Uuid();
    // TODO: implement fromJson
    var component = CCFlexible(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.flex = widget.flex;
    if (widget.child != null) {
      component.child = Component.fromWidget(widget.child!);
    }
    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCFlexible.runType;
    json["name"] = name;
    json["flex"] = flex;
    json["child"] = child?.toJson();
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return Flexible(
      key: UniqueKey(),
      flex: flex ?? 1,
      child: child?.toWidgetViewer(context) ?? SizedBox(),
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return Flexible(
      flex: flex ?? 1,
      child: child?.toWidgetViewer(context) ?? SizedBox(),
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
                      Text("Flexible $name ${child != null ? "..." : ""}"),
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
                  child?.toWidgetProperties(
                        context,
                        onUpdate: (Component? component) {
                          if (component != null) {
                            child = component;
                          }
                          innerSetState.call(() {});
                          onUpdate?.call(null);
                        },
                        onDelete: (Component component) {
                          child = null;
                          onUpdate?.call(null);
                          innerSetState.call(() {});
                        },
                        onWrap: (Component component) {
                          child = component;
                          component.onDelete = (p0) {
                            child = null;
                            onUpdate?.call(null);
                            innerSetState.call(() {});
                          };
                          onUpdate?.call(null);
                          innerSetState.call(() {});
                        },
                        onWrapChildren: (Component component) {
                          ///
                          child = component;
                          component.onDelete = (p0) {
                            child = null;
                            onUpdate?.call(null);
                            innerSetState.call(() {});
                          };
                          onUpdate?.call(null);
                          innerSetState.call(() {});
                        },
                      ) ??
                      const SizedBox()
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
                Text("Flexible $name"),
                SizedBox(
                  height: 5,
                ),

                ///control
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddComponent(
                        onPressed: (BuildContext context) async {
                          /// add child
                          Component.addComponent(
                            context: context,
                            childCount: 0,
                            onUpdate: (Component? component) {
                              if (component != null) {
                                child = component;
                              }
                              innerSetState.call(() {});
                              onUpdate?.call(null);
                            },
                            onDelete: (Component component) {
                              child = null;
                              onUpdate?.call(null);
                              innerSetState.call(() {});
                            },
                            onWrap: (Component component) {
                              child = component;
                              component.onDelete = (p0) {
                                child = null;
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              };
                              onUpdate?.call(null);
                              innerSetState.call(() {});
                            },
                            onWrapChildren: (Component component) {
                              ///
                              child = component;
                              component.onDelete = (p0) {
                                child = null;
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              };
                              onUpdate?.call(null);
                              innerSetState.call(() {});
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

                ///flex
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Flex'),
                    keyboardType: TextInputType.number,
                    initialValue: flex != null ? "$flex" : null,
                    onChanged: (value) {
                      flex = int.parse(value);
                      onUpdate?.call(null);
                    },
                  ),
                ),

                SizedBox(height: 5),
                child?.toWidgetProperties(
                      context,
                      onUpdate: (Component? component) {
                        if (component != null) {
                          child = component;
                        }
                        innerSetState.call(() {});
                        onUpdate?.call(null);
                      },
                      onDelete: (Component component) {
                        child = null;
                        onUpdate?.call(null);
                        innerSetState.call(() {});
                      },
                      onWrap: (Component component) {
                        child = component;
                        component.onDelete = (p0) {
                          child = null;
                          onUpdate?.call(null);
                          innerSetState.call(() {});
                        };
                        onUpdate?.call(null);
                        innerSetState.call(() {});
                      },
                      onWrapChildren: (Component component) {
                        ///
                        child = component;
                        component.onDelete = (p0) {
                          child = null;
                          onUpdate?.call(null);
                          innerSetState.call(() {});
                        };
                        onUpdate?.call(null);
                        innerSetState.call(() {});
                      },
                    ) ??
                    const SizedBox()
              ],
            ),
          );
        }),
      );
    });
  }
}
