// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/recipedatamodel.dart';
import '../widgets/mainwidgets.dart';
import 'recipedetail.dart';

class myfavorites extends StatefulWidget {
  const myfavorites({Key? key}) : super(key: key);

  @override
  State<myfavorites> createState() => _favoritesState();
}

class _favoritesState extends State<myfavorites> {
  final favoriteRecipeData =
      recipesData.where((meal) => meal.favorite == true).toList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        buildTextTitleVariation1("My Favorites"),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: favoriteRecipeData.length,
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
                    color: Color.fromARGB(255, 243, 218, 195),
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
                          tag: favoriteRecipeData[index].image,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage(favoriteRecipeData[index].image),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      buildRecipeTitle(favoriteRecipeData[index].title),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }

  // void pushFavorites() => Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (BuildContext context) {
  //       final List<Recipe> favoriteRecipeData =
  //           recipesData.where((meal) => meal.favorite == true).toList();
  //     }));
}
