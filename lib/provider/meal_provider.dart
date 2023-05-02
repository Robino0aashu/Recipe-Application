import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_decider/dummy_data.dart';

final meals_provider=Provider((ref){
  return DUMMY_MEALS;
});