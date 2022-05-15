import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vigo/home/home.dart';
import 'package:vigo/model/decorations.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Okpongu',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: UserColors.purple,
            ),
      ),
      home: const Home(),
    );
  }
}
