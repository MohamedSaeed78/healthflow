import 'package:flutter/material.dart';
import 'package:healthflow/utils/constants.dart';

Widget bmiCard(double bmi) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: ConstColor.blueLinearGradiant),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "BMI (Body Mass Index)",
                    style: TextStyle(
                      fontFamily: 'Alex',
                        fontSize: 18,
                        color: ConstColor.white),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: ConstColor.white,
                    ),
                    child: Center(
                        child: Text(
                      bmi.toInt().toString(),
                      style: TextStyle(
                        fontFamily: 'Alex',
                          color: ConstColor.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                  ),
                )),
          ],
        ),
      ),
    );
