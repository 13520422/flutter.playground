import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? formId;

  ///
  String? Function(String?)? validator;
  void Function(String?)? onSaved;

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

  CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.validateError,

    ///
    this.fontFamily,

    ///text style input
    this.fontSize,
    this.color,
    this.fontStyle,
    this.fontWeight,

    //text style label
    this.fontSizeLabel,
    this.colorLabel,
    this.fontStyleLabel,
    this.fontWeightLabel,

    //text style hint
    this.fontSizeHint,
    this.colorHint,
    this.fontStyleHint,
    this.fontWeightHint,

    //text style error
    this.fontSizeError,
    this.colorError,
    this.fontStyleError,
    this.fontWeightError,

    ///
    this.isValidate,
    this.textAlign,
    this.maxLine,
    this.padding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    this.border,
    this.borderOnFocus,
    this.borderOnError,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.formId,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        contentPadding: padding,
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSizeLabel,
          fontWeight: fontWeightLabel,
          fontStyle: fontStyleLabel,
          color: colorLabel,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSizeHint,
          fontWeight: fontWeightHint,
          fontStyle: fontStyleHint,
          color: colorHint,
        ),
        errorStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSizeError,
          fontWeight: fontWeightError,
          fontStyle: fontStyleError,
          color: colorError,
        ),
        border: border?.top != null
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: border!.top.color,
                  width: border!.top.width,
                ),
              )
            : border?.bottom != null
                ? OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                      color: border!.top.color,
                      width: border!.top.width,
                    ),
                  )
                : null,
        focusedBorder: borderOnFocus?.top != null
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: borderOnFocus!.top.color,
                  width: borderOnFocus!.top.width,
                ),
              )
            : borderOnFocus?.bottom != null
                ? OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                      color: borderOnFocus!.top.color,
                      width: borderOnFocus!.top.width,
                    ),
                  )
                : null,
        errorBorder: borderOnError?.top != null
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: borderOnError!.top.color,
                  width: borderOnError!.top.width,
                ),
              )
            : borderOnError?.bottom != null
                ? OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                      color: borderOnError!.top.color,
                      width: borderOnError!.top.width,
                    ),
                  )
                : null,
      ),
      validator: isValidate == true ? validator : null,
      onSaved: onSaved,
      maxLines: maxLine,
      minLines: maxLine != null ? 1 : null,
      keyboardType: keyboardType,
    );
  }
}
