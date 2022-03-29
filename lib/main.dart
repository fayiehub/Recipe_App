import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_app/pages/dashboard.dart';
import 'package:recipe_app/pages/forgotpassword.dart';
import 'package:recipe_app/pages/login.dart';
import 'package:recipe_app/pages/registration.dart';
import 'package:recipe_app/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chakula",
      home: Dashboard(),
    );
  }
}
