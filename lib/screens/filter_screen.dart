import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentfilters;
  FilterScreen(this.currentfilters, this.saveFilters);

  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenfree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosefree = false;

  @override
  initState(){
    _glutenfree=widget.currentfilters['gluten']!;
    _lactosefree=widget.currentfilters['lactose']!;
    _vegan=widget.currentfilters['vegan']!;
    _vegetarian=widget.currentfilters['vegetarian']!;
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filtered Meals'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };

                widget.saveFilters(selectedFilter);
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  subtitle: Text('Shows gluten free meals only'),
                  value: _glutenfree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Shows vegan meals only'),
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('Shows vegetarian meals only'),
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-Free'),
                  subtitle: Text('Shows lactose free meals only'),
                  value: _lactosefree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
