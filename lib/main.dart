import 'package:flutter/material.dart';
import 'package:meal_decider/screens/favourites_screen.dart';

import './dummy_data.dart';
import './models/meals.dart';

import './screens/meal_detail.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories.dart';
import './screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   Map<String, bool> _filters={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
   };

  List<Meal> availableMeals= DUMMY_MEALS;
  List<Meal> favouriteMeals=[];

   void _setFilters(Map<String, bool> setFilters){
    setState(() {
      _filters=setFilters;
      availableMeals=DUMMY_MEALS.where((element){
        if(_filters['gluten']! && !element.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !element.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !element.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
   }

  void _toggleFavourite(String mealID){
    final existingIndex=favouriteMeals.indexWhere((meal) => meal.id==mealID);
    if(existingIndex>=0){
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id==mealID)
        );
      });
    }
  }

  bool _isfavourited(String mealID){
    return favouriteMeals.any((meal) => meal.id==mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255,254,229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20,51,51,1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20,51,51,1)),
          headline6: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        )      ),

      home: TabsScreen(favouriteMeals),
      routes: {
        TabsScreen.routeName:(ctx)=> TabsScreen(favouriteMeals),
        '/categories-meals': (ctx) => CategoryMealScreen(availableMeals),
        MealDetails.routeName:(ctx)=>MealDetails(_toggleFavourite, _isfavourited),
        FilterScreen.routeName:(ctx)=> FilterScreen(_filters,_setFilters),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx)=>const CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=> const CategoriesScreen());
      },
    );
  }
}
