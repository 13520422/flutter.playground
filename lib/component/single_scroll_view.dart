import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/extension/extension.dart';
import 'package:playground/widget/add_component.dart';
import 'package:playground/widget/diaglog_select_box.dart';
import 'package:uuid/uuid.dart';

class CCScrollView extends Component {
  static const String runType = "CCScrollView";
  Axis scrollDirection = Axis.vertical;
  bool reverse = false;
  EdgeInsets padding = EdgeInsets.zero;
  ScrollPhysics? physics;

  CCScrollView({
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
    Axis? scrollDirection,
    bool? reverse,
    EdgeInsets? padding,
    ScrollPhysics? physics,
  }) {
    var scroll = CCScrollView(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren!,
    );
    scroll.child = child ?? this.child?.copyWith();
    scroll.scrollDirection = scrollDirection ?? this.scrollDirection;
    scroll.reverse = reverse ?? this.reverse;
    scroll.padding = padding ?? this.padding;
    scroll.physics = physics ?? this.physics;
    return scroll;
  }

  static CCScrollView? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCScrollView(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.reverse = json["reverse"];
    component.scrollDirection = Axis.horizontal.fromJson(json["scrollDirection"]);
    component.padding = EdgeInsets.zero.fromJson(json["top"]) ?? EdgeInsets.zero;
    if (json["physics"] != null) {
      var ls = [
        SelectModel<ScrollPhysics>(
            name: BouncingScrollPhysics().runtimeType.toString(), value: BouncingScrollPhysics()),
        SelectModel<ScrollPhysics>(
            name: ClampingScrollPhysics().runtimeType.toString(), value: ClampingScrollPhysics()),
        SelectModel<ScrollPhysics>(
            name: NeverScrollableScrollPhysics().runtimeType.toString(), value: NeverScrollableScrollPhysics()),
        SelectModel<ScrollPhysics>(
            name: AlwaysScrollableScrollPhysics().runtimeType.toString(), value: AlwaysScrollableScrollPhysics()),
      ];
      var ls1 = ls.where((element) => element.name == json["physics"]).toList();
      if (ls1.isNotEmpty) {
        component.physics = ls1.first.value;
      }
    }
    if (json["child"] != null) {
      component.child = Component.fromJson(json["child"]);
    }
    return component;
  }

  static CCScrollView? fromWidget(SingleChildScrollView widget) {
    var uuid = Uuid();
    var component = CCScrollView(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.reverse = widget.reverse;
    component.scrollDirection = widget.scrollDirection;
    component.padding = (widget.padding as EdgeInsets?) ?? EdgeInsets.zero;
    if (widget.physics != null) {
      var ls = [
        SelectModel<ScrollPhysics>(
            name: BouncingScrollPhysics().runtimeType.toString(), value: BouncingScrollPhysics()),
        SelectModel<ScrollPhysics>(
            name: ClampingScrollPhysics().runtimeType.toString(), value: ClampingScrollPhysics()),
        SelectModel<ScrollPhysics>(
            name: NeverScrollableScrollPhysics().runtimeType.toString(), value: NeverScrollableScrollPhysics()),
        SelectModel<ScrollPhysics>(
            name: AlwaysScrollableScrollPhysics().runtimeType.toString(), value: AlwaysScrollableScrollPhysics()),
      ];
      var ls1 = ls.where((element) => element.name == widget.physics.runtimeType.toString()).toList();
      if (ls1.isNotEmpty) {
        component.physics = ls1.first.value;
      }
    }
    if (widget.child != null) {
      component.child = Component.fromWidget(widget.child!);
    }

    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCScrollView.runType;
    json["name"] = name;
    json["reverse"] = reverse;
    json["physics"] = physics?.runtimeType;
    json["scrollDirection"] = scrollDirection.name;
    json["padding"] = padding.toJson();
    json["child"] = child?.toJson();
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return SingleChildScrollView(
      key: UniqueKey(),
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      physics: physics,
      child: child?.toWidgetViewer(context),
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      physics: physics,
      child: child?.toWidgetViewer(context),
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
                      Text("ScrollView $name ${child != null ? "..." : ""}"),
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
                            onUpdate?.call(null);
                          }
                          onUpdate?.call(null);
                          innerSetState.call(() {});
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
            width: MediaQuery.of(context).size.width * widthDefaultComponent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ScrollView $name"),
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
                                onUpdate?.call(null);
                              }
                              onUpdate?.call(null);
                              innerSetState.call(() {});
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

                ///padding
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Padding"),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Left'),
                              keyboardType: TextInputType.number,
                              initialValue: "${padding.left}",
                              onChanged: (value) {
                                padding = padding.copyWith(left: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Right'),
                              keyboardType: TextInputType.number,
                              initialValue: "${padding.right}",
                              onChanged: (value) {
                                padding = padding.copyWith(right: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top'),
                              keyboardType: TextInputType.number,
                              initialValue: "${padding.top}",
                              onChanged: (value) {
                                padding = padding.copyWith(top: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom'),
                              keyboardType: TextInputType.number,
                              initialValue: "${padding.bottom}",
                              onChanged: (value) {
                                padding = padding.copyWith(bottom: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ///scrollDirection
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'ScrollDirection'),
                        keyboardType: TextInputType.text,
                        initialValue: "$scrollDirection",
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectScrollDirection(
                            context: c,
                            callBack: (Axis axis) {
                              innerSetState.call(() {
                                scrollDirection = axis;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),

                ///physics
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'Physics'),
                        keyboardType: TextInputType.text,
                        initialValue: "$physics",
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectPhysics(
                            context: c,
                            callBack: (ScrollPhysics physic) {
                              innerSetState.call(() {
                                physics = physic;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),

                ///reverse
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'reverse', hintText: "true or false"),
                    keyboardType: TextInputType.text,
                    initialValue: "$reverse",
                    onChanged: (value) {
                      reverse = bool.parse(value);
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
                          onUpdate?.call(null);
                        }
                        onUpdate?.call(null);
                        innerSetState.call(() {});
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
