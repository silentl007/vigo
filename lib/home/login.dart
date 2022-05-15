import 'package:flutter/material.dart';
import 'package:vigo/authentication/authcalls.dart';
import 'package:vigo/home/dashboard.dart';
import 'package:vigo/home/signup.dart';
import 'package:vigo/model/assets.dart';
import 'package:vigo/model/customwidget.dart';
import 'package:vigo/model/decorations.dart';
import 'package:vigo/model/sizemodel.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  bool obscure = true;
  IconData visible = Icons.visibility_off;
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  UserLogin userLogin = UserLogin();
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomWidget().appbar(context: context),
        body: Stack(
          children: [
            Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Sizes.h10, left: Sizes.w15, right: Sizes.w15),
                  child: Column(
                    children: [
                      Text(
                        'Login to continue',
                        textAlign: TextAlign.center,
                        style: Decor().textStyle(
                            fontweight: FontWeight.bold,
                            size: Sizes.w20,
                            color: UserColors.purple),
                      ),
                      customDivider(height: Sizes.h20),
                      TextFormField(
                        controller: emailcontrol,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: Decor().textform(
                            hint: 'Username or email address',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(13.0),
                              child: ImageIcon(
                                AssetImage(
                                  AssetsPath.user,
                                ),
                              ),
                            )),
                        validator: (value) {
                          // ignore: prefer_is_empty
                          if (value!.isEmpty || value.trim().length == 0) {
                            return 'Please input your username or email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          userLogin.username = value;
                        },
                      ),
                      customDivider(height: Sizes.h20),
                      TextFormField(
                        obscureText: obscure,
                        controller: passwordcontrol,
                        onEditingComplete: () => node.unfocus(),
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
                            suffixIcon: GestureDetector(
                                onTap: passfunc, child: Icon(visible))),
                        validator: (value) {
                          // ignore: prefer_is_empty
                          if (value!.isEmpty || value.trim().length == 0) {
                            return 'Please input your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          userLogin.password = value;
                        },
                      ),
                      customDivider(height: Sizes.h20),
                      CustomWidget().buttons(
                          context: context,
                          function: login,
                          buttonText: 'Login',
                          buttonColor: UserColors.purple),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.h20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
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
                ),
              ),
            )
          ],
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

  login() {
    var form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      waitDiag();
    }
  }

  waitDiag() {
    return showDialog(
        context: context,
        builder: (context) => FutureBuilder(
            future: userLogin.login(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CustomWidget().loadingDiag(context);
              } else if (snapshot.data == 200) {
                todashboard();
                return Container();
              } else {
                return Container();
              }
            }));
  }

  todashboard() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dashboard()));
    });
  }
}
