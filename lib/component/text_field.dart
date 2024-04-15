import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/extension/extension.dart';
import 'package:playground/widget/add_component.dart';
import 'package:playground/widget/custom_form.dart';
import 'package:playground/widget/custom_text_form_field.dart';
import 'package:uuid/uuid.dart';

class CCTextFormField extends Component {
  static const String runType = "CCTextFormField";

  ///
  String? formId;

  ///
  String? label;
  String? hintText;
  String? validateError;

  ///
  String? fontFamily;

  ///text style input
  double? fontSize;
  Color? color;
  FontStyle? fontStyle;
  FontWeight? fontWeight;

  //text style label
  double? fontSizeLabel;
  Color? colorLabel;
  FontStyle? fontStyleLabel;
  FontWeight? fontWeightLabel;

  //text style hint
  double? fontSizeHint;
  Color? colorHint;
  FontStyle? fontStyleHint;
  FontWeight? fontWeightHint;

  //text style error
  double? fontSizeError;
  Color? colorError;
  FontStyle? fontStyleError;
  FontWeight? fontWeightError;

  ///
  bool? isValidate;
  TextAlign? textAlign;
  int? maxLine;
  EdgeInsets padding = EdgeInsets.zero;
  BorderRadius borderRadius = BorderRadius.zero;
  Border? border;
  Border? borderOnFocus;
  Border? borderOnError;
  TextInputType? keyboardType;

  CCTextFormField({
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
    String? label,
    String? hintText,
    String? validateError,
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? fontSizeLabel,
    Color? colorLabel,
    FontStyle? fontStyleLabel,
    FontWeight? fontWeightLabel,
    double? fontSizeHint,
    Color? colorHint,
    FontStyle? fontStyleHint,
    FontWeight? fontWeightHint,
    double? fontSizeError,
    Color? colorError,
    FontStyle? fontStyleError,
    FontWeight? fontWeightError,
    bool? isValidate,
    TextAlign? textAlign,
    int? maxLine,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Border? border,
    Border? borderOnFocus,
    Border? borderOnError,
    TextInputType? keyboardType,
  }) {
    var component = CCTextFormField(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );
    component.formId = formId ?? this.formId;

    ///
    component.label = label ?? this.label;
    component.hintText = hintText ?? this.hintText;
    component.validateError = validateError ?? this.validateError;

    ///
    component.fontFamily = fontFamily ?? this.fontFamily;

    ///text style input
    component.fontSize = fontSize ?? this.fontSize;
    component.color = color ?? this.color;
    component.fontStyle = fontStyle ?? this.fontStyle;
    component.fontWeight = fontWeight ?? this.fontWeight;

    //text style label
    component.fontSizeLabel = fontSizeLabel ?? this.fontSizeLabel;
    component.colorLabel = colorLabel ?? this.colorLabel;
    component.fontStyleLabel = fontStyleLabel ?? this.fontStyleLabel;
    component.fontWeightLabel = fontWeightLabel ?? this.fontWeightLabel;

    //text style hint
    component.fontSizeHint = fontSizeHint ?? this.fontSizeHint;
    component.colorHint = colorHint ?? this.colorHint;
    component.fontStyleHint = fontStyleHint ?? this.fontStyleHint;
    component.fontWeightHint = fontWeightHint ?? this.fontWeightHint;

    //text style error
    component.fontSizeError = fontSizeError ?? this.fontSizeError;
    component.colorError = colorError ?? this.colorError;
    component.fontStyleError = fontStyleError ?? this.fontStyleError;
    component.fontWeightError = fontWeightError ?? this.fontWeightError;

    ///
    component.isValidate = isValidate ?? this.isValidate;
    component.textAlign = textAlign ?? this.textAlign;
    component.maxLine = maxLine ?? this.maxLine;
    component.padding = padding ?? this.padding;
    component.borderRadius = borderRadius ?? this.borderRadius;
    component.border = border ?? this.border;
    component.borderOnFocus = borderOnFocus ?? this.borderOnFocus;
    component.borderOnError = borderOnError ?? this.borderOnError;
    component.keyboardType = keyboardType ?? this.keyboardType;
    return component;
  }

  static CCTextFormField? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCTextFormField(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );

    // component.text = json["text"];
    component.formId = json["formId"];

    ///
    component.label = json["label"];
    component.hintText = json["hintText"];
    component.validateError = json["validateError"];

    ///
    component.fontFamily = json["fontFamily"];

    ///text style input
    component.fontSize = json["fontSize"];
    component.fontWeight = FontWeight.normal.fromJson(json["fontWeight"]);
    component.fontStyle = FontStyle.normal.fromJson(json["fontStyle"]);
    component.color = json["color"] != null ? Color(int.parse(json["color"])) : null;

    //text style label
    component.fontSizeLabel = json["fontSizeLabel"];
    component.fontWeightLabel = FontWeight.normal.fromJson(json["fontWeightLabel"]);
    component.fontStyleLabel = FontStyle.normal.fromJson(json["fontStyleLabel"]);
    component.colorLabel = json["colorLabel"] != null ? Color(int.parse(json["colorLabel"])) : null;

    //text style hint
    component.fontSizeHint = json["fontSizeHint"];
    component.fontWeightHint = FontWeight.normal.fromJson(json["fontWeightHint"]);
    component.fontStyleHint = FontStyle.normal.fromJson(json["fontStyleHint"]);
    component.colorHint = json["colorHint"] != null ? Color(int.parse(json["colorHint"])) : null;

    //text style error
    component.fontSizeError = json["fontSizeError"];
    component.fontWeightError = FontWeight.normal.fromJson(json["fontWeightError"]);
    component.fontStyleError = FontStyle.normal.fromJson(json["fontStyleError"]);
    component.colorError = json["colorError"] != null ? Color(int.parse(json["colorError"])) : null;

    ///
    component.isValidate = json["isValidate"];
    component.textAlign = TextAlign.center.fromJson(json["textAlign"]);
    component.maxLine = json["maxLine"];
    component.padding = EdgeInsets.zero.fromJson(json["padding"]) ?? EdgeInsets.zero;

    component.borderRadius = BorderRadius.zero.fromJson(json["borderRadius"]) ?? BorderRadius.zero;
    component.border = Border().fromJson(json["border"]);
    component.borderOnFocus = Border().fromJson(json["borderOnFocus"]);
    component.borderOnError = Border().fromJson(json["borderOnError"]);
    component.keyboardType = TextInputType.none.fromJson(json["keyboardType"]);
  }

  static CCTextFormField? fromWidget(CustomTextFormField widget) {
    var uuid = Uuid();
    var component = CCTextFormField(
      name: uuid.v4(),
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.formId = widget.formId;

    ///
    component.label = widget.label;
    component.hintText = widget.hintText;
    component.validateError = widget.validateError;

    ///
    component.fontFamily = widget.fontFamily;

    ///text style input
    component.fontSize = widget.fontSize;
    component.color = widget.color;
    component.fontStyle = widget.fontStyle;
    component.fontWeight = widget.fontWeight;

    //text style label
    component.fontSizeLabel = widget.fontSizeLabel;
    component.colorLabel = widget.colorLabel;
    component.fontStyleLabel = widget.fontStyleLabel;
    component.fontWeightLabel = widget.fontWeightLabel;

    //text style hint
    component.fontSizeHint = widget.fontSizeHint;
    component.colorHint = widget.colorHint;
    component.fontStyleHint = widget.fontStyleHint;
    component.fontWeightHint = widget.fontWeightHint;

    //text style error
    component.fontSizeError = widget.fontSizeError;
    component.colorError = widget.colorError;
    component.fontStyleError = widget.fontStyleError;
    component.fontWeightError = widget.fontWeightError;

    ///
    component.isValidate = widget.isValidate;
    component.textAlign = widget.textAlign;
    component.maxLine = widget.maxLine;
    component.padding = widget.padding;
    component.borderRadius = widget.borderRadius;
    component.border = widget.border;
    component.borderOnFocus = widget.borderOnFocus;
    component.borderOnError = widget.borderOnError;
    component.keyboardType = widget.keyboardType;
    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCTextFormField.runType;
    json["name"] = name;
    json["formId"] = formId;
    json["label"] = label;
    json["label"] = hintText;
    json["hintText"] = hintText;
    json["validateError"] = validateError;
    json["fontFamily"] = fontFamily;

    ///
    json["fontSize"] = fontSize;
    json["color"] = color != null ? "0x${color?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontWeight"] = fontWeight?.value;
    json["fontStyle"] = fontStyle?.name;

    ///
    json["fontSizeLabel"] = fontSizeLabel;
    json["colorLabel"] = colorLabel != null ? "0x${colorLabel?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontWeightLabel"] = fontWeightLabel?.value;
    json["fontStyleLabel"] = fontStyleLabel?.name;

    ///
    json["fontSizeHint"] = fontSizeHint;
    json["colorHint"] = colorHint != null ? "0x${colorHint?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontWeightHint"] = fontWeightHint?.value;
    json["fontStyleHint"] = fontStyleHint?.name;

    ///
    json["fontSizeError"] = fontSizeError;
    json["colorError"] = colorError != null ? "0x${colorError?.value.toRadixString(16).padLeft(8, '0')}" : null;
    json["fontWeightError"] = fontWeightError?.value;
    json["fontStyleError"] = fontStyleError?.name;

    ///
    json["textAlign"] = textAlign?.name;
    json["maxLine"] = maxLine;
    json["isValidate"] = isValidate;
    json["padding"] = padding.toJson();
    json["borderRadius"] = borderRadius.toJson();
    json["border"] = border?.toJson();
    json["borderOnFocus"] = borderOnFocus?.toJson();
    json["borderOnError"] = borderOnError?.toJson();
    json["keyboardType"] = keyboardType?.index;
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    return CustomTextFormField(
      key: UniqueKey(),
      label: label,
      hintText: hintText,
      validateError: validateError,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSizeLabel: fontSizeLabel,
      colorLabel: colorLabel,
      fontStyleLabel: fontStyleLabel,
      fontWeightLabel: fontWeightLabel,
      fontSizeHint: fontSizeHint,
      colorHint: colorHint,
      fontStyleHint: fontStyleHint,
      fontWeightHint: fontWeightHint,
      fontSizeError: fontSizeError,
      colorError: colorError,
      fontStyleError: fontStyleError,
      fontWeightError: fontWeightError,
      isValidate: isValidate,
      textAlign: textAlign,
      maxLine: maxLine,
      padding: padding,
      borderRadius: borderRadius,
      border: border,
      borderOnFocus: borderOnFocus,
      borderOnError: borderOnError,
      keyboardType: keyboardType,
      formId: formId,
      validator: (value) {
        if (isValidate == true) {
          if ((value ?? "").trim().isNotEmpty) {
            return null;
          }
          return validateError;
        }
        return null;
      },
      onSaved: (newValue) {
        formData[formId]?[name ?? ""] = newValue;
      },
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    return CustomTextFormField(
      label: label,
      hintText: hintText,
      validateError: validateError,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSizeLabel: fontSizeLabel,
      colorLabel: colorLabel,
      fontStyleLabel: fontStyleLabel,
      fontWeightLabel: fontWeightLabel,
      fontSizeHint: fontSizeHint,
      colorHint: colorHint,
      fontStyleHint: fontStyleHint,
      fontWeightHint: fontWeightHint,
      fontSizeError: fontSizeError,
      colorError: colorError,
      fontStyleError: fontStyleError,
      fontWeightError: fontWeightError,
      isValidate: isValidate,
      textAlign: textAlign,
      maxLine: maxLine,
      padding: padding,
      borderRadius: borderRadius,
      border: border,
      borderOnFocus: borderOnFocus,
      borderOnError: borderOnError,
      keyboardType: keyboardType,
      formId: formId,
      validator: (value) {
        if (isValidate == true) {
          if ((value ?? "").trim().isNotEmpty) {
            return null;
          }
          return validateError;
        }
        return null;
      },
      onSaved: (newValue) {
        formData[formId]?[name ?? ""] = newValue;
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

                ///hint
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Hint'),
                    keyboardType: TextInputType.text,
                    initialValue: hintText != null ? "$hintText" : null,
                    onChanged: (value) {
                      hintText = value;
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

                ///color label
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color label', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue: colorLabel != null
                                  ? "0x${colorLabel?.value.toRadixString(16).padLeft(8, '0')}"
                                  : null,
                              onChanged: (value) {
                                colorLabel = Color(int.parse(value));
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              },
                            ),
                          ),
                          Container(key: UniqueKey(), width: 30, height: 30, color: colorLabel)
                        ],
                      ),
                    ),
                  ],
                ),

                ///style label
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Font size label'),
                          keyboardType: TextInputType.number,
                          initialValue: fontSizeLabel != null ? "$fontSizeLabel" : null,
                          onChanged: (value) {
                            fontSizeLabel = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Font Weight label'),
                              keyboardType: TextInputType.text,
                              initialValue: fontWeightLabel != null ? "$fontWeightLabel" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontWeight(
                                  context: c,
                                  callBack: (FontWeight? weight) {
                                    innerSetState.call(() {
                                      fontWeightLabel = weight;
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
                              decoration: InputDecoration(labelText: 'Font Style label'),
                              keyboardType: TextInputType.text,
                              initialValue: fontStyleLabel != null ? "$fontStyleLabel" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontStyle(
                                  context: c,
                                  callBack: (FontStyle? style) {
                                    innerSetState.call(() {
                                      fontStyleLabel = style;
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

                ///color hint
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color hint', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue:
                                  colorHint != null ? "0x${colorHint?.value.toRadixString(16).padLeft(8, '0')}" : null,
                              onChanged: (value) {
                                colorHint = Color(int.parse(value));
                                onUpdate?.call(null);
                                innerSetState.call(() {});
                              },
                            ),
                          ),
                          Container(key: UniqueKey(), width: 30, height: 30, color: colorHint)
                        ],
                      ),
                    ),
                  ],
                ),

                ///style hint
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Font size hint'),
                          keyboardType: TextInputType.number,
                          initialValue: fontSizeHint != null ? "$fontSizeHint" : null,
                          onChanged: (value) {
                            fontSizeHint = double.parse(value);
                            onUpdate?.call(null);
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(builder: (c) {
                          return TextFormField(
                              key: UniqueKey(),
                              decoration: InputDecoration(labelText: 'Font Weight hint'),
                              keyboardType: TextInputType.text,
                              initialValue: fontWeightHint != null ? "$fontWeightHint" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontWeight(
                                  context: c,
                                  callBack: (FontWeight? weight) {
                                    innerSetState.call(() {
                                      fontWeightHint = weight;
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
                              decoration: InputDecoration(labelText: 'Font Style hint'),
                              keyboardType: TextInputType.text,
                              initialValue: fontStyleHint != null ? "$fontStyleHint" : null,
                              onChanged: (value) {
                                onUpdate?.call(null);
                              },
                              onTap: () {
                                ///
                                Component.selectFontStyle(
                                  context: c,
                                  callBack: (FontStyle? style) {
                                    innerSetState.call(() {
                                      fontStyleHint = style;
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

                /// Border
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
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
                                  ? "0x${border?.top.color.value.toRadixString(16).padLeft(8, '0')}"
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

                /// Border focus
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Border on focus"),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue: borderOnFocus?.top.color != null
                                  ? "0x${borderOnFocus?.top.color.value.toRadixString(16).padLeft(8, '0')}"
                                  : null,
                              onChanged: (value) {
                                var _color = Color(int.parse(value));
                                borderOnFocus = Border(
                                  top: BorderSide(
                                    color: _color,
                                    width: borderOnFocus?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: _color,
                                    width: borderOnFocus?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: _color,
                                    width: borderOnFocus?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: _color,
                                    width: borderOnFocus?.right.width ?? 0,
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
                              initialValue: "${borderOnFocus?.left.width ?? 0}",
                              onChanged: (value) {
                                var left = double.parse(value);
                                borderOnFocus = Border(
                                  top: BorderSide(
                                    color: borderOnFocus?.top.color ?? Colors.transparent,
                                    width: borderOnFocus?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnFocus?.bottom.color ?? Colors.transparent,
                                    width: borderOnFocus?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: borderOnFocus?.left.color ?? Colors.transparent,
                                    width: left,
                                  ),
                                  right: BorderSide(
                                    color: borderOnFocus?.right.color ?? Colors.transparent,
                                    width: borderOnFocus?.right.width ?? 0,
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
                              initialValue: "${borderOnFocus?.right.width ?? 0}",
                              onChanged: (value) {
                                var right = double.parse(value);
                                borderOnFocus = Border(
                                  top: BorderSide(
                                    color: borderOnFocus?.top.color ?? Colors.transparent,
                                    width: borderOnFocus?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnFocus?.bottom.color ?? Colors.transparent,
                                    width: borderOnFocus?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: borderOnFocus?.left.color ?? Colors.transparent,
                                    width: borderOnFocus?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: borderOnFocus?.right.color ?? Colors.transparent,
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
                              initialValue: "${borderOnFocus?.top.width ?? 0}",
                              onChanged: (value) {
                                var top = double.parse(value);
                                borderOnFocus = Border(
                                  top: BorderSide(
                                    color: borderOnFocus?.top.color ?? Colors.transparent,
                                    width: top,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnFocus?.bottom.color ?? Colors.transparent,
                                    width: borderOnFocus?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: borderOnFocus?.left.color ?? Colors.transparent,
                                    width: borderOnFocus?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: borderOnFocus?.right.color ?? Colors.transparent,
                                    width: borderOnFocus?.right.width ?? 0,
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
                              initialValue: "${borderOnFocus?.bottom.width ?? 0}",
                              onChanged: (value) {
                                var bottom = double.parse(value);
                                borderOnFocus = Border(
                                  top: BorderSide(
                                    color: borderOnFocus?.top.color ?? Colors.transparent,
                                    width: borderOnFocus?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnFocus?.bottom.color ?? Colors.transparent,
                                    width: bottom,
                                  ),
                                  left: BorderSide(
                                    color: borderOnFocus?.left.color ?? Colors.transparent,
                                    width: borderOnFocus?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: borderOnFocus?.right.color ?? Colors.transparent,
                                    width: borderOnFocus?.right.width ?? 0,
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

                /// Border error
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Border error"),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Color', hintText: "0x00000000"),
                              keyboardType: TextInputType.text,
                              initialValue: borderOnError?.top.color != null
                                  ? "0x${borderOnError?.top.color.value.toRadixString(16).padLeft(8, '0')}"
                                  : null,
                              onChanged: (value) {
                                var _color = Color(int.parse(value));
                                borderOnError = Border(
                                  top: BorderSide(
                                    color: _color,
                                    width: borderOnError?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: _color,
                                    width: borderOnError?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: _color,
                                    width: borderOnError?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: _color,
                                    width: borderOnError?.right.width ?? 0,
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
                              initialValue: "${borderOnError?.left.width ?? 0}",
                              onChanged: (value) {
                                var left = double.parse(value);
                                borderOnError = Border(
                                  top: BorderSide(
                                    color: borderOnError?.top.color ?? Colors.transparent,
                                    width: borderOnError?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnError?.bottom.color ?? Colors.transparent,
                                    width: borderOnError?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: borderOnError?.left.color ?? Colors.transparent,
                                    width: left,
                                  ),
                                  right: BorderSide(
                                    color: borderOnError?.right.color ?? Colors.transparent,
                                    width: borderOnError?.right.width ?? 0,
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
                              initialValue: "${borderOnError?.right.width ?? 0}",
                              onChanged: (value) {
                                var right = double.parse(value);
                                borderOnError = Border(
                                  top: BorderSide(
                                    color: borderOnError?.top.color ?? Colors.transparent,
                                    width: borderOnError?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnError?.bottom.color ?? Colors.transparent,
                                    width: borderOnError?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: borderOnError?.left.color ?? Colors.transparent,
                                    width: borderOnError?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: borderOnError?.right.color ?? Colors.transparent,
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
                              initialValue: "${borderOnError?.top.width ?? 0}",
                              onChanged: (value) {
                                var top = double.parse(value);
                                borderOnError = Border(
                                  top: BorderSide(
                                    color: borderOnError?.top.color ?? Colors.transparent,
                                    width: top,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnError?.bottom.color ?? Colors.transparent,
                                    width: borderOnError?.bottom.width ?? 0,
                                  ),
                                  left: BorderSide(
                                    color: borderOnError?.left.color ?? Colors.transparent,
                                    width: borderOnError?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: borderOnError?.right.color ?? Colors.transparent,
                                    width: borderOnError?.right.width ?? 0,
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
                              initialValue: "${borderOnError?.bottom.width ?? 0}",
                              onChanged: (value) {
                                var bottom = double.parse(value);
                                borderOnError = Border(
                                  top: BorderSide(
                                    color: borderOnError?.top.color ?? Colors.transparent,
                                    width: borderOnError?.top.width ?? 0,
                                  ),
                                  bottom: BorderSide(
                                    color: borderOnError?.bottom.color ?? Colors.transparent,
                                    width: bottom,
                                  ),
                                  left: BorderSide(
                                    color: borderOnError?.left.color ?? Colors.transparent,
                                    width: borderOnError?.left.width ?? 0,
                                  ),
                                  right: BorderSide(
                                    color: borderOnError?.right.color ?? Colors.transparent,
                                    width: borderOnError?.right.width ?? 0,
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

                ///isValidate
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
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

                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'Type keyboard'),
                        keyboardType: TextInputType.text,
                        initialValue: keyboardType != null ? "$keyboardType" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectTextInputType(
                            context: c,
                            callBack: (TextInputType? type) {
                              innerSetState.call(() {
                                keyboardType = type;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
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
