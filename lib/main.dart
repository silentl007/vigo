import 'package:flutter/material.dart';
import 'package:vigo/home/home.dart';
import 'package:vigo/model/decorations.dart';

void main() {
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
