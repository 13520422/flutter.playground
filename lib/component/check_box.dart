import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/extension/extension.dart';
import 'package:playground/widget/add_component.dart';
import 'package:playground/widget/custom_check_box.dart';
import 'package:playground/widget/custom_form.dart';
import 'package:playground/widget/custom_text_form_field.dart';
import 'package:uuid/uuid.dart';

class CCCheckBoxFormField extends Component {
  static const String runType = "CCCheckBoxFormField";

  ///
  String? formId;
  //
  String? label;
  EdgeInsets? padding;
  bool? isReverse;
  String? validateError;
  String? fontFamily;

  ///
  double? fontSize;

  ///color label
  Color? color;
  FontStyle? fontStyle;
  FontWeight? fontWeight;

  ///
  double? fontSizeError;
  Color? colorError;
  FontStyle? fontStyleError;
  FontWeight? fontWeightError;
  bool? isValidate;
  Color? checkColor;
  Color? backgroundColor;
  Color? activeColor;
  Color? colorBorder;
  double? size;
  bool? isCircle;
  MainAxisAlignment? mainAxisAlignment;
  TextAlign? textAlign;
  double? widthBorder;
  BorderRadius? borderRadius;
  double? space;
  bool? initialValue;

  CCCheckBoxFormField({
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
    String? formId,
    EdgeInsets? padding,
    String? label,
    bool? isReverse,
    String? validateError,
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? fontSizeError,
    Color? colorError,
    FontStyle? fontStyleError,
    FontWeight? fontWeightError,
    bool? isValidate,
    Color? checkColor,
    Color? backgroundColor,
    Color? activeColor,
    double? size,
    bool? isCircle,
    MainAxisAlignment? mainAxisAlignment,
    TextAlign? textAlign,
    double? widthBorder,
    BorderRadius? borderRadius,
    Color? colorBorder,
    bool? initialValue,
    double? space,
  }) {
    var component = CCCheckBoxFormField(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );

    component.formId = formId ?? this.formId;

    ///
    component.label = label ?? this.label;
    component.validateError = validateError ?? this.validateError;

    ///
    component.fontFamily = fontFamily ?? this.fontFamily;

    ///text style input
    component.fontSize = fontSize ?? this.fontSize;
    component.color = color ?? this.color;
    component.fontStyle = fontStyle ?? this.fontStyle;
    component.fontWeight = fontWeight ?? this.fontWeight;

    //text style error
    component.fontSizeError = fontSizeError ?? this.fontSizeError;
    component.colorError = colorError ?? this.colorError;
    component.fontStyleError = fontStyleError ?? this.fontStyleError;
    component.fontWeightError = fontWeightError ?? this.fontWeightError;

    ///
    component.isValidate = isValidate ?? this.isValidate;
    component.textAlign = textAlign ?? this.textAlign;
    component.padding = padding ?? this.padding;
    component.borderRadius = borderRadius ?? this.borderRadius;
    //
    component.isReverse = isReverse ?? this.isReverse;
    component.checkColor = checkColor ?? this.checkColor;
    component.backgroundColor = backgroundColor ?? this.backgroundColor;
    component.activeColor = activeColor ?? this.activeColor;
    component.colorBorder = colorBorder ?? this.colorBorder;
    component.size = size ?? this.size;
    component.isCircle = isCircle ?? this.isCircle;
    component.mainAxisAlignment = mainAxisAlignment ?? this.mainAxisAlignment;
    component.widthBorder = widthBorder ?? this.widthBorder;
    component.initialValue = initialValue ?? this.initialValue;
    component.space = space ?? this.space;

    ///

    return component;
  }

  static CCCheckBoxFormField? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCCheckBoxFormField(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );

    // component.text = json["text"];
    component.formId = json["formId"];

    ///
    component.label = json["label"];
    component.validateError = json["validateError"];

    ///
    component.fontFamily = json["fontFamily"];

    ///text style input
    component.fontSize = json["fontSize"];
    component.fontWeight = FontWeight.normal.fromJson(json["fontWeight"]);
    component.fontStyle = FontStyle.normal.fromJson(json["fontStyle"]);
    component.color = json["color"] != null ? Color(int.parse(json["color"])) : null;

    //text style error
    component.fontSizeError = json["fontSizeError"];
    component.fontWeightError = FontWeight.normal.fromJson(json["fontWeightError"]);
    component.fontStyleError = FontStyle.normal.fromJson(json["fontStyleError"]);
    component.colorError = json["colorError"] != null ? Color(int.parse(json["colorError"])) : null;

    ///
    component.isValidate = json["isValidate"];
    component.textAlign = TextAlign.center.fromJson(json["textAlign"]);
    component.padding = EdgeInsets.zero.fromJson(json["padding"]);

    component.borderRadius = BorderRadius.zero.fromJson(json["borderRadius"]);

    ///
    component.isReverse = json["isReverse"];
    component.checkColor = json["checkColor"] != null ? Color(int.parse(json["checkColor"])) : null;
    component.backgroundColor = json["backgroundColor"] != null ? Color(int.parse(json["backgroundColor"])) : null;
    component.activeColor = json["activeColor"] != null ? Color(int.parse(json["activeColor"])) : null;
    component.colorBorder = json["colorBorder"] != null ? Color(int.parse(json["colorBorder"])) : null;
    component.size = json["size"];
    component.isCircle = json["isCircle"];
    component.mainAxisAlignment = MainAxisAlignment.start.fromJson(json["mainAxisAlignment"]);
    component.widthBorder = json["widthBorder"];
    component.initialValue = json["initialValue"];
    component.space = json["space"];

    return component;
  }

  static CCCheckBoxFormField? fromWidget(CustomCheckBox widget) {
    var uuid = Uuid();
    // TODO: implement fromJson
    var component = CCCheckBoxFormField(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.formId = widget.formId;

    ///
    component.label = widget.label;
    component.validateError = widget.validateError;

    ///
    component.fontFamily = widget.fontFamily;

    ///text style input
    component.fontSize = widget.fontSize;
    component.color = widget.color;
    component.fontStyle = widget.fontStyle;
    component.fontWeight = widget.fontWeight;

    //text style error
    component.fontSizeError = widget.fontSizeError;
    component.colorError = widget.colorError;
    component.fontStyleError = widget.fontStyleError;
    component.fontWeightError = widget.fontWeightError;

    ///
    component.isValidate = widget.isValidate;
    component.textAlign = widget.textAlign;
    component.padding = widget.padding;
    component.borderRadius = widget.borderRadius;

    ///
    component.isReverse = widget.isReverse;
    component.checkColor = widget.checkColor;
    component.backgroundColor = widget.backgroundColor;
    component.activeColor = widget.activeColor;
    component.colorBorder = widget.colorBorder;
    component.size = widget.size;
    component.isCircle = widget.isCircle;
    component.mainAxisAlignment = widget.mainAxisAlignment;
    component.widthBorder = widget.widthBorder;
    component.initialValue = widget.value.value;
    component.space = widget.space;
    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCCheckBoxFormField.runType;
    json["name"] = name;
    json["formId"] = formId;
    json["label"] = label;
    json["validateError"] = validateError;
    json["fontFamily"] = fontFamily;

    ///
    json["fontSize"] = fontSize;
    json["color"] = color != null ? "0x${color?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontWeight"] = fontWeight?.value;
    json["fontStyle"] = fontStyle?.name;

    ///
    json["fontSizeError"] = fontSizeError;
    json["colorError"] = colorError != null ? "0x${colorError?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontWeightError"] = fontWeightError?.value;
    json["fontStyleError"] = fontStyleError?.name;

    ///
    json["textAlign"] = textAlign?.name;
    json["isValidate"] = isValidate;
    json["padding"] = padding?.toJson();
    json["borderRadius"] = borderRadius?.toJson();

    //
    json["isReverse"] = isReverse;
    json["checkColor"] = checkColor;
    json["backgroundColor"] = backgroundColor?.value;
    json["activeColor"] = activeColor?.value;
    json["colorBorder"] = colorBorder?.value;
    json["size"] = size;
    json["isCircle"] = isCircle;
    json["mainAxisAlignment"] = mainAxisAlignment?.name;
    json["widthBorder"] = widthBorder;
    json["initialValue"] = initialValue;
    json["space"] = space;
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return CustomCheckBox(
      key: UniqueKey(),
      label: label,
      validateError: validateError,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSizeError: fontSizeError,
      colorError: colorError,
      fontStyleError: fontStyleError,
      fontWeightError: fontWeightError,
      isValidate: isValidate,
      textAlign: textAlign,
      formId: formId,
      isReverse: isReverse,
      checkColor: checkColor,
      backgroundColor: backgroundColor,
      activeColor: activeColor,
      colorBorder: colorBorder,
      size: size,
      isCircle: isCircle,
      mainAxisAlignment: mainAxisAlignment,
      widthBorder: widthBorder,
      initialValue: initialValue ?? false,
      space: space,
      validator: (value) {
        if (isValidate == true) {
          if (value == true) {
            return null;
          }
          return validateError;
        }
        return null;
      },
      onSaved: (newValue) {
        formData[formId]?[name ?? ""] = initialValue;
      },
      onChange: (newValue) {
        initialValue = newValue;
      },
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return CustomCheckBox(
      label: label,
      validateError: validateError,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSizeError: fontSizeError,
      colorError: colorError,
      fontStyleError: fontStyleError,
      fontWeightError: fontWeightError,
      isValidate: isValidate,
      textAlign: textAlign,
      formId: formId,
      isReverse: isReverse,
      checkColor: checkColor,
      backgroundColor: backgroundColor,
      activeColor: activeColor,
      colorBorder: colorBorder,
      size: size,
      isCircle: isCircle,
      mainAxisAlignment: mainAxisAlignment,
      widthBorder: widthBorder,
      initialValue: initialValue ?? false,
      space: space,
      validator: (value) {
        if (isValidate == true) {
          if (value == true) {
            return null;
          }
          return validateError;
        }
        return null;
      },
      onSaved: (newValue) {
        formData[formId]?[name ?? ""] = initialValue;
      },
      onChange: (newValue) {
        initialValue = newValue;
      },
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
                      Text("Text Field $name ${child != null ? "..." : ""}"),
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
                Text("Text Field $name"),
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

                ///text
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
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

                ///lable
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Label'),
                    keyboardType: TextInputType.text,
                    initialValue: label != null ? "$label" : null,
                    onChanged: (value) {
                      label = value;
                      onUpdate?.call(null);
                    },
                  ),
                ),

                ///text error
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Text validateError'),
                    keyboardType: TextInputType.text,
                    initialValue: validateError != null ? "$validateError" : null,
                    onChanged: (value) {
                      validateError = value;
                      onUpdate?.call(null);
                    },
                  ),
                ),

                ///font Family
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

                ///color error
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color error', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue: colorError != null
                                  ? "0x${colorError?.value.toRadixString(16).padLeft(8, '0')}"
                                  : null,
                              onChanged: (value) {
                                colorError = Color(int.parse(value));
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              },
                            ),
                          ),
                          Container(key: UniqueKey(), width: 30, height: 30, color: colorError)
                        ],
                      ),
                    ),
                  ],
                ),

                ///style error
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Font size error'),
                          keyboardType: TextInputType.number,
                          initialValue: fontSizeError != null ? "$fontSizeError" : null,
                          onChanged: (value) {
                            fontSizeError = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Font Weight error'),
                              keyboardType: TextInputType.text,
                              initialValue: fontWeightError != null ? "$fontWeightError" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontWeight(
                                  context: c,
                                  callBack: (FontWeight? weight) {
                                    innerSetState.call(() {
                                      fontWeightError = weight;
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
                              decoration: InputDecoration(labelText: 'Font Style error'),
                              keyboardType: TextInputType.text,
                              initialValue: fontStyleError != null ? "$fontStyleError" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontStyle(
                                  context: c,
                                  callBack: (FontStyle? style) {
                                    innerSetState.call(() {
                                      fontStyleError = style;
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

                ///line, align
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Builder(builder: (c) {
                        return Flexible(
                          child: TextFormField(
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
                              }),
                        );
                      }),
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
                    ],
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
                              initialValue: padding != null ? "${padding?.left}" : null,
                              onChanged: (value) {
                                padding ??= EdgeInsets.zero;
                                padding = padding?.copyWith(left: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Right'),
                              keyboardType: TextInputType.number,
                              initialValue: padding != null ? "${padding?.right}" : null,
                              onChanged: (value) {
                                padding ??= EdgeInsets.zero;
                                padding = padding?.copyWith(right: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top'),
                              keyboardType: TextInputType.number,
                              initialValue: padding != null ? "${padding?.top}" : null,
                              onChanged: (value) {
                                padding ??= EdgeInsets.zero;
                                padding = padding?.copyWith(top: double.parse(value));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom'),
                              keyboardType: TextInputType.number,
                              initialValue: padding != null ? "${padding?.bottom}" : null,
                              onChanged: (value) {
                                padding ??= EdgeInsets.zero;
                                padding = padding?.copyWith(bottom: double.parse(value));
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
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
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
                              initialValue: borderRadius != null ? "${borderRadius?.topLeft.x}" : null,
                              onChanged: (value) {
                                var topLeft = double.parse(value);
                                borderRadius ??= BorderRadius.zero;
                                borderRadius = borderRadius?.copyWith(topLeft: Radius.circular(topLeft));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Top Right'),
                              keyboardType: TextInputType.number,
                              initialValue: borderRadius != null ? "${borderRadius?.topRight.x}" : null,
                              onChanged: (value) {
                                var topRight = double.parse(value);
                                borderRadius ??= BorderRadius.zero;
                                borderRadius = borderRadius?.copyWith(topRight: Radius.circular(topRight));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom Left'),
                              keyboardType: TextInputType.number,
                              initialValue: borderRadius != null ? "${borderRadius?.bottomLeft.x}" : null,
                              onChanged: (value) {
                                var bottomLeft = double.parse(value);
                                borderRadius ??= BorderRadius.zero;
                                borderRadius = borderRadius?.copyWith(bottomLeft: Radius.circular(bottomLeft));
                                innerSetState.call(() {});
                                onUpdate?.call(null);
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bottom Right'),
                              keyboardType: TextInputType.number,
                              initialValue: borderRadius != null ? "${borderRadius?.bottomRight.x}" : null,
                              onChanged: (value) {
                                var bottomRight = double.parse(value);
                                borderRadius ??= BorderRadius.zero;
                                borderRadius = borderRadius?.copyWith(bottomRight: Radius.circular(bottomRight));
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

                ///isValidate
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'isValidate', hintText: "true or false"),
                          keyboardType: TextInputType.text,
                          initialValue: "$isValidate",
                          onChanged: (value) {
                            isValidate = bool.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'isReverse', hintText: "true or false"),
                          keyboardType: TextInputType.text,
                          initialValue: isReverse != null ? "$isReverse" : null,
                          onChanged: (value) {
                            isReverse = bool.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'CheckColor', hintText: "0x00000000"),
                          keyboardType: TextInputType.text,
                          initialValue:
                              checkColor != null ? "0x${checkColor?.value.toRadixString(16).padLeft(8, '0')}" : null,
                          onChanged: (value) {
                            checkColor = Color(int.parse(value));
                            onUpdate?.call(null);
                            innerSetState.call(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'BackgroundColor', hintText: "0x00000000"),
                          keyboardType: TextInputType.text,
                          initialValue: backgroundColor != null
                              ? "0x${backgroundColor?.value.toRadixString(16).padLeft(8, '0')}"
                              : null,
                          onChanged: (value) {
                            backgroundColor = Color(int.parse(value));
                            onUpdate?.call(null);
                            innerSetState.call(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'ActiveColor', hintText: "0x00000000"),
                          keyboardType: TextInputType.text,
                          initialValue:
                              activeColor != null ? "0x${activeColor?.value.toRadixString(16).padLeft(8, '0')}" : null,
                          onChanged: (value) {
                            activeColor = Color(int.parse(value));
                            onUpdate?.call(null);
                            innerSetState.call(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'ColorBorder', hintText: "0x00000000"),
                          keyboardType: TextInputType.text,
                          initialValue:
                              colorBorder != null ? "0x${colorBorder?.value.toRadixString(16).padLeft(8, '0')}" : null,
                          onChanged: (value) {
                            colorBorder = Color(int.parse(value));
                            onUpdate?.call(null);
                            innerSetState.call(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'size'),
                          keyboardType: TextInputType.none,
                          initialValue: size != null ? "$size" : null,
                          onChanged: (value) {
                            size = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'isCircle', hintText: "true or false"),
                          keyboardType: TextInputType.text,
                          initialValue: isCircle != null ? "$isCircle" : null,
                          onChanged: (value) {
                            isCircle = bool.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'WidthBorder'),
                          keyboardType: TextInputType.none,
                          initialValue: widthBorder != null ? "$widthBorder" : null,
                          onChanged: (value) {
                            widthBorder = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Space'),
                          keyboardType: TextInputType.none,
                          initialValue: space != null ? "$space" : null,
                          onChanged: (value) {
                            space = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'initialValue', hintText: "true or false"),
                          keyboardType: TextInputType.text,
                          initialValue: initialValue != null ? "$initialValue" : null,
                          onChanged: (value) {
                            initialValue = bool.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
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
