import 'package:flutter/material.dart';
import 'package:healthflow/common_widgets/app_bar.dart';
import 'package:healthflow/features/workout/widgets/exercise_card.dart';

import '../../../data/models/exercise_model.dart';

class ExercisesPage extends StatefulWidget {
  final String title;
  final List<ExerciseModel> exercisesList;

  const ExercisesPage(
      {super.key, required this.title, required this.exercisesList});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

 class _ExercisesPageState extends State<ExercisesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, widget.title),
        body: ListView.builder(
            itemCount: widget.exercisesList.length,
            itemBuilder: (context, _) =>
                exerciseCard(context, widget.exercisesList[_])));
  }
}
