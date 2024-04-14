import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:playground/component/component.dart';
import 'package:playground/extension/extension.dart';
import 'package:playground/widget/add_component.dart';

enum ImageType {
  png,
  jpg,
  svg,
  json,
}

class CCImage extends Component {
  static const String runType = "CCImage";
  double? width;
  double? height;
  String? url;
  BoxFit? fit;
  ImageType? imageType;
  BorderRadius borderRadius = BorderRadius.zero;
  CCImage({
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
    double? width,
    double? height,
    String? url,
    BoxFit? fit,
    ImageType? imageType,
    BorderRadius? borderRadius,
  }) {
    var component = CCImage(
      name: name ?? this.name!,
      onUpdate: onUpdate ?? this.onUpdate!,
      onDelete: onDelete ?? this.onDelete!,
      onWrap: onWrap ?? this.onWrap,
      onWrapChildren: onWrapChildren ?? this.onWrapChildren,
    );
    component.width = width ?? this.width;
    component.height = height ?? this.height;
    component.url = url ?? this.url;
    component.fit = fit ?? this.fit;
    component.imageType = imageType ?? this.imageType;
    component.borderRadius = borderRadius ?? this.borderRadius;

    return component;
  }

  static CCImage? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    var component = CCImage(
      name: json["name"],
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.width = json["width"];
    component.height = json["height"];
    component.url = json["url"];
    component.fit = BoxFit.cover.fromJson(json["fit"]);
    component.imageType = ImageType.jpg.fromJson(json["imageType"]);
    component.borderRadius = BorderRadius.zero.fromJson(json["borderRadius"]) ?? BorderRadius.zero;
    return component;
  }

  static CCImage? fromImage(Image widget) {
    // TODO: implement fromJson
    var component = CCImage(
      name: "Image",
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.width = widget.width;
    component.height = widget.height;

    ///
    var t = widget.image as ResizeImage;
    var assetImage = t.imageProvider as AssetImage;
    component.url = assetImage.assetName;
    component.fit = widget.fit;
    component.imageType = ImageType.png;
    component.borderRadius = BorderRadius.zero;
    return component;
  }

  static CCImage? fromSvgPicture(SvgPicture widget) {
    // TODO: implement fromJson
    var component = CCImage(
      name: "SvgPicture",
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.width = widget.width;
    component.height = widget.height;

    ///
    component.url = (widget.bytesLoader as SvgNetworkLoader).url;
    component.fit = widget.fit;
    component.imageType = ImageType.svg;
    component.borderRadius = BorderRadius.zero;
    return component;
  }

  static CCImage? fromLottie(LottieBuilder widget) {
    // TODO: implement fromJson
    var component = CCImage(
      name: "Lottie",
      onUpdate: (p0) {},
      onDelete: (p0) {},
    );
    component.width = widget.width;
    component.height = widget.height;

    ///
    component.url = (widget.lottie as NetworkLottie).url;
    component.fit = widget.fit;
    component.imageType = ImageType.json;
    component.borderRadius = BorderRadius.zero;
    return component;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> json = {};
    json["runtimeType"] = CCImage.runType;
    json["name"] = name;
    json["width"] = width;
    json["height"] = height;
    json["url"] = url;
    json["fit"] = fit?.name;
    json["imageType"] = imageType?.name;
    json["borderRadius"] = borderRadius.toJson();
    return json;
  }

  @override
  Widget toWidgetViewer(BuildContext context) {
    // TODO: implement toWidget
    Widget w = SizedBox.shrink();

    switch (imageType) {
      case ImageType.png:
        w = Image.network(
          key: UniqueKey(),
          url ?? "",
          width: width,
          height: height,
          fit: fit,
        );
      case ImageType.jpg:
        w = Image.network(
          key: UniqueKey(),
          url ?? "",
          width: width,
          height: height,
          fit: fit,
        );
      case ImageType.svg:
        w = SvgPicture.network(
          key: UniqueKey(),
          url ?? "",
          width: width,
          height: height,
        );
      case ImageType.json:
        w = Lottie.network(
          key: UniqueKey(),
          url ?? "",
          width: width,
          height: height,
        );
      default:
        w = Image.network(
          key: UniqueKey(),
          url ?? "",
          width: width,
          height: height,
          fit: fit,
        );
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: w,
    );
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    Widget w = SizedBox.shrink();

    switch (imageType) {
      case ImageType.png:
        w = Image.network(
          url ?? "",
          width: width,
          height: height,
          fit: fit,
        );
      case ImageType.jpg:
        w = Image.network(
          url ?? "",
          width: width,
          height: height,
          fit: fit,
        );
      case ImageType.svg:
        w = SvgPicture.network(
          url ?? "",
          width: width,
          height: height,
        );
      case ImageType.json:
        w = Lottie.network(
          url ?? "",
          width: width,
          height: height,
        );
      default:
        w = Image.network(
          url ?? "",
          width: width,
          height: height,
          fit: fit,
        );
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: w,
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
                      Text("Image $name ${child != null ? "..." : ""}"),
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
                Text("Image $name"),
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
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Url'),
                    keyboardType: TextInputType.text,
                    initialValue: url,
                    onChanged: (value) {
                      url = value;
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

                /// box fit
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'Fit'),
                        keyboardType: TextInputType.text,
                        initialValue: fit != null ? "$fit" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectBoxFit(
                            context: c,
                            callBack: (BoxFit? boxFit) {
                              innerSetState.call(() {
                                fit = boxFit;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
                ),

                /// box type
                Container(
                  width: MediaQuery.of(context).size.width * widthDefaultComponent,
                  alignment: Alignment.centerLeft,
                  child: Builder(builder: (c) {
                    return TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(labelText: 'Image Type'),
                        keyboardType: TextInputType.text,
                        initialValue: imageType != null ? "$imageType" : null,
                        onChanged: (value) {
                          onUpdate?.call(null);
                        },
                        onTap: () {
                          ///
                          Component.selectImageType(
                            context: c,
                            callBack: (ImageType? type) {
                              innerSetState.call(() {
                                imageType = type;
                              });
                              onUpdate?.call(null);
                            },
                          );
                        });
                  }),
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
