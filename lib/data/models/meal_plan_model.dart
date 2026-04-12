import 'meal_model.dart';

class MealPlan {
  final String name;
  final List<MealModel> meals;

  MealPlan({
    required this.name,
    required this.meals,
  });
}
