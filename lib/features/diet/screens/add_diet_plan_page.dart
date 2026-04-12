import 'package:flutter/material.dart';
import 'package:healthflow/common_widgets/app_bar.dart';

import '../../../data/models/meal_plan_model.dart';

class AddMealPlanPage extends StatefulWidget {
  final Function(MealPlan) onCreate;
  const AddMealPlanPage({super.key, required this.onCreate});

  @override
  State<AddMealPlanPage> createState() => _AddMealPlanPageState();
}

class _AddMealPlanPageState extends State<AddMealPlanPage> {
  final controller = TextEditingController();

  void _savePlan() {
    final name = controller.text.trim();
    if (name.isEmpty) return;

    widget.onCreate(MealPlan(name: name, meals: []));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Create Diet Plan"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Plan Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlan,
              icon: const Icon(Icons.check),
              label: const Text("Save Plan"),
            ),
          ],
        ),
      ),
    );
  }
}
