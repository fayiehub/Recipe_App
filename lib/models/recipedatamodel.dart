import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recipe {
  String title;
  String description;
  String image;
  bool favorite;

  Recipe({
    required this.title,
    required this.description,
    required this.image,
    this.favorite = false,
  });
}

// hard coded recipe data
List<Recipe> recipesData = [
  Recipe(
      title: "Chicken fried",
      description: "So irresistibly delicious",
      image: "assets/images/fried_chicken.jpeg",
      favorite: true),
  Recipe(
      title: "Fried rice",
      description:
          "A dish of cooked rice that has been stir-fried in a frying pan",
      image: "assets/images/fried_rice.jpeg"),
  Recipe(
    title: "Vegetable salad",
    description:
        "A mixture of raw or cold foods such as lettuce, cucumber, and tomatoes.",
    image: "assets/images/vegetable_salad.jpeg",
  ),
  Recipe(
      title: "Chapati",
      description:
          "A beautiful unleavened flat Bread with  a delicious but subtle flavor",
      image: "assets/images/chapati.jpg",
      favorite: true),
  Recipe(
      title: "Ugali",
      description: "A type of stiff maize flour porridge",
      image: "assets/images/ugali.jpg",
      favorite: true),
  Recipe(
      title: "Strawberry Smoothie",
      description:
          "Light and creamy, with just the right icy and airy texture.",
      image: "assets/images/strawberry_smoothie.jpeg"),
  Recipe(
      title: "Fresh fruit juice",
      description:
          "100% pure juice made from the flesh of fresh fruit or from whole fruit",
      image: "assets/images/fresh_fruit_juice.jpg"),
  Recipe(
      title: "Coffee latte",
      description:
          "A caffè latte is simply a shot or two of bold, tasty espresso with fresh, sweet steamed milk over it.",
      image: "assets/images/coffe_latte.jpg"),
  Recipe(
      title: "African tea",
      description: "Tea is the worlds most socially shared drink",
      image: "assets/images/african_tea.jpg"),
  Recipe(
    title: "Banana smoothie",
    description: "Banana smoothie is extra creamy and fruity",
    image: "assets/images/banana_smoothie.jpg",
  ),
];
