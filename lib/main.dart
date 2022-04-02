import 'package:flutter/material.dart';
import 'package:recipe_app/pages/dashboard.dart';

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
