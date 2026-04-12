import 'package:flutter/material.dart';
import 'package:healthflow/common_widgets/app_bar.dart';
import 'package:healthflow/data/sample_data.dart';
import 'package:healthflow/features/home/home.dart';
import 'package:healthflow/features/workout/screens/exercises_page.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Training"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExercisesPage(
                            exercisesList: bodyOnlyExercises,
                            title: 'Body only / Home')));
              },
              child:
                  pageCard(context, "Body only / Home ", "assets/img/body.png"),
            )),
            Expanded(child: InkWell(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExercisesPage(
                          exercisesList: otherEquipmentExercises,
                          title: 'GYM')));
            },child: pageCard(context, "GYM", "assets/img/gym.png"))),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
