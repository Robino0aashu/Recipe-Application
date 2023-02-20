import 'package:flutter/material.dart';
import '../widgets/fav_wid.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  static const routeName='/favourite';
  List<Meal> favMeal;
  FavouritesScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {
    if(favMeal.isEmpty){
      return NoFavourites();
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeal[index].id,
            title: favMeal[index].title,
            imageUrl: favMeal[index].imageUrl,
            duration: favMeal[index].duration,
            complexity: favMeal[index].complexity,
            affordability: favMeal[index].affordability,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}
