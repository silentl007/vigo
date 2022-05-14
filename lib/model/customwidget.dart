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
      bool? useButtonColor = false,
      String? buttonText,
      Color? textColor,
      Color? buttonColor,
      Color? bordercolor}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
          height: Sizes.h50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: bordercolor ?? Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(Sizes.w15)),
              boxShadow: [BoxShadow(color: buttonColor!)],
              gradient: useButtonColor == false
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                          Color.fromRGBO(31, 241, 227, 0.5),
                          Color.fromRGBO(129, 53, 249, 0.8),
                        ])
                  : null),
          child: Center(
            child: Text(
              buttonText ?? 'Proceed',
              style: Decor()
                  .textStyle(size: Sizes.w20, color: textColor ?? Colors.white),
            ),
          )),
    );
  }

  loadingDiag(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double w20 = size * .04728;
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: Colors.white.withOpacity(.2),
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: UserColors.purple),
              borderRadius: BorderRadius.all(Radius.circular(w20))),
          content: const LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(UserColors.purple),
          ),
        ),
      ),
    );
  }

  waitDiagfeedback(String info, BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context);
      CustomWidget().messageDiag(context, info);
    });
  }

  messageDiag(BuildContext context, String info) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: UserColors.purple),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              scrollable: true,
              content: Center(
                child: Text(
                  info,
                  textAlign: TextAlign.center,
                  style: Decor().textStyle(),
                ),
              ),
            ));
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
