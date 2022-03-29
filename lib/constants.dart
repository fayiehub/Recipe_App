import 'package:flutter/material.dart';

class Recipe {
  late String title;
  late String description;
  late String image;

  Recipe(this.title, this.description, this.image);
}

List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe("Fried Chicken", "So irresistibly delicious",
        "assets/images/fried_chicken.jpeg"),
    Recipe("Fried rice", "True Italian classic with a meaty, chilli sauce",
        "assets/images/fried_rice.jpeg"),
    Recipe("Vegetable salad", "Crispy Garlic Roasted Potatoes",
        "assets/images/vegetable_salad.jpeg"),
    Recipe("Chapati", "White Onion, Fennel, and watercress Salad",
        "assets/images/chapati.jpg"),
    Recipe("Ugali", "Bacon-Wrapped Filet Mignon", "assets/images/ugali.jpg"),
    Recipe("Strawberry Smoothie", "Bacon-Wrapped Filet Mignon",
        "assets/images/strawberry_smoothie.jpeg"),
    Recipe("Fresh fruit juice", "Bacon-Wrapped Filet Mignon",
        "assets/images/fresh_fruit_juice.jpg"),
    Recipe("Coffee latte", "Bacon-Wrapped Filet Mignon",
        "assets/images/coffe_latte.jpg"),
    Recipe("African tea", "Bacon-Wrapped Filet Mignon",
        "assets/images/african_tea.jpg"),
    Recipe("Banana smoothie", "Bacon-Wrapped Filet Mignon",
        "assets/images/banana_smoothie.jpg"),
  ];
}

class Special {
  late String title;
  late String description;
  late String image;

  Special(this.title, this.description, this.image);
}

Special getSpecials() {
  return Special("title", "description", "image");
}

Color kPrimaryColor = Color(0xFF27AE60);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);
