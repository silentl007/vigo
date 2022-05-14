import 'package:flutter/material.dart';

class Decor {
  textStyle({
    double? size,
    Color? color,
    FontWeight? fontweight,
    double? sHeight,
  }) {
    return TextStyle(
      fontSize: size,
      height: sHeight,
      color: color,
      fontWeight: fontweight,
    );
  }


textform (){
  return InputDecoration();
}
}

class UserColors {
  // ignore: use_full_hex_values_for_flutter_colors
  static const purple = Color.fromRGBO(129, 53, 249, 1);
}
