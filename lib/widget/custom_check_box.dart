import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  String? formId;
  String? Function(bool?)? validator;
  void Function(bool?)? onSaved;
  void Function(bool?)? onChange;
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
  CustomCheckBox({
    super.key,
    this.formId,
    this.validator,
    this.onSaved,
    this.onChange,
    this.padding,
    this.label,
    this.isReverse,
    this.validateError,
    this.fontFamily,
    this.fontSize,
    this.color,
    this.fontStyle,
    this.fontWeight,
    this.fontSizeError,
    this.colorError,
    this.fontStyleError,
    this.fontWeightError,
    this.isValidate,
    this.checkColor,
    this.backgroundColor,
    this.activeColor,
    this.size,
    this.isCircle,
    this.mainAxisAlignment,
    this.textAlign,
    this.widthBorder,
    this.borderRadius,
    this.colorBorder,
    bool initialValue = false,
    this.space,
  }) {
    value.value = initialValue;
  }
  final RxBool value = false.obs;
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      builder: (state) {
        return Column(
          children: [
            Padding(
              padding: padding ?? EdgeInsets.zero,
              child: (label ?? "").isEmpty
                  ? buildCheckBox(context)
                  : Row(
                      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: isReverse == true
                          ? [
                              buildTitle(context),
                              buildSpace(context),
                              buildCheckBox(context),
                            ]
                          : [
                              buildCheckBox(context),
                              buildSpace(context),
                              buildTitle(context),
                            ],
                    ),
            ),
            (state.errorText ?? '').isNotEmpty
                ? Text(
                    validateError ?? '',
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: fontSizeError,
                      fontWeight: fontWeightError,
                      fontStyle: fontStyleError,
                      color: colorError,
                    ),
                  )
                : SizedBox()
          ],
        );
      },
      validator: isValidate == true ? validator : null,
      onSaved: onSaved,
      initialValue: value.value,
    );
  }

  Widget buildSpace(BuildContext context) => GestureDetector(
        onTap: () {
          onTap(context);
        },
        child: Container(
          width: space ?? 10,
          height: 18,
          color: Colors.transparent,
        ),
      );

  void onTap(BuildContext context) {
    value.value = !value.value;
    onChange?.call(value.value);
    FocusScope.of(context).unfocus();
  }

  Widget buildTitle(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          onTap(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              child: Text(
                label ?? "",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                  color: color,
                ),
                textAlign: textAlign,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckBox(BuildContext context) {
    var scale = ((size ?? Checkbox.width)) / Checkbox.width;
    return Obx(
      () => Container(
        width: size,
        height: size,
        child: Transform.scale(
          scale: ((size ?? Checkbox.width) - (widthBorder ?? 2) * 2.1 * scale) / Checkbox.width,
          child: Checkbox(
            shape: isCircle == true
                ? RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100)))
                : borderRadius != null
                    ? RoundedRectangleBorder(borderRadius: borderRadius!)
                    : null,
            fillColor: getFillColor(),
            value: value.value,
            tristate: false,
            side: getBorderSide(),
            onChanged: (bool? v) {
              FocusScope.of(context).unfocus();
              value.value = v == true;
              onChange?.call(value.value);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            autofocus: false,
            checkColor: checkColor,
            activeColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  BorderSide? getBorderSide() {
    if (colorBorder != null && widthBorder != null) {
      return BorderSide(color: colorBorder!, width: widthBorder!);
    }
    return null;
  }

  MaterialStateProperty<Color?>? getFillColor() {
    if (activeColor != null) {
      if (value.value) {
        return MaterialStateProperty.all(activeColor);
      } else {
        return backgroundColor != null ? MaterialStateProperty.all(backgroundColor) : null;
      }
    } else {
      return backgroundColor != null ? MaterialStateProperty.all(backgroundColor) : null;
    }
    // return null;
  }
}
