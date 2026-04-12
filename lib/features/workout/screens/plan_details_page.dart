import 'package:flutter/material.dart';
import 'package:healthflow/features/workout/widgets/exercise_card.dart';

import '../../../data/models/exercise_model.dart';
import '../../../data/models/workout_plan_model.dart';
import '../../../data/sample_data.dart';
import '../../../utils/constants.dart';
import 'add_exercise_page.dart';

class PlanDetailsPage extends StatefulWidget {
  final WorkoutPlan plan;

  const PlanDetailsPage({super.key, required this.plan});

  @override
  State<PlanDetailsPage> createState() => _PlanDetailsPageState();
}

class _PlanDetailsPageState extends State<PlanDetailsPage> {
  late List<ExerciseModel> exercises;

  @override
  void initState() {
    super.initState();
    exercises = List.from(widget.plan.exercises);
  }

  void addExercise(ExerciseModel exercise) {
    setState(() {
      exercises.add(exercise);
    });
  }

  void removeExercise(int index) {
    setState(() {
      exercises.removeAt(index);
    });
  }

  void _saveAndExit() {
    final updatedPlan = WorkoutPlan(
      name: widget.plan.name,
      exercises: exercises,
    );
    Navigator.pop(context, updatedPlan); // 🔥 pass updated back
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: ConstColor.white,
          shadowColor: ConstColor.secondaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: _saveAndExit,
          ),
          title: Text(widget.plan.name,
              style: TextStyle(
                color: ConstColor.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ))),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final e = exercises[index];
          return Row(
            children: [
              SizedBox(width: 330, child: exerciseCard(context, e)),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => removeExercise(index),
              ),
            ],
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
              builder: (_) => AddExercisePage(
                allExercises: [
                  ...bodyOnlyExercises,
                  ...otherEquipmentExercises
                ],
                onExerciseSelected: (exercise) {
                  setState(() => exercises.add(exercise));
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
