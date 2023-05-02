import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/categories-meals', arguments: {
      'title': title,
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        //margin: EdgeInsets.all(7),
        color: color,
        // ignore: sort_child_properties_last
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
        shadowColor: color.withOpacity(0.9),
        elevation: 5,
      ),
    );
  }
}
