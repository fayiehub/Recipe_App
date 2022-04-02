import 'package:flutter/material.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/favorite_screen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController controller = ScrollController();

  int selectedIndex = 0;
  // bottom navigation bar icons details
  List<BottomNavigationBarItem> bottomMenus = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
  ];
  //list of screens on bottom navigation bar
  List selectedPage = [
    Categories(),
    myfavorites(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          //title: Text(selectedPage[selectedIndex]['']),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ]),
      body: selectedPage[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: bottomMenus,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() => selectedIndex = index);
          }),
    );
  }
}
