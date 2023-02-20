import 'package:flutter/material.dart';

import './categories.dart';
import './favourites_screen.dart';
import '../widgets/drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  static const routeName='/tabsScreen';
  List<Meal> favMeal;
  TabsScreen(this.favMeal);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  
  late List<Widget> _pages;
  int _selectedPageIndex=0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  void initState() {
    _pages=[
     CategoriesScreen(),
     FavouritesScreen(widget.favMeal),
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: DrawerWidget(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourites')
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}



/* for Top navigation bar

 return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(
                Icons.star,
              ),
              text: 'Favourites',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavouritesScreen(),
        ]),
      ),
    );

    */