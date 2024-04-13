import 'package:flutter/services.dart';

mixin InputFormatterBase {
  String convertValue(String value);
  String revertValue(String value);
  num toNum(String value);
}

///ex:
///DecimalInputFormatter format=DecimalInputFormatter()
///
///TextField(formatInput:[format])
///
///or result=format.convertValue(value)
///
class DecimalInputFormatter extends TextInputFormatter with InputFormatterBase {
  final String decimalSeparator;
  final String thousandSeparator;
  final String rightSymbol;
  final String leftSymbol;
  final int precision;
  final bool isUsePrecision;
  DecimalInputFormatter({
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
    this.rightSymbol = '',
    this.leftSymbol = '',
    this.precision = 2,
    this.isUsePrecision = false,
  });
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      var oldValueText = oldValue.text;
      var newValueText = newValue.text;

      var lsOld = oldValueText.split("");
      var lsNew = newValueText.split("");
      List<String> lsLast = [];
      if (lsNew.isNotEmpty) {
        for (int i = 0; i < lsNew.length; i++) {
          var t = lsNew[i];

          var tOld = "";
          if (lsOld.length > i) {
            tOld = lsOld[i];
          }
          if (t != tOld) {
            if (t == "." || t == ",") {
              t = decimalSeparator;
            }
          }
          lsLast.add(t);
        }
      } else {
        lsLast = newValueText.split("");
      }
      // print(lsLast.join(''));

      String valueNumber = lsLast
          .join('')
          .replaceAll(thousandSeparator, '')
          .replaceAll(decimalSeparator, '.')
          .replaceAll(rightSymbol, "")
          .replaceAll(leftSymbol, "")
          .replaceAll(RegExp(r'[^0-9,.]'), '');

      // .replaceAll("#", '')
      // .replaceAll('@', '.');

      String text = updateValue(valueNumber);
      // print("updateValue $text");
      var newSelection = newValue.selection.copyWith(
        baseOffset: text.length - rightSymbol.length,
        extentOffset: text.length - rightSymbol.length,
      );
      return TextEditingValue(
        text: text,
        selection: newSelection,
        composing: TextRange.empty,
      );
    } on Exception catch (e, t) {
      return newValue;
    }
  }

  ///value is double
  @override
  String convertValue(String value) {
    String text = updateValue(value);
    // print("convertValue $text");
    return text;
  }

  @override
  num toNum(String value) {
    // print('toDouble  $value');
    try {
      if (value is num) {
        return num.parse(value);
      }

      if (value.contains(".") && thousandSeparator == '.') {
        value = value.replaceAll('.', ',');
        value += '0';
      }
      var valueNumber = value
          .replaceAll(thousandSeparator, '')
          .replaceAll(decimalSeparator, '.')
          .replaceAll(rightSymbol, "")
          .replaceAll(leftSymbol, "")
          .replaceAll(RegExp(r'[^0-9,.]'), '');

      return num.parse(valueNumber);
    } catch (e, t) {
      // TODO
      return 0;
    }
  }

  @override
  String revertValue(String value) {
    // print("revertValue $value");
    var valueNumber = value
        .replaceAll(thousandSeparator, '')
        .replaceAll(decimalSeparator, '.')
        .replaceAll(rightSymbol, "")
        .replaceAll(leftSymbol, "")
        .replaceAll(RegExp(r'[^0-9,.]'), '');
    return valueNumber;
  }

  String updateValue(String value) {
    try {
      var valueNumber = value;
      String lastValue = '';

      if (!isUsePrecision) {
        if (valueNumber.contains('.')) {
          var ls = valueNumber.split('.');
          if (ls.isNotEmpty) {
            valueNumber = ls[0];
            lastValue = decimalSeparator + (ls.length > 1 ? ls[1] : "");
          }
        }
      } else {
        if (valueNumber.contains('.')) {
          var ls = valueNumber.split('.');
          valueNumber = ls[0];
          lastValue = ls.length > 1 ? ls[1] : "";
          if (lastValue.isNotEmpty) {
            valueNumber = double.parse("$valueNumber.$lastValue").toStringAsFixed(precision);
            if (valueNumber.contains('.')) {
              ls = valueNumber.split('.');
              valueNumber = ls[0];
              lastValue = ls.length > 1 ? ls[1] : "";
            }
            if (double.parse(lastValue) == 0) {
              lastValue = "";
            }
            if (lastValue.isNotEmpty) {
              // print("lastValue $lastValue");
              var l = lastValue.split('').toList();
              for (int i = l.length - 1; i >= 0; i--) {
                // print(l[i]);
                if (int.parse(l[i]) > 0) {
                  break;
                } else {
                  l.removeAt(i);
                }
              }
              if (l.isNotEmpty) {
                lastValue = l.join('');
              } else {
                lastValue = "";
              }
            }
          }

          lastValue = decimalSeparator + lastValue;
        }
      }

      // double valueToUse = double.parse(valuenumber);

      // if (value.toStringAsFixed(0).length > 12) {
      //   valueToUse = _lastValue;
      // } else {
      //   _lastValue = value;
      // }

      String masked = _applyMask(valueNumber);
      // print(masked);
      if (masked.isNotEmpty) {
        if (masked.substring(masked.length - 1, masked.length) == decimalSeparator) {
          masked = masked.substring(0, masked.length - 1);
        }

        if (lastValue.isNotEmpty) {
          if (masked.isNotEmpty) {
            masked = masked + lastValue;
          } else {
            masked = "0$lastValue";
          }
        }

        if (rightSymbol.isNotEmpty) {
          masked += rightSymbol;
        }

        if (leftSymbol.isNotEmpty) {
          masked = leftSymbol + masked;
        }
      }

      // print("updateValue $masked");
      return masked;
    } catch (e, t) {
      return value;
    }
  }

  String _applyMask(String value) {
    // print("_applyMask $value");
    List<String> textRepresentation = value.split('').reversed.toList(growable: true);

    // textRepresentation.insert(precision, decimalSeparator);

    for (var i = 3; true; i = i + 4) {
      if (textRepresentation.length > i) {
        textRepresentation.insert(i, thousandSeparator);
      } else {
        break;
      }
    }

    return textRepresentation.reversed.join('');
  }
}

///example  "xxxx xxxx xxxx xxxx"
///
///CardNumberFormatter format=CardNumberFormatter()
///
///TextField(formatInput:[format])
///
///or result=format.convertValue(value)
///
class CardNumberFormatter extends TextInputFormatter with InputFormatterBase {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }
    String bufferString = updateValue(nextValue.text);
    var string = bufferString;
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }

  String updateValue(String text) {
    var inputText = text.replaceAll(" ", "");

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }
    return bufferString.toString();
  }

  @override
  String convertValue(String value) {
    String text = updateValue(value);
    return text;
  }

  @override
  String revertValue(String value) {
    var valueNumber = value.replaceAll(' ', '');
    return valueNumber;
  }

  @override
  num toNum(String value) {
    try {
      return num.parse(value);
    } catch (e) {
      // TODO
      return 0;
    }
  }
}

///example  CardTextFormatter(mask: "xxxx-xxxx-xxxx-xxxx", separator: "-")
//////example  "xxxx xxxx xxxx xxxx"
///
///CardNumberFormatter format=CardTextFormatter()
///
///TextField(formatInput:[format])
///
///or result=format.convertValue(value)
///
class CardTextFormatter extends TextInputFormatter with InputFormatterBase {
  final String mask;
  final String separator;

  CardTextFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) {
          return oldValue;
        }
        if (newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }

  @override
  String convertValue(String value) {
    if (value.isNotEmpty) {
      var lsValue = value.split('');
      var lsMask = mask.split('');
      for (int i = 0; i < lsMask.length; i++) {
        if (lsValue.length > i) {
          if (mask[i] == separator) {
            lsValue.insert(i, separator);
          }
        }
      }
      return lsValue.getRange(0, lsValue.length > lsMask.length ? lsMask.length : lsValue.length).join('');
    }
    return value;
  }

  @override
  String revertValue(String value) {
    var valueNumber = value.replaceAll(separator, '');
    return valueNumber;
  }

  @override
  num toNum(String value) {
    try {
      return num.parse(value);
    } catch (e) {
      // TODO
      return 0;
    }
  }
}
