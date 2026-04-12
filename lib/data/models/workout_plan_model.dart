import 'exercise_model.dart';

class WorkoutPlan {
  final String name;
  final List<ExerciseModel> exercises;

  WorkoutPlan({
    required this.name,
    required this.exercises,
  });
}
