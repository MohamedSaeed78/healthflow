import 'package:flutter/material.dart';
import 'package:healthflow/utils/constants.dart';
import '../../../data/models/meal_model.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;
  final VoidCallback? onRemove;

  const MealCard({super.key, required this.meal, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstColor.secondaryColor,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + Delete Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (onRemove != null)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onRemove,
                  ),
              ],
            ),

            const SizedBox(height: 4),

            /// Serving + Category
            Text(
              "${meal.servingSize} • ${meal.category}",
            ),

            const SizedBox(height: 8),

            /// Nutrition
            Text(
              "${meal.calories} kcal",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "Protein: ${meal.protein}g  •  Carbs: ${meal.carbs}g  •  Fat: ${meal.fat}g",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
