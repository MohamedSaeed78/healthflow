import 'package:flutter/material.dart';
import 'package:healthflow/common_widgets/app_bar.dart';
import 'package:healthflow/features/workout/screens/plan_details_page.dart';

import '../../../data/models/workout_plan_model.dart';
import '../../../data/sample_data.dart';
import '../../../utils/constants.dart';
import 'add_plan_page.dart';

class WorkoutPlannerPage extends StatefulWidget {
  const WorkoutPlannerPage({super.key});

  @override
  State<WorkoutPlannerPage> createState() => _WorkoutPlannerPageState();
}

class _WorkoutPlannerPageState extends State<WorkoutPlannerPage> {
  List<WorkoutPlan> workoutPlans = [
    ...defaultWorkoutPlans
  ]; // can be state managed later

  void addNewPlan(WorkoutPlan plan) {
    setState(() {
      workoutPlans.add(plan);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Workout Planner"),
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
              builder: (_) => AddPlanPage(onCreate: addNewPlan),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: workoutPlans.length,
        itemBuilder: (context, index) {
          final plan = workoutPlans[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: ConstColor.secondaryColor,
              child: ListTile(
                title: Text(plan.name),
                subtitle: Text("${plan.exercises.length} exercises"),
                onTap: () async {
                  final updatedPlan = await Navigator.push<WorkoutPlan>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanDetailsPage(plan: plan),
                    ),
                  );
                  if (updatedPlan != null) {
                    setState(() {
                      workoutPlans[index] = updatedPlan;
                    });
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
