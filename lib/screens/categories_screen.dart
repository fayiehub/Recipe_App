import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipedatamodel.dart';
import 'package:recipe_app/screens/recipedetail.dart';
import 'package:recipe_app/widgets/mainwidgets.dart';
import 'package:favorite_button/favorite_button.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      buildTextTitleVariation1("Choose your preferred meal"),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: recipesData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Detail(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [kBoxShadow],
                ),
                margin: EdgeInsets.only(
                  right: 16,
                  left: index == 0 ? 16 : 0,
                  bottom: 16,
                  top: 8,
                ),
                padding: EdgeInsets.all(16),
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: recipesData[index].image,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(recipesData[index].image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildRecipeTitle(recipesData[index].title),
                    buildTextSubTitleVariation2(recipesData[index].description),
                    FavoriteButton(
                      isFavorite: false,
                      iconSize: 1.0,
                      valueChanged: (_isFavourite) {
                        print('Is Favourite $_isFavourite)');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]));
  }
}
