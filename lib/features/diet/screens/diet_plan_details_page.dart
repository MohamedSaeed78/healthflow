import 'package:flutter/material.dart';
import '../../../data/models/meal_model.dart';
import '../../../data/models/meal_plan_model.dart';
import '../../../data/sample_data.dart';
import '../../../utils/constants.dart';
import '../widgets/meal_card.dart';
import 'add_meal_page.dart';

class MealPlanDetailsPage extends StatefulWidget {
  final MealPlan plan;

  const MealPlanDetailsPage({super.key, required this.plan});

  @override
  State<MealPlanDetailsPage> createState() => _MealPlanDetailsPageState();
}

class _MealPlanDetailsPageState extends State<MealPlanDetailsPage> {
  late List<MealModel> meals;

  @override
  void initState() {
    super.initState();
    meals = List.from(widget.plan.meals);
  }

  void _addMeal(MealModel meal) {
    setState(() => meals.add(meal));
  }

  void _removeMeal(int index) {
    setState(() => meals.removeAt(index));
  }

  void _saveAndExit() {
    final updated = MealPlan(name: widget.plan.name, meals: meals);
    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plan.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _saveAndExit,
        ),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (_, index) {
          final meal = meals[index];
          return MealCard(
            meal: meal,
            onRemove: () => _removeMeal(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColor.primaryColor,
        child: Icon(
          Icons.add,
          color: ConstColor.secondaryColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddMealPage(
                allMeals: allMeals,
                onMealSelected: _addMeal,
              ),
            ),
          );
        },
      ),
    );
  }
}
