import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';
import '../screens/tabs_screen.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  Widget listTile(String title,IconData icon, Function() tapHandler) {
     return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking up',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        listTile(
          'Categories',
          Icons.category,
          () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);

          },
        ),
        listTile(
          'Filters',
          Icons.tune,
          () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);

          },
        ),
      ]),
    );
  }
}
