import 'package:flutter/material.dart';
import 'package:vigo/model/customwidget.dart';
import 'package:vigo/model/decorations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomWidget().appbar(context: context),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: Decor().textform(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
