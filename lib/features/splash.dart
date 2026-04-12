import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthflow/features/home/home.dart';

import 'auth/presentation/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  User? checkUserLoginStatus() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    if (checkUserLoginStatus() == null) {
      Timer(const Duration(seconds: 4), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const LoginPage();
            },
          ),
          (_) => false,
        );
      });
    } else {
      String uid = checkUserLoginStatus()!.uid;
      Timer(const Duration(seconds: 4), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return HomePage(uid: uid);
            },
          ),
          (_) => false,
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("HealthFlow",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alex")),
            Image(image: AssetImage("assets/img/logo_wing.png")),
          ],
        ),
      ),
    );
  }
}
