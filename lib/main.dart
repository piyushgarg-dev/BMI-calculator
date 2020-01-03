import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff090C22),
          scaffoldBackgroundColor: Color(0xff090C22)),
      home: MainScreen(),
    );
  }
}
