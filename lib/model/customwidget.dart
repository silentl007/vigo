import 'package:flutter/material.dart';
import 'package:vigo/model/assets.dart';
import 'package:vigo/model/decorations.dart';
import 'package:vigo/model/sizemodel.dart';

class CustomWidget {
  appbar({required BuildContext context, Widget? titleWidget}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        AssetsPath.vigologo,
        width: Sizes.w100,
      ),
      centerTitle: true,
    );
  }

  Widget buttons(
      {required BuildContext context,
      required Function function,
      String? buttonText,
      Color? textColor,
      Color? buttonColor,
      Color? bordercolor}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SizedBox(
      height: Sizes.h50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: buttonColor ?? UserColors.purple,
              side: BorderSide(
                color: bordercolor ?? UserColors.purple,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w15)))),
          onPressed: () {
            function();
          },
          child: Text(
            buttonText ?? 'Proceed',
            style: Decor()
                .textStyle(size: Sizes.w20, color: textColor ?? Colors.white),
          )),
    );
  }
}

customDivider({double? height}) {
  return Divider(
    height: height ?? 1,
  );
}
