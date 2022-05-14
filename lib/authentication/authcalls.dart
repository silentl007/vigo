import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:vigo/model/customwidget.dart';

class UserLogin {
  String? username;
  String? password;
  login(BuildContext context) async {
    Uri url =
        Uri.parse('https://vigoplace-server.herokuapp.com/api/auth/login');
    Map<String, dynamic> body = {
      'password': password,
      'username': username,
    };
    try {
      var encodeData = jsonEncode(body);
      var send = await http.post(url, body: encodeData, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      var jsonData = jsonDecode(send.body);
      if (send.statusCode == 200) {
        return send.statusCode;
      } else {
        CustomWidget().waitDiagfeedback(jsonData['message'], context);
        return Container();
      }
    } catch (error) {
      CustomWidget().waitDiagfeedback(
          'Warning! An error occurred. Please try again later.', context);
      return Container();
    }
  }
}

class UserRegister {
  String? username;
  String? email;
  String? fullname;
  String? dob;
  String? password;
  register(BuildContext context) async {
    Uri url =
        Uri.parse('https://vigoplace-server.herokuapp.com/api/auth/register');
    Map<String, dynamic> body = {
      'password': password,
      'username': username,
      'email': email,
      'fullname': fullname,
      'dob': dob
    };
    try {
      var encodeData = jsonEncode(body);
      var send = await http.post(url, body: encodeData, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      var jsonData = jsonDecode(send.body);
      if (send.statusCode == 200) {
        return send.statusCode;
      } else {
        CustomWidget().waitDiagfeedback(jsonData['message'], context);
        return Container();
      }
    } catch (error) {
      CustomWidget().waitDiagfeedback(
          'Warning! An error occurred. Please try again later.', context);
      return Container();
    }
  }
}
