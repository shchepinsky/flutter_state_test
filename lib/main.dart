import 'package:flutter/material.dart';
import 'package:flutter_state_test/pages/HomePage.dart';
import 'package:flutter_state_test/pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(title: 'Flutter Demo Home Page'),
      home: LoginPage(),
    );
  }
}
