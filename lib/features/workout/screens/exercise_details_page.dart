import 'package:flutter/material.dart';

import '../../../common_widgets/app_bar.dart';
import '../../../data/models/exercise_model.dart';
import '../../../utils/constants.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final ExerciseModel exercise;
  final String title;

  const ExerciseDetailsPage(
      {super.key, required this.exercise, required this.title});

  @override
  Widget build(BuildContext context) {
    return exerciseDetailsPage(context, exercise, title);
  }
}

Scaffold exerciseDetailsPage(
    BuildContext context, ExerciseModel exercise, String title) {
  return Scaffold(
    appBar: customAppBar(context, title),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  exerciseImageAsset + exercise.images[1],
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  height: 250,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Level:",
              style: headingTextStyle,
            ),
            Text(
              exercise.level,
              style: bodyTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Primary Muscle:",
              style: headingTextStyle,
            ),
            Text(
              exercise.primaryMuscles.toString(),
              style: bodyTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Secondary Muscles:",
              style: headingTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(exercise.secondaryMuscles.toString(),style: bodyTextStyle,),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Instruction:",style: headingTextStyle,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildInstructionsScrollable(exercise.instructions),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget buildInstructionsScrollable(List<String> instructions) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: instructions.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          "${index + 1}. ${instructions[index]}",
          style: bodyTextStyle,
        ),
      );
    },
  );
}