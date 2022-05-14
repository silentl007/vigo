import 'package:flutter/material.dart';
import 'package:vigo/model/assets.dart';
import 'package:vigo/model/decorations.dart';
import 'package:vigo/model/sizemodel.dart';

class CustomWidget {
  appbar(
      {required BuildContext context,
      Widget? titleWidget,
      bool? dash = false}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return AppBar(
      backgroundColor: Colors.white,
      leading: null,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: dash!
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AssetsPath.vigologo,
                  width: Sizes.w100,
                ),
                Image.asset(
                  AssetsPath.wallet,
                  width: Sizes.w25,
                )
              ],
            )
          : Image.asset(
              AssetsPath.vigologo,
              width: Sizes.w100,
            ),
      centerTitle: dash ? false : true,
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
    color: Colors.transparent,
  );
}

customhorizontal({double? width}) {
  return VerticalDivider(
    width: width ?? 1,
  );
}
