import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/favourites_provider.dart';

import './categories.dart';
import './favourites_screen.dart';
import '../widgets/drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  static const routeName='/tabsScreen';
  // List<Meal> favMeal;
  // TabsScreen(this.favMeal, {super.key});
  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  
  late List<Widget> _pages;
  int _selectedPageIndex=0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMeals=ref.watch(favouriteMealsProvider);
    _pages=[
     const CategoriesScreen(),
     FavouritesScreen(favouriteMeals)];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const DrawerWidget(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
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