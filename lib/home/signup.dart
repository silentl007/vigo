// ignore_for_file: prefer_is_empty

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vigo/model/assets.dart';
import 'package:vigo/model/customwidget.dart';
import 'package:vigo/model/decorations.dart';
import 'package:vigo/model/sizemodel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  bool obscure = true;
  IconData visible = Icons.visibility_off;
  bool obscure1 = true;
  IconData visible1 = Icons.visibility_off;
  TextEditingController namecontrol = TextEditingController();
  TextEditingController usernamecontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController datecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController passwordcontrol1 = TextEditingController();
  bool acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomWidget().appbar(context: context),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h10, left: Sizes.w15, right: Sizes.w15),
              child: Column(
                children: [
                  Text(
                    'Sign up to gain access',
                    textAlign: TextAlign.center,
                    style: Decor().textStyle(
                        fontweight: FontWeight.bold,
                        size: Sizes.w20,
                        color: UserColors.purple),
                  ),
                  customDivider(height: Sizes.h20),
                  TextFormField(
                    controller: namecontrol,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().textform(
                        hint: 'Name',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetsPath.user,
                            ),
                          ),
                        )),
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return 'Please input your name';
                      }
                      return null;
                    },
                  ),
                  customDivider(height: Sizes.h20),
                  TextFormField(
                    controller: usernamecontrol,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().textform(
                        hint: 'Username',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetsPath.at,
                            ),
                          ),
                        )),
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return 'Please input your username';
                      }
                      return null;
                    },
                  ),
                  customDivider(height: Sizes.h20),
                  TextFormField(
                    controller: emailcontrol,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().textform(
                        hint: 'Email address',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetsPath.email,
                            ),
                          ),
                        )),
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return 'Please input your email address';
                      }
                      return null;
                    },
                  ),
                  customDivider(height: Sizes.h20),
                  TextFormField(
                    controller: datecontrol,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().textform(
                        hint: 'July 13, 2022',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetsPath.calender,
                            ),
                          ),
                        )),
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return 'Please input your date of birth';
                      }
                      return null;
                    },
                  ),
                  customDivider(height: Sizes.h20),
                  TextFormField(
                    obscureText: obscure,
                    controller: passwordcontrol,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().textform(
                        hint: 'Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetsPath.password,
                            ),
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: passfunc, icon: Icon(visible))),
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return 'Please input your password';
                      }
                      return null;
                    },
                  ),
                  customDivider(height: Sizes.h20),
                  TextFormField(
                    obscureText: obscure1,
                    controller: passwordcontrol1,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().textform(
                        hint: 'Confirm Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetsPath.password,
                            ),
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: passfunc1, icon: Icon(visible1))),
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return 'Please input your confirm password';
                      } else if (value != passwordcontrol.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  customDivider(height: Sizes.h20),
                  Row(children: [
                    FittedBox(
                      child: Checkbox(
                          activeColor: UserColors.purple,
                          value: acceptTerms,
                          onChanged: (value) {
                            setState(() {
                              acceptTerms = value!;
                            });
                          }),
                    ),
                    RichText(
                      overflow: TextOverflow.fade,
                      text: TextSpan(
                          style: Decor().textStyle(
                            color: Colors.black,
                            size: Sizes.w13,
                          ),
                          text: 'I agree to the ',
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'Terms & Conditions ',
                                style: Decor().textStyle(
                                    color: UserColors.purple,
                                    size: Sizes.w13,
                                    fontweight: FontWeight.bold)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'and ',
                                style: Decor().textStyle(
                                    size: Sizes.w13,
                                    fontweight: FontWeight.normal)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'and Privacy Policy ',
                                style: Decor().textStyle(
                                    color: UserColors.purple,
                                    size: Sizes.w13,
                                    fontweight: FontWeight.bold))
                          ]),
                    ),
                  ]),
                  customDivider(height: Sizes.h20),
                  CustomWidget().buttons(
                      context: context,
                      function: signup,
                      buttonText: 'Sign up',
                      buttonColor: UserColors.purple),
                  customDivider(height: Sizes.h80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account yet? ',
                        style: Decor().textStyle(
                            fontweight: FontWeight.normal, size: Sizes.w18),
                      ),
                      Text(
                        'Sign up',
                        style: Decor().textStyle(
                            fontweight: FontWeight.bold,
                            color: UserColors.purple,
                            size: Sizes.w18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  passfunc() {
    if (obscure) {
      setState(() {
        obscure = false;
        visible = Icons.visibility;
      });
    } else {
      setState(() {
        obscure = true;
        visible = Icons.visibility_off;
      });
    }
  }

  passfunc1() {
    if (obscure1) {
      setState(() {
        obscure1 = false;
        visible1 = Icons.visibility;
      });
    } else {
      setState(() {
        obscure1 = true;
        visible1 = Icons.visibility_off;
      });
    }
  }

  signup() {
    var form = _formkey.currentState;
    if (form!.validate()) {}
  }
}
