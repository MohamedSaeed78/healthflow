import 'package:flutter/material.dart';
import 'package:healthflow/data/models/profile_model.dart';
import 'package:healthflow/features/chatbot/screen/chat_bot_page.dart';
import 'package:healthflow/features/diet/screens/diet_planner_page.dart';
import 'package:healthflow/features/workout/screens/workout_planner_page.dart';
import 'package:healthflow/utils/firebase_helper.dart';

import '../../common_widgets/bmi_card.dart';
import '../../common_widgets/round_button.dart';
import '../../utils/constants.dart';
import '../auth/presentation/login_page.dart';
import '../pose/screens/pose_exercises_screen.dart';
import '../workout/screens/training_page.dart';

class HomePage extends StatefulWidget {
  final String uid;

  const HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseHelper fireHelper = FirebaseHelper();
  late ProfileModel _currentUser;
  bool _isLoading = true;

  @override
  void initState() {
    _loadProfile();
    super.initState();
  }

  Future<void> _loadProfile() async {
    _currentUser =
        (await fireHelper.getCurrentProfile(widget.uid))!; // force unwrap
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40, bottom: 10),
                child: Text("Welcome Back,",
                    style: TextStyle(
                        color: ConstColor.lightGray, fontFamily: 'Alex')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 40),
                child: Text(
                  _currentUser.name,
                  style: headingTextStyle,
                ),
              ),
              bmiCard(_currentUser.bmi),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 10),
                child: Text(
                  "Fitness",
                  style: headingTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TrainingPage()));
                        },
                        child: pageCard(
                            context, "Training", "assets/img/training.png"),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WorkoutPlannerPage()));
                        },
                        child: pageCard(context, "Workout Planner",
                            "assets/img/workout.png"),
                      ))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PoseExercisesScreen()));
                },
                child: SizedBox(
                  height: 150,
                  child: pageCard(
                      context, "Ai Pose Estimation", "assets/img/ai_pose.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 10),
                child: Text(
                  "Nutrition",
                  style: headingTextStyle,
                ),
              ),
              SizedBox(
                height: 150,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MealPlannerPage()));
                    },
                    child: pageCard(
                        context, "Diet Planner", "assets/img/diet.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 10),
                child: Text(
                  "Support",
                  style: headingTextStyle,
                ),
              ),
              SizedBox(
                height: 150,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ChatBotPage(profileModel: _currentUser,)));
                    },
                    child: pageCard(
                        context, "Chat Bot", "assets/img/chatbot.png")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundButton(
                  title: 'Sign out',
                  onPressed: () {
                    fireHelper.logOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
            ]),
      ),
    );
  }
}

Widget pageCard(context, String title, String imgPath) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: ConstColor.secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Alex',
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          Center(child: Image.asset(imgPath)),
          const Spacer(),
        ],
      ),
    ),
  );
}
