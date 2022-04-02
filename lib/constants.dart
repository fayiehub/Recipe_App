import 'package:flutter/material.dart';

class Special {
  late String title;
  late String description;
  late String image;

  Special(this.title, this.description, this.image);
}

Color kPrimaryColor = Color(0xFF27AE60);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);
