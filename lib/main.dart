import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import './models/meals.dart';

import './screens/meal_detail.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories.dart';
import './screens/filter_screen.dart';

void main() => runApp(const ProviderScope(
      child: MyApp(),
    ));

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  List<Meal> favouriteMeals = [];

  final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color.fromARGB(255, 131, 57, 0),
      ),
      textTheme: GoogleFonts.latoTextTheme());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme,
      home: TabsScreen(),
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        '/categories-meals': (ctx) => CategoryMealScreen(),
        MealDetails.routeName: (ctx) => MealDetails(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
      onGenerateRoute: (settings) {
        //print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
