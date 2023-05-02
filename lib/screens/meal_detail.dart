import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/favourites_provider.dart';
import '../dummy_data.dart';

class MealDetails extends ConsumerWidget {
  static const routeName = './meal-details';

  Widget BuildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget BuildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    final favouriteList = ref.watch(favouriteMealsProvider);
    final isMealFavourite = favouriteList.contains(selectedMeal);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Hero(
                  tag: selectedMeal.id,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BuildSectionTitle(
                context,
                'Ingredients',
              ),
              BuildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              BuildSectionTitle(
                context,
                'Steps',
              ),
              BuildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${index + 1}')),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                    child: child);
              },
              child: Icon(
                isMealFavourite ? Icons.star : Icons.star_border,
                color: isMealFavourite ? Colors.redAccent : Colors.black,
                key: ValueKey(isMealFavourite),
              )),
          onPressed: () {
            ref
                .watch(favouriteMealsProvider.notifier)
                .toggleMealFavouriteStatus(selectedMeal);
          },
        ));
  }
}
