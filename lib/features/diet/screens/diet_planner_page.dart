import 'package:flutter/material.dart';
import 'package:healthflow/common_widgets/app_bar.dart';
import 'package:healthflow/utils/constants.dart';
import '../../../data/models/meal_model.dart';
import '../../../data/models/meal_plan_model.dart';
import '../../../data/sample_data.dart';
import 'add_diet_plan_page.dart';
import 'diet_plan_details_page.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({super.key});

  @override
  State<MealPlannerPage> createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  List<MealPlan> mealPlans = [...defaultMealPlans];

  String _macroSummary(List<MealModel> meals) {
    final totalCalories = meals.fold(0, (sum, m) => sum + m.calories);
    final totalProtein = meals.fold(0, (sum, m) => sum + m.protein);
    final totalFat = meals.fold(0, (sum, m) => sum + m.fat);

    return "$totalCalories kcal • ${totalProtein}g protein • ${totalFat}g fat";
  }

  void _addNewPlan(MealPlan plan) {
    setState(() => mealPlans.add(plan));
  }

  void _openPlan(int index) async {
    final updatedPlan = await Navigator.push<MealPlan>(
      context,
      MaterialPageRoute(
        builder: (_) => MealPlanDetailsPage(plan: mealPlans[index]),
      ),
    );

    if (updatedPlan != null) {
      setState(() {
        mealPlans[index] = updatedPlan;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Diet Planner"),
      body: ListView.builder(
        itemCount: mealPlans.length,
        itemBuilder: (context, index) {
          final plan = mealPlans[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: ConstColor.secondaryColor,
              child: ListTile(
                title: Text(plan.name),
                subtitle: Text("${_macroSummary(plan.meals)} kcal"),
                onTap: () => _openPlan(index),
              ),
            ),
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
              builder: (_) => AddMealPlanPage(onCreate: _addNewPlan),
            ),
          );
        },
      ),
    );
  }
}
