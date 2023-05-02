import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';

import '../widgets/drawer.dart';

class FilterScreen extends ConsumerWidget {
  static const routeName='/filterScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters=ref.watch(filtersProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filtered Meals'),
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten-Free'),
                  subtitle: const Text('Shows gluten free meals only'),
                  value: activeFilters[Filter.gluten],
                  onChanged: (newValue) {
                    ref.read(filtersProvider.notifier).setFilter(Filter.gluten, newValue);
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  subtitle: const Text('Shows vegan meals only'),
                  value: activeFilters[Filter.vegan],
                  onChanged: (newValue) {
                    ref.read(filtersProvider.notifier).setFilter(Filter.vegan, newValue);
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Shows vegetarian meals only'),
                  value: activeFilters[Filter.vegetarian],
                  onChanged: (newValue) {
                    ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, newValue);
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-Free'),
                  subtitle: const Text('Shows lactose free meals only'),
                  value: activeFilters[Filter.lactose],
                  onChanged: (newValue) {
                    ref.read(filtersProvider.notifier).setFilter(Filter.lactose, newValue);
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
