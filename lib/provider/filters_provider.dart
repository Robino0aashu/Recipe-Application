import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meals.dart';

import './filters_provider.dart';
import './meal_provider.dart';
enum Filter{
  gluten,
  lactose,
  vegan,
  vegetarian,
}

List<Meal> availableMeals=[];


class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gluten: false,
          Filter.lactose: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });
  
  void setFilter(Filter filter, bool isActive) {
    state={
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> chosenFilters){
    state=chosenFilters;
  }
}


final filtersProvider=StateNotifierProvider<FiltersNotifier, Map>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider= Provider((ref){

  final meals= ref.watch(meals_provider);
  final activeFilters=ref.watch(filtersProvider);

  return meals.where((element) {
      if (activeFilters[Filter.gluten]! && !element.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactose]! && !element.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !element.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
});