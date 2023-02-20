import 'package:flutter/material.dart';

class NoFavourites extends StatelessWidget {
  const NoFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '💔',
            style: TextStyle(
              fontSize: 100,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'No Favourites yet...',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Click on the "Star Icon" below the meals to add them to favourites.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
