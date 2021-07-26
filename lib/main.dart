// @dart=2.9

import 'package:flutter/material.dart';
import 'FirstPage.dart';
import 'AlreadyRegistered.dart';
import 'FormFillup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    alreadyregistered.tag:(context) => alreadyregistered(),
    FirstPage.tag:(context) => FirstPage(),
    Agreement.tag:(context) => Agreement(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Page",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Nunito'
      ),
      home: FirstPage(),
      routes: routes,
    );
  }
}
