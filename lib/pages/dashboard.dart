import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/pages/settings.dart';
import 'package:recipe_app/widgets.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController controller = ScrollController();
  int selectedIndex = 0;
  static const List<Widget> widgetOption = <Widget>[
    Text("Home"),
    Text("Categories"),
    Text("Settings")
  ];

  List<BottomNavigationBarItem> bottomMenus = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.category_rounded), label: 'categories'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Dashboard"),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ]),
      body: Column(
        children: [
          //Text("Hi $fname"),
          // Image(image: NetworkImage("https://assortative-economy.000webhostapp.com/")),
          buildTextTitleVariation1("Choose your preferred meal"),

          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //BoxDecoration
              children: buildRecipes(),
            ),
          ),

          buildTextTitleVariation1("What's new?"),

          Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 200,
              child: Column(
                  //BoxDecoration
                  //children: getSpecials(),
                  )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomMenus,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
      ),
    );
  }

  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildRecipe(getRecipes()[i], i));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => mySettings(),
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
            right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: recipe.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            buildRecipeTitle(recipe.title),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite_border,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget newSpecial(Recipe special) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => mySettings(),
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
          margin: EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
          padding: EdgeInsets.all(8),
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: special.image,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(special.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              buildRecipeTitle(special.title),
              buildTextSubTitleVariation2(special.description),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
