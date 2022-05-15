import 'package:flutter/material.dart';
import 'package:vigo/home/login.dart';
import 'package:vigo/home/signup.dart';
import 'package:vigo/model/assets.dart';
import 'package:vigo/model/customwidget.dart';
import 'package:vigo/model/decorations.dart';
import 'package:vigo/model/sizemodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
          appBar: CustomWidget().appbar(context: context),
          body: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20, left: Sizes.w15, right: Sizes.w15),
            child: Column(
              children: [
                Image.asset(AssetsPath.login, width: double.infinity,height: Sizes.h330,),
                customDivider(height: Sizes.h35),
                Text(
                  'Build Connections. \nBuild wealth',
                  textAlign: TextAlign.center,
                  style: Decor().textStyle(
                      color: UserColors.purple,
                      size: Sizes.w35,
                      fontweight: FontWeight.bold),
                ),
                customDivider(height: Sizes.h35),
                Text(
                    'Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application.',
                    textAlign: TextAlign.center,
                    style: Decor().textStyle(
                        color: Colors.grey,
                        size: Sizes.w20,
                        sHeight: 1.3,
                        fontweight: FontWeight.normal)),
                customDivider(height: Sizes.h35),
                CustomWidget().buttons(
                    context: context,
                    function: loginProceed,
                    buttonText: 'Login',
                    buttonColor: UserColors.purple),
                customDivider(height: Sizes.h15),
                CustomWidget().buttons(
                    context: context,
                    function: signup,
                    useButtonColor: true,
                    bordercolor: UserColors.purple,
                    buttonText: 'Sign up',
                    buttonColor: Colors.white,
                    textColor: UserColors.purple),
              ],
            ),
          )),
    );
  }

  loginProceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Login()));
  }

  signup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUp()));
  }
}
