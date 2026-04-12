import 'package:flutter/material.dart';

import '../../../data/models/exercise_model.dart';
import '../../../utils/constants.dart';
import '../screens/exercise_details_page.dart';

Widget exerciseCard(BuildContext context, ExerciseModel exercise) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  exerciseDetailsPage(context, exercise, exercise.name)));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: ConstColor.secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${exercise.name} > ${exercise.level}",
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Alex',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Center(
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      exerciseImageAsset + exercise.images[1],
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      height: 180,
                    )))
          ],
        ),
      ),
    ),
  );
}
