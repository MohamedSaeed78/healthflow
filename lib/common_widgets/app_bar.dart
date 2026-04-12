import 'package:flutter/material.dart';

import '../utils/constants.dart';

AppBar customAppBar(BuildContext context, String pageTitle)=> AppBar(
  backgroundColor: ConstColor.white,
    shadowColor: ConstColor.secondaryColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.pop(context); // Return to previous screen
      },
    ),
    title: Text(
      pageTitle,
      style: TextStyle(
          color: ConstColor.primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );