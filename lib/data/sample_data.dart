import 'models/exercise_model.dart';
import 'models/meal_model.dart';
import 'models/meal_plan_model.dart';
import 'models/workout_plan_model.dart';

final List<ExerciseModel> bodyOnlyExercises = [
  ExerciseModel(
    id: "3_4_Sit-Up",
    name: "3/4 Sit-Up",
    force: "pull",
    level: "beginner",
    mechanic: "compound",
    equipment: "body only",
    primaryMuscles: ["abdominals"],
    secondaryMuscles: [],
    instructions: [
      "Lie down on the floor and secure your feet. Your legs should be bent at the knees.",
      "Place your hands behind or to the side of your head. You will begin with your back on the ground. This will be your starting position.",
      "Flex your hips and spine to raise your torso toward your knees.",
      "At the top of the contraction your torso should be perpendicular to the ground. Reverse the motion, going only ¾ of the way down.",
      "Repeat for the recommended amount of repetitions."
    ],
    category: "strength",
    images: ["3_4_Sit-Up/0.jpg", "3_4_Sit-Up/1.jpg"],
  ),
  ExerciseModel(
    id: "All_Fours_Quad_Stretch",
    name: "All Fours Quad Stretch",
    force: "static",
    level: "intermediate",
    mechanic: "",
    equipment: "body only",
    primaryMuscles: ["quadriceps"],
    secondaryMuscles: ["quadriceps"],
    instructions: [
      "Start off on your hands and knees, then lift your leg off the floor and hold the foot with your hand.",
      "Use your hand to hold the foot or ankle, keeping the knee fully flexed, stretching the quadriceps and hip flexors.",
      "Focus on extending your hips, thrusting them towards the floor. Hold for 10-20 seconds and then switch sides."
    ],
    category: "stretching",
    images: ["All_Fours_Quad_Stretch/0.jpg", "All_Fours_Quad_Stretch/1.jpg"],
  ),
  ExerciseModel(
    id: "Bench_Jump",
    name: "Bench Jump",
    level: "intermediate",
    force: "push",
    mechanic: "compound",
    equipment: "body only",
    primaryMuscles: ["quadriceps"],
    secondaryMuscles: ["calves", "glutes", "hamstrings"],
    instructions: [
      "Begin with a box or bench 1-2 feet in front of you. Stand with your feet shoulder width apart.",
      "Perform a short squat in preparation for the jump; swing your arms behind you.",
      "Rebound out of this position, extending through the hips, knees, and ankles to jump as high as possible. Swing your arms forward and up.",
      "Jump over the bench, landing with the knees bent, absorbing the impact through the legs.",
      "Turn around and face the opposite direction, then jump back over the bench."
    ],
    category: "plyometrics",
    images: ["Bench_Jump/0.jpg", "Bench_Jump/1.jpg"],
  ),
  ExerciseModel(
    id: "Body-Up",
    name: "Body-Up",
    force: "push",
    level: "intermediate",
    mechanic: "isolation",
    equipment: "body only",
    primaryMuscles: ["triceps"],
    secondaryMuscles: ["abdominals", "forearms"],
    instructions: [
      "Assume a plank position on the ground. Support your body weight on your toes and forearms.",
      "Pressing your palms firmly into the ground, extend through the elbows to raise your body from the ground. Keep your torso rigid.",
      "Slowly lower your forearms back to the ground by allowing the elbows to flex.",
      "Repeat."
    ],
    category: "strength",
    images: ["Body-Up/0.jpg", "Body-Up/1.jpg"],
  ),
  ExerciseModel(
    id: "Clock_Push-Up",
    name: "Clock Push-Up",
    force: "push",
    level: "intermediate",
    mechanic: "compound",
    equipment: "body only",
    primaryMuscles: ["chest"],
    secondaryMuscles: ["shoulders", "triceps"],
    instructions: [
      "Move into a prone position on the floor, supporting your weight on your hands and toes.",
      "Descend by flexing at the elbow, lowering your chest toward the ground.",
      "At the bottom, reverse the motion by pushing yourself up quickly, 'jumping' slightly to one side.",
      "Repeat moving around in a clock pattern."
    ],
    category: "strength",
    images: ["Clock_Push-Up/0.jpg", "Clock_Push-Up/1.jpg"],
  ),
  ExerciseModel(
    id: "Close-Grip_Push-Up_off_of_a_Dumbbell",
    name: "Close-Grip Push-Up off of a Dumbbell",
    force: "push",
    level: "intermediate",
    mechanic: "compound",
    equipment: "body only",
    primaryMuscles: ["triceps"],
    secondaryMuscles: ["abdominals", "chest", "shoulders"],
    instructions: [
      "Place hands on an upright dumbbell.",
      "Lower your body by bending the elbows while keeping your body rigid.",
      "Push back to starting position.",
      "Repeat for repetitions."
    ],
    category: "strength",
    images: [
      "Close-Grip_Push-Up_off_of_a_Dumbbell/0.jpg",
      "Close-Grip_Push-Up_off_of_a_Dumbbell/1.jpg"
    ],
  ),
  ExerciseModel(
    id: "Chin-Up",
    name: "Chin-Up",
    force: "pull",
    level: "beginner",
    mechanic: "compound",
    equipment: "body only",
    primaryMuscles: ["lats"],
    secondaryMuscles: ["biceps", "forearms", "middle back"],
    instructions: [
      "Grab the bar with palms facing toward you, hands closer than shoulder-width apart.",
      "Pull your torso upward using your biceps.",
      "Lower yourself slowly back to starting position.",
      "Repeat."
    ],
    category: "strength",
    images: ["Chin-Up/0.jpg", "Chin-Up/1.jpg"],
  ),
  ExerciseModel(
    id: "Cross-Body_Crunch",
    name: "Cross-Body Crunch",
    force: "pull",
    level: "beginner",
    mechanic: "compound",
    equipment: "body only",
    primaryMuscles: ["abdominals"],
    secondaryMuscles: [],
    instructions: [
      "Lie on your back with knees bent.",
      "Bring your right elbow toward your left knee by contracting your abs.",
      "Return and alternate sides.",
      "Repeat until complete."
    ],
    category: "strength",
    images: ["Cross-Body_Crunch/0.jpg", "Cross-Body_Crunch/1.jpg"],
  ),
  ExerciseModel(
    id: "Butt_Lift_Bridge",
    name: "Butt Lift (Bridge)",
    force: "push",
    level: "beginner",
    mechanic: "isolation",
    equipment: "body only",
    primaryMuscles: ["glutes"],
    secondaryMuscles: ["hamstrings"],
    instructions: [
      "Lie flat on your back, knees bent, feet flat on the floor.",
      "Push through your heels, lifting your hips until your thighs and torso form a straight line.",
      "Hold briefly, then lower slowly.",
      "Repeat."
    ],
    category: "strength",
    images: ["Butt_Lift_Bridge/0.jpg", "Butt_Lift_Bridge/1.jpg"],
  ),
  ExerciseModel(
    id: "Alternate_Heel_Touchers",
    name: "Alternate Heel Touchers",
    force: "pull",
    level: "beginner",
    mechanic: "isolation",
    equipment: "body only",
    primaryMuscles: ["abdominals"],
    secondaryMuscles: [],
    instructions: [
      "Lie down with knees bent, feet flat, and arms by your sides.",
      "Crunch slightly to one side to touch your heel.",
      "Return and crunch to the opposite side.",
      "Repeat for reps."
    ],
    category: "strength",
    images: ["Alternate_Heel_Touchers/0.jpg", "Alternate_Heel_Touchers/1.jpg"],
  ),
];

final List<ExerciseModel> otherEquipmentExercises = [
  ExerciseModel(
    id: "Ab_Crunch_Machine",
    name: "Ab Crunch Machine",
    force: "pull",
    level: "intermediate",
    mechanic: "isolation",
    equipment: "machine",
    primaryMuscles: ["abdominals"],
    secondaryMuscles: [],
    instructions: [
      "Select a light resistance and sit on the machine placing your feet under the pads.",
      "Grab the top handles, arms bent at 90 degrees resting on the pads.",
      "Crunch your upper torso while lifting your legs up.",
      "Return slowly to starting position."
    ],
    category: "strength",
    images: ["Ab_Crunch_Machine/0.jpg", "Ab_Crunch_Machine/1.jpg"],
  ),
  ExerciseModel(
    id: "Ab_Roller",
    name: "Ab Roller",
    force: "pull",
    level: "intermediate",
    mechanic: "compound",
    equipment: "other",
    primaryMuscles: ["abdominals"],
    secondaryMuscles: ["shoulders"],
    instructions: [
      "Hold the Ab Roller with both hands and kneel on the floor.",
      "Roll the ab roller straight forward while keeping your body straight.",
      "Pause, then pull yourself back to the starting position."
    ],
    category: "strength",
    images: ["Ab_Roller/0.jpg", "Ab_Roller/1.jpg"],
  ),
  ExerciseModel(
    id: "Advanced_Kettlebell_Windmill",
    name: "Advanced Kettlebell Windmill",
    force: "push",
    level: "intermediate",
    mechanic: "isolation",
    equipment: "kettlebells",
    primaryMuscles: ["abdominals"],
    secondaryMuscles: ["glutes", "hamstrings", "shoulders"],
    instructions: [
      "Clean and press a kettlebell overhead with one arm.",
      "Push your butt out in the direction of the locked out kettlebell.",
      "Lower yourself as far as possible, then return to starting."
    ],
    category: "strength",
    images: [
      "Advanced_Kettlebell_Windmill/0.jpg",
      "Advanced_Kettlebell_Windmill/1.jpg"
    ],
  ),
  ExerciseModel(
    id: "Alternate_Hammer_Curl",
    name: "Alternate Hammer Curl",
    force: "pull",
    level: "beginner",
    mechanic: "isolation",
    equipment: "dumbbell",
    primaryMuscles: ["biceps"],
    secondaryMuscles: ["forearms"],
    instructions: [
      "Stand with dumbbells at arms length.",
      "Curl the right dumbbell forward while contracting the biceps.",
      "Lower back and repeat with the left hand."
    ],
    category: "strength",
    images: ["Alternate_Hammer_Curl/0.jpg", "Alternate_Hammer_Curl/1.jpg"],
  ),
  ExerciseModel(
    id: "Alternating_Hang_Clean",
    name: "Alternating Hang Clean",
    force: "pull",
    level: "intermediate",
    mechanic: "compound",
    equipment: "kettlebells",
    primaryMuscles: ["hamstrings"],
    secondaryMuscles: [
      "biceps",
      "calves",
      "forearms",
      "glutes",
      "lower back",
      "traps"
    ],
    instructions: [
      "Place two kettlebells between your feet.",
      "Clean one kettlebell to your shoulder while holding the other.",
      "Lower and repeat alternating sides."
    ],
    category: "strength",
    images: ["Alternating_Hang_Clean/0.jpg", "Alternating_Hang_Clean/1.jpg"],
  ),
  ExerciseModel(
    id: "Alternating_Renegade_Row",
    name: "Alternating Renegade Row",
    force: "pull",
    level: "expert",
    mechanic: "compound",
    equipment: "kettlebells",
    primaryMuscles: ["middle back"],
    secondaryMuscles: ["abdominals", "biceps", "chest", "lats", "triceps"],
    instructions: [
      "Get into a pushup position holding kettlebells.",
      "Row one kettlebell while pressing the other into the ground.",
      "Alternate arms."
    ],
    category: "strength",
    images: [
      "Alternating_Renegade_Row/0.jpg",
      "Alternating_Renegade_Row/1.jpg"
    ],
  ),
  ExerciseModel(
    id: "Atlas_Stones",
    name: "Atlas Stones",
    force: "pull",
    level: "expert",
    mechanic: "compound",
    equipment: "other",
    primaryMuscles: ["lower back"],
    secondaryMuscles: [
      "abdominals",
      "adductors",
      "biceps",
      "calves",
      "forearms",
      "glutes",
      "hamstrings",
      "middle back",
      "quadriceps",
      "traps"
    ],
    instructions: [
      "Bend at the hips to wrap arms around the stone.",
      "Pull the stone to your lap and stand up with it.",
      "Load it onto a platform."
    ],
    category: "strongman",
    images: ["Atlas_Stones/0.jpg", "Atlas_Stones/1.jpg"],
  ),
  ExerciseModel(
    id: "Arnold_Dumbbell_Press",
    name: "Arnold Dumbbell Press",
    force: "push",
    level: "intermediate",
    mechanic: "compound",
    equipment: "dumbbell",
    primaryMuscles: ["shoulders"],
    secondaryMuscles: ["triceps"],
    instructions: [
      "Sit with dumbbells at upper chest level, palms facing body.",
      "Rotate palms out while pressing dumbbells overhead.",
      "Lower back to chest level while rotating palms."
    ],
    category: "strength",
    images: ["Arnold_Dumbbell_Press/0.jpg", "Arnold_Dumbbell_Press/1.jpg"],
  ),
  ExerciseModel(
    id: "Axle_Deadlift",
    name: "Axle Deadlift",
    force: "pull",
    level: "intermediate",
    mechanic: "compound",
    equipment: "other",
    primaryMuscles: ["lower back"],
    secondaryMuscles: [
      "forearms",
      "glutes",
      "hamstrings",
      "middle back",
      "quadriceps",
      "traps"
    ],
    instructions: [
      "Grip the axle and stand with it over your feet.",
      "Drive through heels, lifting the bar up.",
      "Pull shoulders back at top, lower carefully."
    ],
    category: "strongman",
    images: ["Axle_Deadlift/0.jpg", "Axle_Deadlift/1.jpg"],
  ),
  ExerciseModel(
    id: "Backward_Drag",
    name: "Backward Drag",
    force: "pull",
    level: "beginner",
    mechanic: "compound",
    equipment: "other",
    primaryMuscles: ["quadriceps"],
    secondaryMuscles: [
      "calves",
      "forearms",
      "glutes",
      "hamstrings",
      "lower back"
    ],
    instructions: [
      "Attach a rope to a sled.",
      "Drag the sled backwards, keeping tension.",
      "Maintain steady and strong steps."
    ],
    category: "strongman",
    images: ["Backward_Drag/0.jpg", "Backward_Drag/1.jpg"],
  ),
];
final List<WorkoutPlan> defaultWorkoutPlans = [
  WorkoutPlan(
    name: 'Body Only Plan',
    exercises: bodyOnlyExercises.take(5).toList(), // Use first 5 for example
  ),
  WorkoutPlan(
    name: 'Gym Plan',
    exercises: otherEquipmentExercises.take(5).toList(),
  ),
  WorkoutPlan(
    name: 'Beginner Mixed Plan',
    exercises: [
      ...bodyOnlyExercises.where((e) => e.level == 'beginner').take(3),
      ...otherEquipmentExercises.where((e) => e.level == 'beginner').take(3),
    ],
  ),
];

final List<MealModel> allMeals = [
  MealModel(
    id: 1,
    name: "Oatmeal with Banana",
    category: "Breakfast",
    calories: 250,
    protein: 8,
    carbs: 40,
    fat: 5,
    servingSize: "1 bowl",
  ),
  MealModel(
    id: 2,
    name: "Scrambled Eggs and Toast",
    category: "Breakfast",
    calories: 300,
    protein: 15,
    carbs: 20,
    fat: 18,
    servingSize: "2 eggs + 1 toast",
  ),
  MealModel(
    id: 3,
    name: "Greek Yogurt with Honey",
    category: "Breakfast",
    calories: 180,
    protein: 12,
    carbs: 15,
    fat: 6,
    servingSize: "1 cup",
  ),
  MealModel(
    id: 4,
    name: "Grilled Chicken Salad",
    category: "Lunch",
    calories: 350,
    protein: 30,
    carbs: 15,
    fat: 20,
    servingSize: "1 bowl",
  ),
  MealModel(
    id: 5,
    name: "Turkey Sandwich",
    category: "Lunch",
    calories: 400,
    protein: 25,
    carbs: 35,
    fat: 15,
    servingSize: "1 sandwich",
  ),
  MealModel(
    id: 6,
    name: "Quinoa and Veggie Bowl",
    category: "Lunch",
    calories: 380,
    protein: 14,
    carbs: 50,
    fat: 12,
    servingSize: "1 bowl",
  ),
  MealModel(
    id: 7,
    name: "Apple Slices with Peanut Butter",
    category: "Snack",
    calories: 200,
    protein: 4,
    carbs: 22,
    fat: 10,
    servingSize: "1 apple + 2 tbsp peanut butter",
  ),
  MealModel(
    id: 8,
    name: "Protein Bar",
    category: "Snack",
    calories: 220,
    protein: 20,
    carbs: 15,
    fat: 7,
    servingSize: "1 bar",
  ),
  MealModel(
    id: 9,
    name: "Mixed Nuts",
    category: "Snack",
    calories: 300,
    protein: 10,
    carbs: 12,
    fat: 25,
    servingSize: "1 handful (30g)",
  ),
  MealModel(
    id: 10,
    name: "Grilled Salmon with Veggies",
    category: "Dinner",
    calories: 450,
    protein: 35,
    carbs: 10,
    fat: 28,
    servingSize: "1 plate",
  ),
  MealModel(
    id: 11,
    name: "Beef Stir Fry",
    category: "Dinner",
    calories: 500,
    protein: 32,
    carbs: 25,
    fat: 30,
    servingSize: "1 plate",
  ),
  MealModel(
    id: 12,
    name: "Vegetable Pasta",
    category: "Dinner",
    calories: 420,
    protein: 15,
    carbs: 60,
    fat: 12,
    servingSize: "1 plate",
  ),
];

final List<MealPlan> defaultMealPlans = [
  MealPlan(
    name: "Balanced Starter Plan",
    meals: [
      allMeals.firstWhere((m) => m.name == "Oatmeal with Banana"),
      allMeals.firstWhere((m) => m.name == "Grilled Chicken Salad"),
      allMeals.firstWhere((m) => m.name == "Protein Bar"),
      allMeals.firstWhere((m) => m.name == "Grilled Salmon with Veggies"),
    ],
  ),
  MealPlan(
    name: "High Protein Plan",
    meals: [
      allMeals.firstWhere((m) => m.name == "Scrambled Eggs and Toast"),
      allMeals.firstWhere((m) => m.name == "Turkey Sandwich"),
      allMeals.firstWhere((m) => m.name == "Beef Stir Fry"),
      allMeals.firstWhere((m) => m.name == "Protein Bar"),
      allMeals.firstWhere((m) => m.name == "Greek Yogurt with Honey"),
    ],
  ),
];
final allExercises = [...bodyOnlyExercises, ...otherEquipmentExercises];
final List<Map<String, dynamic>> appData = [
  {
    "exercises": allExercises.map((e) => e.toJson()).toList(),
    "meals": allMeals.map((m) => m.toJson()).toList(),
    "workout plans": defaultWorkoutPlans
        .map((wp) => {
              "name": wp.name,
              "exercises": wp.exercises.map((e) => e.toJson()).toList()
            })
        .toList(),
    "diet meal plans": defaultMealPlans
        .map((mp) => {
              "name": mp.name,
              "meals": mp.meals.map((m) => m.toJson()).toList()
            })
        .toList()
  }
];
