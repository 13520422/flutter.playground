import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/widget/check_box.dart';

class SelectModel<T> {
  final String name;
  final T value;
  final Widget? leading;
  final RxBool check = false.obs;
  final RxBool disable = false.obs;
  SelectModel({required this.value, required this.name, check, disable = false, this.leading}) {
    this.check.value = check ?? false;
    this.disable.value = disable ?? false;
  }
}

class DialogSelectBoxModel {
  final RxList<SelectModel> items = <SelectModel>[].obs;
  final bool multiSelect;
  final String title;

  ///value =true is show button confirm to hide dialog
  final bool isCloseTop;

  ///
  String? hinTextSearch;
  final bool isShowSearchInput;
  final RxString textSearch = "".obs;
  TextStyle? textStyleSearch;

  ///value =true is show button check all
  final RxBool isCheckAll = false.obs;

  ///using only for webPlatform
  OverlayCustomer? overlayDialog;
  Color? backgroundColor = Colors.white;
  InputDecoration? searchFieldDecoration;

  ///controller of input search
  TextEditingController? controller;

  ///model dialog show to chose item from list item
  ///
  DialogSelectBoxModel({
    required List<SelectModel> itemSelects,
    this.multiSelect = false,
    this.title = "",
    this.isShowSearchInput = true,
    this.hinTextSearch,
    this.isCloseTop = true,
    this.searchFieldDecoration,
    this.textStyleSearch,
  }) {
    items.clear();
    items.addAll(itemSelects);

    ///check check all
    int count = 0;
    for (var item in items) {
      if (item.check.value) {
        count += 1;
      }
    }
    if (count > 0 && count == items.length) {
      isCheckAll.value = true;
    } else {
      isCheckAll.value = false;
    }
    controller = controller ?? TextEditingController();
  }
  void dispose() {
    controller?.dispose();
  }

  set checkAll(bool v) {
    // print(v);
    for (var element in items) {
      element.check.value = v;
    }
    isCheckAll.value = v;
  }

  List<SelectModel> get listItem {
    if (textSearch.value.isNotEmpty) {
      var ls = <SelectModel>[];
      for (var element in items) {
        if (element.name.contains(textSearch.value)) {
          ls.add(element);
        }
      }
      return ls;
    } else {
      return items;
    }
  }
}

class OverlayDialogUtils {
  static OverlayCustomer showDialogOverLay(
      BuildContext context, Widget child, Offset position, Size size, double maxHeightDialog, double minWidthDialog) {
    var _overlay = OverlayCustomer();
    _overlay.insertOverlay(child, context, position, size, maxHeightDialog, minWidthDialog);
    return _overlay;
  }
}

class OverlayCustomer {
  // 2
  OverlayEntry? _overlayEntry;

  // 3
  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool get isOverlayShown => _overlayEntry != null;

  // 4
  Widget _dismissibleOverlay(
      Widget child, BuildContext context, Offset position, Size size, double maxHeightDialog, double minWidthDialog) {
    double maxHeight = maxHeightDialog;
    double dyShowBottom = position.dy + size.height;
    bool isShowToTop = false;
    if (MediaQuery.of(context).size.height - dyShowBottom - 20 < maxHeight) {
      maxHeight = MediaQuery.of(context).size.height - dyShowBottom;
    }

    ///check show to top
    if (maxHeight < 0.2 * MediaQuery.of(context).size.height) {
      isShowToTop = true; //show to top
    }

    ///
    // double maxWidth = minWidthDialog;
    double left = position.dx;
    double right = MediaQuery.of(context).size.width - (position.dx + max(size.width, minWidthDialog));
    if (right < 0) {
      left = position.dx + right;
      right = 0;
    }
    if (size.width < minWidthDialog) {
      if (position.dx > 0 &&
          MediaQuery.of(context).size.width - (position.dx + size.width) > (minWidthDialog - size.width) / 2) {
        double left1 = (position.dx - (minWidthDialog - size.width) / 2).clamp(0, MediaQuery.of(context).size.width);
        right += left - left1;
        left = left1;
      }
    }
    return WillPopScope(
      onWillPop: () async {
        // 2
        if (isOverlayShown) {
          removeOverlay();
          return false;
        }
        return true;
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: removeOverlay,
              ),
            ),
          ),
          isShowToTop
              ? Positioned(
                  bottom: MediaQuery.of(context).size.height - position.dy,
                  left: left,
                  right: right,
                  child: child,
                )
              : Positioned(
                  top: position.dy + size.height,
                  left: left,
                  right: right,
                  child: child,
                )
        ],
      ),
    );
  }

  // 5
  void insertOverlay(
      Widget child, BuildContext context, Offset position, Size size, double maxHeightDialog, double minWidthDialog) {
    // 6
    _overlayEntry = OverlayEntry(
      builder: (_) => _dismissibleOverlay(child, context, position, size, maxHeightDialog, minWidthDialog),
    );

    // 7
    Overlay.of(context).insert(_overlayEntry!);
  }
}

class DialogSelectBox extends StatelessWidget {
  final DialogSelectBoxModel model;

  ///must declare model to control data
  ///
  ///result=='OK' or null
  ///
  /// ex:
  /// var model=DialogSelectBoxModel(itemSelects:itemSelects);
  ///
  /// var rs=await showDialog(context: context, builder: (_)=>DialogSelectBox(model);)
  ///
  /// if(rs=='OK')
  /// {
  ///   dataChoose=itemSelects.map((e)=>e.check).toList();
  /// }
  const DialogSelectBox({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    double maxHeight = MediaQuery.of(context).size.height * (isTablet ? .7 : .6);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          searchField(),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _checkAllItems(),
                const SizedBox(height: 10),
                model.listItem.length > 0
                    ? Obx(
                        () {
                          if (model.textSearch.value.isNotEmpty) {}
                          return Flexible(
                              child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: model.listItem.length,
                            itemBuilder: (context, index) {
                              var item = model.listItem[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [_itemWidgetMultiSelection(item), const Divider()],
                                ),
                              );
                            },
                          ));
                        },
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          "Empty data",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ],
            ),
          ),
          model.multiSelect
              ? _multiSelectionValidation()
              : model.isCloseTop
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(30))),
                        height: 45,
                        child: const Center(
                          child: Text(
                            "Đóng",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
          SizedBox(
            height: Get.mediaQuery.padding.bottom,
          )
        ],
      ),
    );
  }

  Widget _itemWidgetMultiSelection(SelectModel item, {Function? onUpdate}) {
    return CheckBoxWidget(
      checkBox: (cnt, checked) {
        return item.check.value
            ? const Icon(
                Icons.check_circle,
                color: Colors.pink,
                size: 18,
              )
            : const SizedBox();
      },
      layout: (context, isChecked) => _itemWidgetSingleSelection(item),
      isChecked: item.check,
      isDisabled: item.disable,
      leading: item.leading,
      onChanged: (c) {
        // print("_itemWidgetMultiSelection  $c");
        if (!model.multiSelect) {
          //model.checkAll = false;
          if (item.check.value && onUpdate == null) {
            Get.back(result: "OK");
          } else {
            model.checkAll = false;
            item.check.value = c;
            if (onUpdate == null) Get.back(result: "OK");
          }
        } else {
          item.check.value = c;
        }
        if (onUpdate != null) {
          onUpdate.call();
        }
      },
    );
  }

  Widget _itemWidgetSingleSelection(SelectModel item) {
    return Container(
      constraints: BoxConstraints(minHeight: 40),
      alignment: Alignment.bottomLeft,
      child: Text(
        item.name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _multiSelectionValidation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          model.isCloseTop
              ? const SizedBox()
              : Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(30))),
                        alignment: Alignment.center,
                        child: const Text(
                          "Hủy bỏ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                  Get.back(result: "OK");
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(30))),
                  alignment: Alignment.center,
                  child: const Text(
                    "Đồng ý",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _checkAllItems({Function? onUpdate}) {
    if (model.multiSelect) {
      return SizedBox(
        height: 35,
        child: GestureDetector(
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Select All",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 5),
                Obx(() => Container(
                      child: model.isCheckAll.value
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.pink,
                              size: 18,
                            )
                          : const Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                              size: 18,
                            ),
                    )),
                const SizedBox(width: 15),
              ],
            ),
          ),
          onTap: () {
            model.checkAll = !model.isCheckAll.value;
            if (onUpdate != null) {
              onUpdate.call();
            }

            ///
          },
        ),
      );
    }

    return SizedBox();
  }

  Widget _title() {
    if (model.isCloseTop) {
      return Stack(
        children: [
          SizedBox(
              height: 55,
              child: Text(
                model.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.transparent,
                    alignment: Alignment.centerRight,
                    height: 55,
                    width: 55,
                    child: const Icon(Icons.close)),
              )),
            ],
          ),
        ],
      );
    }

    return SizedBox(
        height: 55,
        child: Text(
          model.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            height: 1.2,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ));
  }

  Widget searchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _title(),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        if (model.isShowSearchInput)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Obx(() => TextFormField(
                  style: textStyle(),
                  onChanged: (f) {
                    model.textSearch.value = f.toLowerCase();
                  },
                  controller: model.controller,
                  // initialValue: model.textSearch.value,
                  decoration: InputDecoration(
                      hintText: model.hinTextSearch ?? "Search",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 17),
                      suffixIcon: model.textSearch.value.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                model.textSearch.value = '';
                                model.controller!.text = '';
                              },
                              child: const Icon(Icons.cancel, color: Colors.grey, size: 18),
                            )
                          : const SizedBox()),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  textAlign: TextAlign.start,
                  onFieldSubmitted: (t) {
                    model.textSearch.value = t.toLowerCase();
                  },
                )),
          )
      ],
    );
  }

  TextStyle? textStyle() {
    return model.textStyleSearch;
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
    );
  }
}

class DialogSelectBoxWeb extends DialogSelectBox {
  final DialogSelectBoxModel model;
  final Function onUpdate;
  final Offset offset;
  final Size size;
  final double maxHeightDialog;

  DialogSelectBoxWeb(
      {required this.model,
      required this.onUpdate,
      required this.offset,
      required this.size,
      required this.maxHeightDialog})
      : super(model: model);

  @override
  Widget searchField() {
    if (!model.isShowSearchInput) return SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Obx(() => TextFormField(
              style: textStyle(),
              onChanged: (f) {
                model.textSearch.value = f.toLowerCase();
              },
              controller: model.controller,
              // initialValue: model.textSearch.value,
              decoration: model.searchFieldDecoration ??
                  InputDecoration(
                    hintText: model.hinTextSearch ?? "Search",
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 17),
                    suffixIcon: model.textSearch.value.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              model.textSearch.value = '';
                              model.controller!.text = '';
                            },
                            child: const Icon(Icons.cancel, color: Colors.grey, size: 18),
                          )
                        : const SizedBox(),
                  ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              textAlign: TextAlign.start,
              onFieldSubmitted: (t) {
                model.textSearch.value = t.toLowerCase();
              },
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ///
    double maxHeight = maxHeightDialog;
    double dyShowBottom = offset.dy + size.height;
    if (MediaQuery.of(context).size.height - dyShowBottom - 20 < maxHeight) {
      maxHeight = MediaQuery.of(context).size.height - dyShowBottom;
    }

    ///check show to top
    if (maxHeight < 0.2 * MediaQuery.of(context).size.height) {
      maxHeight = maxHeightDialog; //show to top
    }
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: model.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0.5, 0.5),
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                searchField(),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _checkAllItems(onUpdate: onUpdate),
                      model.listItem.length > 0
                          ? Obx(
                              () {
                                if (model.textSearch.value.isNotEmpty) {}
                                return Flexible(
                                    child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: model.listItem.length,
                                  itemBuilder: (context, index) {
                                    var item = model.listItem[index];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        children: [
                                          _itemWidgetMultiSelection(item, onUpdate: onUpdate),
                                          const Divider()
                                        ],
                                      ),
                                    );
                                  },
                                ));
                              },
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Không có dữ liệu",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
