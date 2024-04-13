import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/component/button.dart';
import 'package:playground/component/column.dart';
import 'package:playground/component/container.dart';
import 'package:playground/component/image.dart';
import 'package:playground/component/positioned.dart';
import 'package:playground/component/row.dart';
import 'package:playground/component/single_scroll_view.dart';
import 'package:playground/component/sized_box.dart';
import 'package:playground/component/stack.dart';
import 'package:playground/component/text_view.dart';
import 'package:playground/widget/diaglog_select_box.dart';

abstract class Component {
  final isExpand = false.obs;
  String? name;
  Function(Component?)? onUpdate;
  Function(Component)? onDelete;
  Function(Component)? onWrap;
  Function(Component)? onWrapChildren;
  Component? child;
  List<Component> children = [];
  Widget toWidgetViewer(BuildContext context);
  Widget toWidgetProperties(BuildContext context);
  Map<String, dynamic> toJson();
  void fromJson(Map<String, dynamic> json);
  GlobalKey<State<StatefulWidget>>? globalKey;
  Component copyWith();
  static Component? copyComponent;
  static void addComponent({
    required BuildContext context,
    required int childCount,
    required Function(Component?) onUpdate,
    required Function(Component) onDelete,
    required Function(Component) onWrap,
    required Function(Component) onWrapChildren,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Component",
        itemSelects: [
          SelectModel<Component?>(
            name: "SizedBox",
            value: CCSizedBox(
              name: "SizedBox $childCount",
              onUpdate: onUpdate,
              onDelete: onDelete,
              onWrap: onWrap,
              onWrapChildren: onWrapChildren,
            ),
          ),
          SelectModel<Component?>(
            name: "Container",
            value: CCContainer(
              name: "Container $childCount",
              onUpdate: onUpdate,
              onDelete: onDelete,
              onWrap: onWrap,
              onWrapChildren: onWrapChildren,
            ),
          ),
          SelectModel<Component?>(
            name: "Text",
            value: CCTextView(
              name: "TextView $childCount",
              onUpdate: onUpdate,
              onDelete: onDelete,
              onWrap: onWrap,
              onWrapChildren: onWrapChildren,
            ),
          ),
          SelectModel<Component?>(
            name: "Image",
            value: CCImage(
              name: "Image $childCount",
              onUpdate: onUpdate,
              onDelete: onDelete,
              onWrap: onWrap,
              onWrapChildren: onWrapChildren,
            ),
          ),
          SelectModel<Component?>(
            name: "Button",
            value: CCButton(
              name: "Button $childCount",
              onUpdate: onUpdate,
              onDelete: onDelete,
              onWrap: onWrap,
              onWrapChildren: onWrapChildren,
            ),
          ),
          SelectModel<Component?>(
              name: "Column",
              value: CCColumn(
                name: "Column $childCount",
                onUpdate: onUpdate,
                onDelete: onDelete,
                onWrap: onWrap,
                onWrapChildren: onWrapChildren,
              )),
          SelectModel<Component?>(
              name: "Row",
              value: CCRow(
                name: "Row $childCount",
                onUpdate: onUpdate,
                onDelete: onDelete,
                onWrap: onWrap,
                onWrapChildren: onWrapChildren,
              )),
          SelectModel<Component?>(
              name: "Stack",
              value: CCStack(
                name: "Stack $childCount",
                onUpdate: onUpdate,
                onDelete: onDelete,
                onWrap: onWrap,
                onWrapChildren: onWrapChildren,
              )),
          SelectModel<Component?>(
            name: "Positioned",
            value: CCPositioned(
              name: "Positioned $childCount",
              onUpdate: onUpdate,
              onDelete: onDelete,
              onWrap: onWrap,
              onWrapChildren: onWrapChildren,
            ),
          ),
          SelectModel<Component?>(
              name: "Scroll View",
              value: CCScrollView(
                name: "ScrollView $childCount",
                onUpdate: onUpdate,
                onDelete: onDelete,
                onWrap: onWrap,
                onWrapChildren: onWrapChildren,
              )),
          SelectModel<Component?>(name: "Text Field", value: null),
          SelectModel<Component?>(name: "Check Box", value: null),
          SelectModel<Component?>(name: "Select Box", value: null),
          SelectModel<Component?>(name: "Paste Component", value: copyComponent?.copyWith()),
        ],
        isShowSearchInput: true,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            onUpdate.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectAlignment({
    required BuildContext context,
    required Function(Alignment) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Alignment",
        itemSelects: [
          SelectModel<Alignment>(name: "${Alignment.center}", value: Alignment.center),
          SelectModel<Alignment>(name: "${Alignment.centerLeft}", value: Alignment.centerLeft),
          SelectModel<Alignment>(name: "${Alignment.centerRight}", value: Alignment.centerRight),
          SelectModel<Alignment>(name: "${Alignment.topCenter}", value: Alignment.topCenter),
          SelectModel<Alignment>(name: "${Alignment.topLeft}", value: Alignment.topLeft),
          SelectModel<Alignment>(name: "${Alignment.topRight}", value: Alignment.topRight),
          SelectModel<Alignment>(name: "${Alignment.bottomCenter}", value: Alignment.bottomCenter),
          SelectModel<Alignment>(name: "${Alignment.bottomLeft}", value: Alignment.bottomLeft),
          SelectModel<Alignment>(name: "${Alignment.bottomRight}", value: Alignment.bottomRight),
        ],
        isShowSearchInput: true,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectShape({
    required BuildContext context,
    required Function(BoxShape) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Shape",
        itemSelects: [
          SelectModel<BoxShape>(name: "${BoxShape.rectangle}", value: BoxShape.rectangle),
          SelectModel<BoxShape>(name: "${BoxShape.circle}", value: BoxShape.circle),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectFontWeight({
    required BuildContext context,
    required Function(FontWeight) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Font Weight",
        itemSelects: [
          SelectModel<FontWeight>(name: "${FontWeight.w100}", value: FontWeight.w100),
          SelectModel<FontWeight>(name: "${FontWeight.w200}", value: FontWeight.w200),
          SelectModel<FontWeight>(name: "${FontWeight.w300}", value: FontWeight.w300),
          SelectModel<FontWeight>(name: "${FontWeight.w400}", value: FontWeight.w400),
          SelectModel<FontWeight>(name: "${FontWeight.w500}", value: FontWeight.w500),
          SelectModel<FontWeight>(name: "${FontWeight.w600}", value: FontWeight.w600),
          SelectModel<FontWeight>(name: "${FontWeight.w700}", value: FontWeight.w700),
          SelectModel<FontWeight>(name: "${FontWeight.w800}", value: FontWeight.w800),
          SelectModel<FontWeight>(name: "${FontWeight.w900}", value: FontWeight.w900),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectTextAlign({
    required BuildContext context,
    required Function(TextAlign) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Text Align",
        itemSelects: [
          SelectModel<TextAlign>(name: "${TextAlign.center}", value: TextAlign.center),
          SelectModel<TextAlign>(name: "${TextAlign.start}", value: TextAlign.start),
          SelectModel<TextAlign>(name: "${TextAlign.left}", value: TextAlign.left),
          SelectModel<TextAlign>(name: "${TextAlign.right}", value: TextAlign.right),
          SelectModel<TextAlign>(name: "${TextAlign.end}", value: TextAlign.end),
          SelectModel<TextAlign>(name: "${TextAlign.justify}", value: TextAlign.justify),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectTextOverflow({
    required BuildContext context,
    required Function(TextOverflow) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Text Overflow",
        itemSelects: [
          SelectModel<TextOverflow>(name: "${TextOverflow.clip}", value: TextOverflow.clip),
          SelectModel<TextOverflow>(name: "${TextOverflow.ellipsis}", value: TextOverflow.ellipsis),
          SelectModel<TextOverflow>(name: "${TextOverflow.fade}", value: TextOverflow.fade),
          SelectModel<TextOverflow>(name: "${TextOverflow.visible}", value: TextOverflow.visible),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectBoxFit({
    required BuildContext context,
    required Function(BoxFit) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Box Fit",
        itemSelects: [
          SelectModel<BoxFit>(name: "${BoxFit.contain}", value: BoxFit.contain),
          SelectModel<BoxFit>(name: "${BoxFit.cover}", value: BoxFit.cover),
          SelectModel<BoxFit>(name: "${BoxFit.fill}", value: BoxFit.fill),
          SelectModel<BoxFit>(name: "${BoxFit.fitHeight}", value: BoxFit.fitHeight),
          SelectModel<BoxFit>(name: "${BoxFit.fitWidth}", value: BoxFit.fitWidth),
          SelectModel<BoxFit>(name: "${BoxFit.scaleDown}", value: BoxFit.scaleDown),
          SelectModel<BoxFit>(name: "${BoxFit.none}", value: BoxFit.none),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectImageType({
    required BuildContext context,
    required Function(ImageType) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select Image type",
        itemSelects: [
          SelectModel<ImageType>(name: ImageType.png.name, value: ImageType.png),
          SelectModel<ImageType>(name: ImageType.jpg.name, value: ImageType.jpg),
          SelectModel<ImageType>(name: ImageType.svg.name, value: ImageType.svg),
          SelectModel<ImageType>(name: ImageType.json.name, value: ImageType.json),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectMainAxisAlignment({
    required BuildContext context,
    required Function(MainAxisAlignment) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select MainAxisAlignment",
        itemSelects: [
          SelectModel<MainAxisAlignment>(name: "${MainAxisAlignment.center}", value: MainAxisAlignment.center),
          SelectModel<MainAxisAlignment>(name: "${MainAxisAlignment.end}", value: MainAxisAlignment.end),
          SelectModel<MainAxisAlignment>(name: "${MainAxisAlignment.start}", value: MainAxisAlignment.start),
          SelectModel<MainAxisAlignment>(
              name: "${MainAxisAlignment.spaceAround}", value: MainAxisAlignment.spaceAround),
          SelectModel<MainAxisAlignment>(
              name: "${MainAxisAlignment.spaceBetween}", value: MainAxisAlignment.spaceBetween),
          SelectModel<MainAxisAlignment>(
              name: "${MainAxisAlignment.spaceEvenly}", value: MainAxisAlignment.spaceEvenly),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectCrossAxisAlignment({
    required BuildContext context,
    required Function(CrossAxisAlignment) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select CrossAxisAlignment",
        itemSelects: [
          SelectModel<CrossAxisAlignment>(name: "${CrossAxisAlignment.center}", value: CrossAxisAlignment.center),
          SelectModel<CrossAxisAlignment>(name: "${CrossAxisAlignment.end}", value: CrossAxisAlignment.end),
          SelectModel<CrossAxisAlignment>(name: "${CrossAxisAlignment.baseline}", value: CrossAxisAlignment.baseline),
          SelectModel<CrossAxisAlignment>(name: "${CrossAxisAlignment.start}", value: CrossAxisAlignment.start),
          SelectModel<CrossAxisAlignment>(name: "${CrossAxisAlignment.stretch}", value: CrossAxisAlignment.stretch),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectMainAxisSize({
    required BuildContext context,
    required Function(MainAxisSize) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select CrossAxisAlignment",
        itemSelects: [
          SelectModel<MainAxisSize>(name: "${MainAxisSize.min}", value: MainAxisSize.min),
          SelectModel<MainAxisSize>(name: "${MainAxisSize.max}", value: MainAxisSize.max),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectPhysics({
    required BuildContext context,
    required Function(ScrollPhysics) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select ScrollPhysics",
        itemSelects: [
          SelectModel<ScrollPhysics>(name: "BouncingScrollPhysics", value: BouncingScrollPhysics()),
          SelectModel<ScrollPhysics>(name: "ClampingScrollPhysics", value: ClampingScrollPhysics()),
          SelectModel<ScrollPhysics>(name: "NeverScrollableScrollPhysics", value: NeverScrollableScrollPhysics()),
          SelectModel<ScrollPhysics>(name: "AlwaysScrollableScrollPhysics", value: AlwaysScrollableScrollPhysics()),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }

  static void selectScrollDirection({
    required BuildContext context,
    required Function(Axis) callBack,
  }) {
    try {
      DialogSelectBoxModel dialogSelectBoxModel = DialogSelectBoxModel(
        isCloseTop: true,
        title: "Select ScrollDirection",
        itemSelects: [
          SelectModel<Axis>(name: "${Axis.horizontal}", value: Axis.horizontal),
          SelectModel<Axis>(name: "${Axis.vertical}", value: Axis.vertical),
        ],
        isShowSearchInput: false,
        multiSelect: false,
      );
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var _size = renderBox.size;
      var _offset = renderBox.localToGlobal(Offset.zero);
      final overlay = OverlayDialogUtils.showDialogOverLay(
        context,
        DialogSelectBoxWeb(
          model: dialogSelectBoxModel,
          onUpdate: () {
            dialogSelectBoxModel.overlayDialog?.removeOverlay();
            var optionItem = dialogSelectBoxModel.items.where((p0) => p0.check.value).toList().first.value;
            callBack.call(optionItem);
          },
          offset: _offset,
          size: _size,
          maxHeightDialog: 500,
        ),
        _offset,
        _size,
        500,
        250,
      );
      dialogSelectBoxModel.overlayDialog = overlay;
    } catch (e, t) {
      // TODO
      print("error $e");
      print("error $t");
    }

    return;
  }
}
