import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavoutite = state.contains(meal);

    if (mealIsFavoutite) {
      state = state.where((m) => m.id != meal.id).toList();
    }
    else{
      state = [...state, meal];
    }

    
  }

}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});

