import 'package:flutter/material.dart';
import 'package:healthflow/data/models/profile_model.dart';
import 'package:healthflow/data/models/user_model.dart';
import 'package:healthflow/utils/firebase_helper.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';
import '../../../common_widgets/round_button.dart';
import '../../home/home.dart';
import 'widgets/round_text_field.dart';

class CompleteProfilePage extends StatefulWidget {
  final UserModel userModel;
  final String name;

  const CompleteProfilePage({
    super.key,
    required this.userModel,
    required this.name,
  });

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  FirebaseHelper fireHelper = FirebaseHelper();
  late ProfileModel userProfile;
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String? _selectedGoal, _selectedGender;
  double bmi = 0;
  @override
  void dispose() {
    _dateController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void finishProfile() async {
    if (_selectedGender == null ||
        _selectedGoal == null ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
      return;
    }

    final double? weight = double.tryParse(_weightController.text.trim());
    final double? height = double.tryParse(_heightController.text.trim());

    if (weight == null || height == null || weight <= 0 || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid weight and height')),
      );
      return;
    }

    final int age = calculateAge(selectedDate!);
    final double? bmi = calculateBMI(
      weightController: _weightController,
      heightController: _heightController,
    );

    if (bmi == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('BMI could not be calculated')),
      );
      return;
    }

    final profile = ProfileModel(
      uid: widget.userModel.uid,
      name: widget.name,
      email: widget.userModel.email,
      password: '',
      gender: _selectedGender!,
      birthDate: _dateController.text,
      age: age,
      goal: _selectedGoal!,
      weight: weight,
      height: height,
      bmi: bmi,
    );

    try {
      final updatedProfile = await fireHelper.updateCurrentProfile(profile);
      if (!mounted) return; // Additional safety check
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(uid: updatedProfile.uid),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  double? calculateBMI({
    required TextEditingController weightController,
    required TextEditingController heightController,
  }) {
    final String weightText = weightController.text.trim();
    final String heightText = heightController.text.trim();

    if (weightText.isEmpty || heightText.isEmpty) {
      return null; // You can handle this in UI
    }

    final double? weight = double.tryParse(weightText);
    final double? heightCm = double.tryParse(heightText);

    if (weight == null || heightCm == null || weight <= 0 || heightCm <= 0) {
      return null; // Invalid input
    }

    final double heightM = heightCm / 100; // Convert cm to meters
    final double bmi = weight / (heightM * heightM);

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                      color: ConstColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(color: ConstColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Image.asset("assets/img/Register_logo.png"),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ConstColor.lightGray,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Image.asset(
                                  "assets/img/gender.png",
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: ConstColor.gray,
                                )),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: ["Male", "Female"]
                                      .map((name) => DropdownMenuItem(
                                            value: name,
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                  color: ConstColor.gray,
                                                  fontSize: 14),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                  value: (_selectedGender == null ||
                                          _selectedGender!.isEmpty)
                                      ? null
                                      : _selectedGender,
                                  isExpanded: true,
                                  hint: Text(
                                    _selectedGender ?? "Choose Gender",
                                    style: TextStyle(
                                        color: ConstColor.gray, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: _dateController,
                        hitText: "Date of Birth",
                        icon: "assets/img/date.png",
                        onTap: _pickDate,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _weightController,
                              hitText: "Your Weight",
                              icon: "assets/img/weight.png",
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ConstColor.secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style: TextStyle(
                                  color: ConstColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _heightController,
                              hitText: "Your Height",
                              icon: "assets/img/height.png",
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ConstColor.secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style: TextStyle(
                                  color: ConstColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ConstColor.lightGray,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Image.asset(
                                  "assets/img/tick_square.png",
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: ConstColor.gray,
                                )),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: [
                                    "Loose Weight",
                                    "Gain Muscle",
                                    "Stay Fit & Healthy"
                                  ]
                                      .map((name) => DropdownMenuItem(
                                            value: name,
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                  color: ConstColor.gray,
                                                  fontSize: 14),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGoal = value;
                                    });
                                  },
                                  value: (_selectedGoal == null ||
                                          _selectedGoal!.isEmpty)
                                      ? null
                                      : _selectedGoal,
                                  isExpanded: true,
                                  hint: Text(
                                    _selectedGoal ?? "Choose Goal",
                                    style: TextStyle(
                                        color: ConstColor.gray, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundButton(title: "Finish ;)", onPressed: finishProfile),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
