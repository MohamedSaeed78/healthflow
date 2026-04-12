import 'package:flutter/material.dart';

class ConstColor {
  static Color get primaryColor => const Color(0xff1B2141);

  static Color get secondaryColor => const Color(0xff49BEB7);

  static List<Color> get blueLinearGradiant => [secondaryColor, primaryColor];

  static List<Color> get secondaryG => [secondaryColor, white];

  static Color get black => const Color(0xff1D1617);

  static Color get gray => const Color(0xff786F72);

  static Color get white => Colors.white;

  static Color get lightGray => const Color(0xffd2d2d2);
}

const String exerciseImageAsset = "assets/exercises/";

TextStyle headingTextStyle = const TextStyle(
    fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Alex");
TextStyle bodyTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300, // w300 expressing light font
    fontFamily: "Allerta");

showSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}