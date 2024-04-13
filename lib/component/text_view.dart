import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/component/component.dart';
import 'package:playground/widget/add_component.dart';

class CCTextView extends Component {
  String? text;
  double? fontSize;
  String? fontFamily;
  FontWeight? fontWeight;
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
    FontWeight? fontWeight,
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
    return textView;
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
                      Text("TextView $name ${child != null ? "..." : ""}"),
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
                Text("TextView $name"),
                SizedBox(
                  height: 5,
                ),

                ///control
                Row(
                  children: [
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

                ///text
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
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

                ///style
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Flexible(
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
                    ],
                  ),
                ),

                ///line, align, overfloww
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
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
