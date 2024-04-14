import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/extension/extension.dart';
import 'package:playground/widget/add_component.dart';
import 'package:playground/widget/custom_form.dart';
import 'package:uuid/uuid.dart';

class CCFormSubmit extends Component {
  static const String runType = "CCFormSubmit";
  String? formId;
  AutovalidateMode? autovalidateMode;

  CCFormSubmit({
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
    String? formId,
    AutovalidateMode? autovalidateMode,
  }) {
    var component = CCFormSubmit(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );
    component.formId = formId ?? this.formId;
    component.autovalidateMode = autovalidateMode ?? this.autovalidateMode;
    component.child = child ?? this.child?.copyWith();
    return component;
  }

  static CCFormSubmit? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCFormSubmit(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.formId = json["formId"];
    component.autovalidateMode = AutovalidateMode.onUserInteraction.fromJson(json["autovalidateMode"]);
    if (json["child"] != null) {
      component.child = Component.fromJson(json["child"]);
    }
    return component;
  }

  static CCFormSubmit? fromWidget(CustomForm widget) {
    var uuid = Uuid();
    // TODO: implement fromJson
    var component = CCFormSubmit(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.formId = widget.formId;
    component.autovalidateMode = widget.autovalidateMode;
    component.child = Component.fromWidget(widget.child);

    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCFormSubmit.runType;
    json["name"] = name;
    json["formId"] = formId;
    json["autovalidateMode"] = autovalidateMode?.name;
    json["child"] = child?.toJson();
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return CustomForm(
      key: UniqueKey(),
      formId: formId ?? "",
      autovalidateMode: autovalidateMode,
      child: child?.toWidgetViewer(context) ?? SizedBox(),
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return CustomForm(
      formId: formId ?? "",
      autovalidateMode: autovalidateMode,
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
                      Text("SizedBox $name ${child != null ? "..." : ""}"),
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
                Text("SizedBox $name"),
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
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'FormId'),
                          keyboardType: TextInputType.text,
                          initialValue: formId != null ? "$formId" : null,
                          onChanged: (value) {
                            formId = value;
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'AutovalidateMode'),
                              keyboardType: TextInputType.text,
                              initialValue: autovalidateMode != null ? "$autovalidateMode" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectAutovalidateMode(
                                  context: c,
                                  callBack: (AutovalidateMode? auto) {
                                    innerSetState.call(() {
                                      autovalidateMode = auto;
                                    });
                                    onUpdate?.call(null);
                                  },
                                );
                              });
                        }),
                      ),
                    ],
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
