import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/widget/add_component.dart';

class CCContainer extends Component {
  double? width;
  double? height;
  Alignment? alignment;
  EdgeInsets padding = EdgeInsets.zero;
  EdgeInsets margin = EdgeInsets.zero;
  Border? border;
  Color? color;
  BorderRadius borderRadius = BorderRadius.zero;
  BoxShape? shape;
  BoxShadow? boxShadow;
  CCContainer({
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
    double? width,
    double? height,
    Alignment? alignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Border? border,
    Color? color,
    BorderRadius? borderRadius,
    BoxShape? shape,
    BoxShadow? boxShadow,
  }) {
    var component = CCContainer(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );
    component.width = width ?? this.width;
    component.height = height ?? this.height;
    component.alignment = alignment ?? this.alignment;
    component.padding = padding ?? this.padding;
    component.margin = margin ?? this.margin;
    component.border = border ?? this.border;
    component.color = color ?? this.color;
    component.borderRadius = borderRadius ?? this.borderRadius;
    component.shape = shape ?? this.shape;
    component.boxShadow = boxShadow ?? this.boxShadow;
    component.child = child ?? this.child?.copyWith();
    return component;
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
                      Text("Container $name ${child != null ? "..." : ""}"),
                      IconButton(
                          onPressed: () {
                            onDelete?.call(this);
                          },
                          icon: Icon(Icons.close, size: 20))
                    ],
                  ),
                  SizedBox(width: 5),
                  child?.toWidgetProperties(context) ?? const SizedBox()
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
                Text("Container $name"),
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
                                child = component;
                                onUpdate?.call(null);
                              }
                              innerSetState.call(() {});
                            },
                            onDelete: (Component component) {
                              child = null;
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Width'),
                          keyboardType: TextInputType.number,
                          initialValue: width != null ? "$width" : null,
                          onChanged: (value) {
                            width = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Height'),
                          keyboardType: TextInputType.number,
                          initialValue: height != null ? "$height" : null,
                          onChanged: (value) {
                            height = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                ///Alignment
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'Alignment'),
                        keyboardType: TextInputType.text,
                        initialValue: alignment != null ? "$alignment" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectAlignment(
                            context: c,
                            callBack: (Alignment? ali) {
                              innerSetState.call(() {
                                alignment = ali;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),

                ///padding
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
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

                ///margin
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text("Margin"),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Left'),
                              keyboardType: TextInputType.number,
                              initialValue: "${margin.left}",
                              onChanged: (value) {
                                margin = margin.copyWith(left: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Right'),
                              keyboardType: TextInputType.number,
                              initialValue: "${margin.right}",
                              onChanged: (value) {
                                margin = margin.copyWith(right: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top'),
                              keyboardType: TextInputType.number,
                              initialValue: "${margin.top}",
                              onChanged: (value) {
                                margin = margin.copyWith(top: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom'),
                              keyboardType: TextInputType.number,
                              initialValue: "${margin.bottom}",
                              onChanged: (value) {
                                margin = margin.copyWith(bottom: double.parse(value));
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

                ///color
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue:
                                  color != null ? "0x${color?.value.toRadixString(16).padLeft(8, '0')})" : null,
                              onChanged: (value) {
                                color = Color(int.parse(value));
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              },
                            ),
                          ),
                          Container(key: UniqueKey(), width: 30, height: 30, color: color)
                        ],
                      ),
                    ),
                  ],
                ),

                /// Border
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Border"),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue: border?.top.color != null
                                  ? "0x${border?.top.color.value.toRadixString(16).padLeft(8, '0')})"
                                  : null,
                              onChanged: (value) {
                                var _color = Color(int.parse(value));
                                border = Border(
                                  top: BorderSide(
                                    color: _color,
                                    width: border?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: _color,
                                    width: border?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: _color,
                                    width: border?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: _color,
                                    width: border?.right.width ?? 0,
                                  ),
                                );

                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Left'),
                              keyboardType: TextInputType.number,
                              initialValue: "${border?.left.width ?? 0}",
                              onChanged: (value) {
                                var left = double.parse(value);
                                border = Border(
                                  top: BorderSide(
                                    color: border?.top.color ?? Colors.transparent,
                                    width: border?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: border?.bottom.color ?? Colors.transparent,
                                    width: border?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: border?.left.color ?? Colors.transparent,
                                    width: left,
                                  ),
                                  right: BorderSide(
                                    color: border?.right.color ?? Colors.transparent,
                                    width: border?.right.width ?? 0,
                                  ),
                                );
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Right'),
                              keyboardType: TextInputType.number,
                              initialValue: "${border?.right.width ?? 0}",
                              onChanged: (value) {
                                var right = double.parse(value);
                                border = Border(
                                  top: BorderSide(
                                    color: border?.top.color ?? Colors.transparent,
                                    width: border?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: border?.bottom.color ?? Colors.transparent,
                                    width: border?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: border?.left.color ?? Colors.transparent,
                                    width: border?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: border?.right.color ?? Colors.transparent,
                                    width: right,
                                  ),
                                );
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top'),
                              keyboardType: TextInputType.number,
                              initialValue: "${border?.top.width ?? 0}",
                              onChanged: (value) {
                                var top = double.parse(value);
                                border = Border(
                                  top: BorderSide(
                                    color: border?.top.color ?? Colors.transparent,
                                    width: top,
                                  ),
                                  bottom: BorderSide(
                                    color: border?.bottom.color ?? Colors.transparent,
                                    width: border?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: border?.left.color ?? Colors.transparent,
                                    width: border?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: border?.right.color ?? Colors.transparent,
                                    width: border?.right.width ?? 0,
                                  ),
                                );
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom'),
                              keyboardType: TextInputType.number,
                              initialValue: "${border?.bottom.width ?? 0}",
                              onChanged: (value) {
                                var bottom = double.parse(value);
                                border = Border(
                                  top: BorderSide(
                                    color: border?.top.color ?? Colors.transparent,
                                    width: border?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: border?.bottom.color ?? Colors.transparent,
                                    width: bottom,
                                  ),
                                  left: BorderSide(
                                    color: border?.left.color ?? Colors.transparent,
                                    width: border?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: border?.right.color ?? Colors.transparent,
                                    width: border?.right.width ?? 0,
                                  ),
                                );
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

                /// BorderRadius
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("BorderRadius"),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top Left'),
                              keyboardType: TextInputType.number,
                              initialValue: "${borderRadius.topLeft.x}",
                              onChanged: (value) {
                                var topLeft = double.parse(value);
                                borderRadius = borderRadius.copyWith(topLeft: Radius.circular(topLeft));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top Right'),
                              keyboardType: TextInputType.number,
                              initialValue: "${borderRadius.topRight.x}",
                              onChanged: (value) {
                                var topRight = double.parse(value);
                                borderRadius = borderRadius.copyWith(topRight: Radius.circular(topRight));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom Left'),
                              keyboardType: TextInputType.number,
                              initialValue: "${borderRadius.bottomLeft.x}",
                              onChanged: (value) {
                                var bottomLeft = double.parse(value);
                                borderRadius = borderRadius.copyWith(bottomLeft: Radius.circular(bottomLeft));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom Right'),
                              keyboardType: TextInputType.number,
                              initialValue: "${borderRadius.bottomRight.x}",
                              onChanged: (value) {
                                var bottomRight = double.parse(value);
                                borderRadius = borderRadius.copyWith(bottomRight: Radius.circular(bottomRight));
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

                /// Shape
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'Shape'),
                        keyboardType: TextInputType.text,
                        initialValue: shape != null ? "$shape" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectShape(
                            context: c,
                            callBack: (BoxShape? sh) {
                              innerSetState.call(() {
                                shape = sh;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),

                /// BoxShadow
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("BoxShadow"),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue: boxShadow?.color != null
                                  ? "0x${boxShadow?.color.value.toRadixString(16).padLeft(8, '0')})"
                                  : null,
                              onChanged: (value) {
                                var _color = Color(int.parse(value));
                                boxShadow = BoxShadow(
                                  color: _color,
                                  offset: boxShadow?.offset ?? Offset.zero,
                                  blurRadius: boxShadow?.blurRadius ?? 0,
                                  spreadRadius: boxShadow?.spreadRadius ?? 0,
                                );

                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Offset dx'),
                              keyboardType: TextInputType.number,
                              initialValue: "${boxShadow?.offset.dx ?? 0}",
                              onChanged: (value) {
                                var dx = double.parse(value);
                                boxShadow ==
                                    BoxShadow(
                                      color: boxShadow?.color ?? Colors.transparent,
                                      offset: Offset(dx, boxShadow?.offset.dy ?? 0),
                                      blurRadius: boxShadow?.blurRadius ?? 0,
                                      spreadRadius: boxShadow?.spreadRadius ?? 0,
                                    );
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Offset dy'),
                              keyboardType: TextInputType.number,
                              initialValue: "${boxShadow?.offset.dx ?? 0}",
                              onChanged: (value) {
                                var dy = double.parse(value);
                                boxShadow ==
                                    BoxShadow(
                                      color: boxShadow?.color ?? Colors.transparent,
                                      offset: Offset(boxShadow?.offset.dx ?? 0, dy),
                                      blurRadius: boxShadow?.blurRadius ?? 0,
                                      spreadRadius: boxShadow?.spreadRadius ?? 0,
                                    );
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'BlurRadius'),
                              keyboardType: TextInputType.number,
                              initialValue: "${boxShadow?.offset.dx ?? 0}",
                              onChanged: (value) {
                                var blurRadius = double.parse(value);
                                boxShadow ==
                                    BoxShadow(
                                      color: boxShadow?.color ?? Colors.transparent,
                                      offset: boxShadow?.offset ?? Offset.zero,
                                      blurRadius: blurRadius,
                                      spreadRadius: boxShadow?.spreadRadius ?? 0,
                                    );
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'SpreadRadius'),
                              keyboardType: TextInputType.number,
                              initialValue: "${boxShadow?.offset.dx ?? 0}",
                              onChanged: (value) {
                                var spreadRadius = double.parse(value);
                                boxShadow ==
                                    BoxShadow(
                                      color: boxShadow?.color ?? Colors.transparent,
                                      offset: boxShadow?.offset ?? Offset.zero,
                                      blurRadius: boxShadow?.blurRadius ?? 0,
                                      spreadRadius: spreadRadius,
                                    );
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

                SizedBox(height: 5),
                child?.toWidgetProperties(context) ?? const SizedBox()
              ],
            ),
          );
        }),
      );
    });
  }
}
