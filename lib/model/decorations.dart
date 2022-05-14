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

  textform({String? hint, Widget? prefixIcon, Widget? suffixIcon}) {
    return InputDecoration(
        focusColor: UserColors.purple,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        fillColor: Colors.grey.withOpacity(.1),
        filled: true,
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(.3))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(.3))));
  }
}

class UserColors {
  // ignore: use_full_hex_values_for_flutter_colors
  static const purple = Color.fromRGBO(129, 53, 249, 1);
}
