import 'package:flutter/material.dart';
import 'package:playground/component/image.dart';
import 'dart:convert' as j;

extension borderRadius on BorderRadius {
  Map<String, dynamic> toJson() {
    return {
      "topLeft": topLeft.x,
      "topRight": topLeft.x,
      "bottomLeft": topLeft.x,
      "bottomRight": topLeft.x,
    };
  }

  BorderRadius? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    var bottomRight = json["bottomRight"] ?? 0;
    var bottomLeft = json["bottomLeft"] ?? 0;
    var topLeft = json["topLeft"] ?? 0;
    var topRight = json["topRight"] ?? 0;

    return BorderRadius.zero.copyWith(
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
    );
  }
}

extension border on Border {
  Map<String, dynamic> toJson() {
    return {
      "color": "0x${bottom.color.value.toRadixString(16).padLeft(8, '0')}",
      "top": top.width,
      "right": right.width,
      "left": left.width,
      "bottom": bottom.width,
    };
  }

  Border? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    var bottom = json["bottom"] ?? 0;
    var top = json["top"] ?? 0;
    var left = json["left"] ?? 0;
    var right = json["right"] ?? 0;
    var color = json["color"] ?? "0x00000000";
    var _color = Color(int.parse(color));
    var border = Border(
      top: BorderSide(
        color: _color,
        width: top,
      ),
      bottom: BorderSide(
        color: _color,
        width: bottom,
      ),
      left: BorderSide(
        color: _color,
        width: left,
      ),
      right: BorderSide(
        color: _color,
        width: right,
      ),
    );

    return border;
  }
}

extension fit on BoxFit {
  BoxFit? fromJson(String? fit) {
    var ls = BoxFit.values.where((e) => e.name == fit);
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension imageType on ImageType {
  ImageType? fromJson(String? type) {
    var ls = ImageType.values.where((e) => e.name == type);
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension axis on Axis {
  Axis fromJson(String? ax) {
    var ls = Axis.values.where((e) => e.name == ax);
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return Axis.vertical;
  }
}

extension edgeInsets on EdgeInsets {
  Map<String, dynamic> toJson() {
    return {
      "left": left,
      "right": right,
      "top": top,
      "bottom": bottom,
    };
  }

  EdgeInsets? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    var left = json["left"] ?? 0;
    var right = json["right"] ?? 0;
    var top = json["top"] ?? 0;
    var bottom = json["bottom"] ?? 0;

    return EdgeInsets.zero.copyWith(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
    );
  }
}

extension alignment on Alignment {
  Map<String, dynamic> toJson() {
    return {
      "x": x,
      "y": y,
    };
  }

  Alignment? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    var x = json["x"];
    var y = json["y"];
    if (x != null && y != null) {
      return Alignment(x, y);
    }
    return null;
  }
}

extension offsett on Offset {
  Map<String, dynamic> toJson() {
    return {
      "dx": dx,
      "dy": dy,
    };
  }

  Offset? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    var dx = json["dx"];
    var dy = json["dy"];
    if (dx != null && dy != null) {
      return Offset(dx, dy);
    }
    return null;
  }
}

extension boxShadow on BoxShadow {
  Map<String, dynamic> toJson() {
    return {
      "color": "0x${color.value.toRadixString(16).padLeft(8, '0')}",
      "offset": offset.toJson(),
      "blurRadius": blurRadius,
      "spreadRadius": spreadRadius,
      "blurStyle": blurStyle.name,
    };
  }

  BoxShadow? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    var color = json["color"] ?? "0x00000000";
    var offset = Offset.zero.fromJson(json["offset"]);
    var blurRadius = json["blurRadius"] ?? 0.0;
    var spreadRadius = json["spreadRadius"] ?? 0.0;
    var blurStyle = json["blurStyle"] ?? 0.0;
    return BoxShadow(
      color: Color(int.parse(color)),
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      blurStyle: blurStyle,
      offset: offset ?? Offset.zero,
    );
  }
}

extension fontWeight on FontWeight {
  FontWeight? fromJson(int? value) {
    var ls = FontWeight.values.where((element) => element.value == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension fontStyle on FontStyle {
  FontStyle? fromJson(String? value) {
    var ls = FontStyle.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension textAlign on TextAlign {
  TextAlign? fromJson(String? value) {
    var ls = TextAlign.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension textOverflow on TextOverflow {
  TextOverflow? fromJson(String? value) {
    var ls = TextOverflow.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension mainAxisAlignment on MainAxisAlignment {
  MainAxisAlignment? fromJson(String? value) {
    var ls = MainAxisAlignment.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension mainAxisSize on MainAxisSize {
  MainAxisSize? fromJson(String? value) {
    var ls = MainAxisSize.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension crossAxisAlignment on CrossAxisAlignment {
  CrossAxisAlignment? fromJson(String? value) {
    var ls = CrossAxisAlignment.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension boxShape on BoxShape {
  BoxShape fromJson(String? value) {
    var ls = BoxShape.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return BoxShape.rectangle;
  }
}

extension autovalidateMode on AutovalidateMode {
  AutovalidateMode? fromJson(String? value) {
    var ls = AutovalidateMode.values.where((element) => element.name == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}

extension textInputType on TextInputType {
  TextInputType? fromJson(int? value) {
    var ls = TextInputType.values.where((element) => element.index == value).toList();
    if (ls.isNotEmpty) {
      return ls.first;
    }
    return null;
  }
}
