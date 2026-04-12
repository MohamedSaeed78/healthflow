import 'package:flutter/material.dart';
import 'package:healthflow/data/models/user_model.dart';
import 'package:healthflow/features/home/home.dart';
import 'package:healthflow/utils/firebase_helper.dart';

import '../../../common_widgets/round_button.dart';
import '../../../utils/constants.dart';
import 'register_page.dart';
import 'widgets/round_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePasswordToggle = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseHelper fireHelper = FirebaseHelper();
    UserModel user;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text("Hey there,",
                  style: TextStyle(fontSize: 16, fontFamily: "Allerta")),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alex"),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundTextField(
                  controller: emailController,
                  hitText: "Email",
                  icon: "assets/img/email.png",
                  // keyboardType: TextInputType.emailAddress
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundTextField(
                  hitText: "Password",
                  controller: passwordController,
                  icon: "assets/img/lock.png",
                  obscureText: _obscurePasswordToggle,
                  rigtIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          _obscurePasswordToggle = !_obscurePasswordToggle;
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/img/show_password.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: ConstColor.gray,
                          ))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RoundButton(
                    title: "login",
                    onPressed: () async {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        showSnackbar(
                            'Please enter both email and password', context);
                      } else {
                        user = (await fireHelper.logInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        ))!;
                        if (!context.mounted) return;

                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomePage(
                              uid: user.uid,
                            );
                          },
                        ));
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: ConstColor.gray.withOpacity(0.5),
                    )),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: ConstColor.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: ConstColor.gray.withOpacity(0.5),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ConstColor.white,
                        border: Border.all(
                          width: 1,
                          color: ConstColor.gray.withOpacity(0.4),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/img/google.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ConstColor.white,
                        border: Border.all(
                          width: 1,
                          color: ConstColor.gray.withOpacity(0.4),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/img/facebook.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const RegisterPage();
                  }));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don’t have an account yet? ",
                      style: TextStyle(
                          color: ConstColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                          color: ConstColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}
