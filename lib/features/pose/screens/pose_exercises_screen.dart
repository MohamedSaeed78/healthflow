import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar.dart';
import '../utils/exercise.dart';
import 'exercise_selection_screen.dart';

class PoseExercisesScreen extends StatefulWidget {
  const PoseExercisesScreen({super.key});

  @override
  State<PoseExercisesScreen> createState() => _PoseExercisesScreenState();
}

class _PoseExercisesScreenState extends State<PoseExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,'AI Pose Exercise Assistant'),
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: availableExercises.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseSelectionScreen(
                                exercise: availableExercises[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: const Color(0xff49BEB7),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 8, top: 8, bottom: 8),
                            child: CustomListTile(
                              exercise: availableExercises[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
    );
    // );
  }
}

class CustomListTile extends StatelessWidget {
  final ExercisePose exercise;

  const CustomListTile({
    required this.exercise,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      // padding: const EdgeInsets.all(4),
      child: Row(children: [
        Expanded(
          flex: 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(exercise.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                exercise.name,
                style: const TextStyle(
                  fontFamily: 'Alex',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1B2141),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: exercise.targetedMuscles.length,
                itemBuilder: (BuildContext context, int i) {
                  return Text(
                    "- ${exercise.targetedMuscles[i]}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff1B2141),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
