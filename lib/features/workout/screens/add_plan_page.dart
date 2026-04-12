import 'package:flutter/material.dart';
import 'package:healthflow/utils/constants.dart';

import '../../../data/models/workout_plan_model.dart';

class AddPlanPage extends StatefulWidget {
  final Function(WorkoutPlan) onCreate;

  const AddPlanPage({required this.onCreate, super.key});

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  final _controller = TextEditingController();

  void createPlan() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    final newPlan = WorkoutPlan(name: name, exercises: []);
    widget.onCreate(newPlan);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Plan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Plan Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(
                Icons.save,
                color: ConstColor.secondaryColor,
              ),
              label: Text("Save Plan",style: bodyTextStyle,),
              onPressed: createPlan,
            )
          ],
        ),
      ),
    );
  }
}
