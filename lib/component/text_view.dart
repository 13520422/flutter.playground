import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/extension/extension.dart';
import 'package:playground/widget/add_component.dart';
import 'package:uuid/uuid.dart';

class CCTextView extends Component {
  static const String runType = "CCTextView";
  String? text;
  double? fontSize;
  Color? color;
  String? fontFamily;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLine;

  CCTextView({
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
    String? text,
    double? fontSize,
    String? fontFamily,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    int? maxLine,
  }) {
    var textView = CCTextView(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );
    textView.text = text ?? this.text;
    textView.fontSize = fontSize ?? this.fontSize;
    textView.fontFamily = fontFamily ?? this.fontFamily;
    textView.fontWeight = fontWeight ?? this.fontWeight;
    textView.textAlign = textAlign ?? this.textAlign;
    textView.textOverflow = textOverflow ?? this.textOverflow;
    textView.maxLine = maxLine ?? this.maxLine;
    textView.fontStyle = fontStyle ?? this.fontStyle;
    textView.color = color ?? this.color;
    return textView;
  }

  static CCTextView? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCTextView(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );

    component.text = json["text"];
    component.fontSize = json["fontSize"];
    component.fontFamily = json["fontFamily"];
    component.fontWeight = FontWeight.normal.fromJson(json["fontWeight"]);
    component.textAlign = TextAlign.center.fromJson(json["textAlign"]);
    component.textOverflow = TextOverflow.clip.fromJson(json["textOverflow"]);
    component.maxLine = json["maxLine"];
    component.fontStyle = FontStyle.normal.fromJson(json["fontStyle"]);
    component.color = json["color"] != null ? Color(int.parse(json["color"])) : null;
    return component;
  }

  static CCTextView? fromWidget(Text widget) {
    var uuid = Uuid();
    var component = CCTextView(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.text = widget.data;
    component.fontSize = widget.style?.fontSize;
    component.fontFamily = widget.style?.fontFamily;
    component.fontWeight = widget.style?.fontWeight;
    component.textAlign = widget.textAlign;
    component.textOverflow = widget.overflow;
    component.maxLine = widget.maxLines;
    component.fontStyle = widget.style?.fontStyle;
    component.color = widget.style?.color;
    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCTextView.runType;
    json["name"] = name;
    json["text"] = text;
    json["fontSize"] = fontSize;
    json["color"] = color != null ? "0x${color?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontFamily"] = fontFamily;
    json["fontWeight"] = fontWeight?.value;
    json["fontStyle"] = fontStyle?.name;
    json["textAlign"] = textAlign?.name;
    json["textOverflow"] = textOverflow?.name;
    json["maxLine"] = maxLine;
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return Text(
      text ?? "",
      key: UniqueKey(),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return Text(
      text ?? "",
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
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
                      Text("TextView $name ${child != null ? "..." : ""}"),
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
            width: MediaQuery.of(context).size.width * widthDefaultComponent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TextView $name"),
                SizedBox(
                  height: 5,
                ),

                ///control
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
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

                ///text
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Text'),
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    initialValue: text != null ? "$text" : null,
                    onChanged: (value) {
                      text = value;
                      onUpdate?.call(null);
                    },
                  ),
                ),

                ///color
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue:
                                  color != null ? "0x${color?.value.toRadixString(16).padLeft(8, '0')}" : null,
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
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Font Family'),
                    keyboardType: TextInputType.text,
                    initialValue: fontFamily != null ? "$fontFamily" : null,
                    onChanged: (value) {
                      fontFamily = value;
                      onUpdate?.call(null);
                    },
                  ),
                ),

                ///style
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Font size'),
                          keyboardType: TextInputType.number,
                          initialValue: fontSize != null ? "$fontSize" : null,
                          onChanged: (value) {
                            fontSize = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Font Weight'),
                              keyboardType: TextInputType.text,
                              initialValue: fontWeight != null ? "$fontWeight" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontWeight(
                                  context: c,
                                  callBack: (FontWeight? weight) {
                                    innerSetState.call(() {
                                      fontWeight = weight;
                                    });
                                    onUpdate?.call(null);
                                  },
                                );
                              });
                        }),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Font Style'),
                              keyboardType: TextInputType.text,
                              initialValue: fontStyle != null ? "$fontStyle" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontStyle(
                                  context: c,
                                  callBack: (FontStyle? style) {
                                    innerSetState.call(() {
                                      fontStyle = style;
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

                ///line, align, overfloww
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Max line'),
                          keyboardType: TextInputType.text,
                          initialValue: maxLine != null ? "$maxLine" : null,
                          onChanged: (value) {
                            maxLine = int.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Text align'),
                              keyboardType: TextInputType.text,
                              initialValue: textAlign != null ? "$textAlign" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectTextAlign(
                                  context: c,
                                  callBack: (TextAlign? align) {
                                    innerSetState.call(() {
                                      textAlign = align;
                                    });
                                    onUpdate?.call(null);
                                  },
                                );
                              });
                        }),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Text Overflow'),
                              keyboardType: TextInputType.text,
                              initialValue: textOverflow != null ? "$textOverflow" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectTextOverflow(
                                  context: c,
                                  callBack: (TextOverflow? overflow) {
                                    innerSetState.call(() {
                                      textOverflow = overflow;
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
                child?.toWidgetProperties(context) ?? const SizedBox()
              ],
            ),
          );
        }),
      );
    });
  }
}
