import 'package:healthflow/data/models/user_model.dart';

class ProfileModel extends UserModel {
  final String name;
  final String gender;
  final String birthDate;
  final int age;
  final double weight;
  final double height;
  final String goal;
  final double bmi;

  ProfileModel({
    required super.uid,
    required super.password,
    required super.email,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
    required this.bmi,
  });

  ProfileModel copyWith({
    String? newName,
    String? newGender,
    String? newBirthDate,
    String? newGoal,
    int? newAge,
    double? newWeight,
    double? newHeight,
    double? newBmi,
  }) {
    return ProfileModel(
        uid: uid,
        password: password,
        email: email,
        name: newName ?? name,
        gender: newGender ?? gender,
        birthDate: newBirthDate ?? birthDate,
        age: newAge ?? age,
        weight: newWeight ?? weight,
        height: newHeight ?? height,
        goal: newGoal ?? goal,
        bmi: newBmi ?? bmi);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
      'name': name,
      'gender': gender,
      'birthDate': birthDate,
      'age': age,
      'weight': weight,
      'height': height,
      'goal': goal,
      'bmi': bmi,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      uid: map['uid'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      birthDate: map['birthDate'] as String,
      age: (map['age'] as num).toInt(),
      weight: (map['weight'] as num).toDouble(),
      height: (map['height'] as num).toDouble(),
      goal: map['goal'] as String,
      bmi: (map['bmi'] as num).toDouble(),
    );
  }
}
