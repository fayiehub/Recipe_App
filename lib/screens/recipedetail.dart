import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/widgets/mainwidgets.dart';
import 'package:recipe_app/models/recipedatamodel.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipesData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
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
                            SizedBox(
                              height: 2,
                            ),
                            buildRecipeTitle(recipesData[index].title),
                            Hero(
                              tag: recipesData[index].image,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(recipesData[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //dummy data
                  buildTextTitleVariation2('Ingredients', false),
                  buildTextSubTitleVariation1("2 cups pecans, divided"),
                  buildTextSubTitleVariation1(
                      "1 tablespoon unsalted butter, melted"),
                  buildTextSubTitleVariation1(
                      "1/4 teaspoon kosher salt, plus more"),
                  buildTextSubTitleVariation1(
                      "3 tablespoons fresh lemon juice"),
                  buildTextSubTitleVariation1("2 tablespoons olive oil"),
                  buildTextSubTitleVariation1("1/2 teaspoon honey"),
                  SizedBox(
                    height: 16,
                  ),
                  buildTextTitleVariation2('Recipe preparation', false),
                  buildTextSubTitleVariation1("STEP 1"),
                  buildTextSubTitleVariation1(
                      "In a medium bowl, mix all the marinade ingredients with some seasoning. Chop the chicken into bite-sized pieces and toss with the marinade. Cover and chill in the fridge for 1 hr or overnight."),
                  buildTextSubTitleVariation1("STEP 2"),
                  buildTextSubTitleVariation1(
                      "In a large, heavy saucepan, heat the oil. Add the onion, garlic, green chilli, ginger and some seasoning. Fry on a medium heat for 10 mins or until soft."),
                  buildTextSubTitleVariation1("STEP 3"),
                  buildTextSubTitleVariation1(
                      "Add the spices with the tomato purée, cook for a further 2 mins until fragrant, then add the stock and marinated chicken. Cook for 15 mins, then add any remaining marinade left in the bowl. Simmer for 5 mins, then sprinkle with the toasted almonds. Serve with rice, naan bread, chutney, coriander and lime wedges, if you like."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
