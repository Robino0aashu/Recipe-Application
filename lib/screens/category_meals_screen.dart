import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_decider/provider/filters_provider.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends ConsumerStatefulWidget {
  // List<Meal> availableMeals;
  // CategoryMealScreen(
  //   this.availableMeals,
  // );

  @override
  ConsumerState<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends ConsumerState<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final availableMeals=ref.watch(filteredMealsProvider);
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title']!;

      displayedMeals = availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      )
    );
  }
}
