// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:healthflow/data/models/user_model.dart';
import 'package:healthflow/utils/firebase_helper.dart';

import '../../../common_widgets/round_button.dart';
import '../../../utils/constants.dart';
import 'complete_profile.dart';
import 'login_page.dart';
import 'widgets/round_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool _obscurePasswordToggle = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                const Image(image: AssetImage("assets/img/Register_logo.png")),
                const Text("Hey there,",
                    style: TextStyle(fontSize: 16, fontFamily: "Allerta")),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Create and Account",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Alex"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundTextField(
                    controller: nameController,
                    hitText: "Name",
                    icon: "assets/img/user_text.png",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundTextField(
                      controller: emailController,
                      hitText: "Email",
                      icon: "assets/img/email.png",
                      keyboardType: TextInputType.emailAddress),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundTextField(
                    controller: passwordController,
                    hitText: "Password",
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
                      title: "Register",
                      onPressed: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          showSnackbar(
                              'Please make sure you entered email and password and name',
                              context);
                        } else {
                          user = (await fireHelper.registerWithEmailAndPassword(
                              emailController.text, passwordController.text))!;
                          if (!context.mounted) return;

                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (BuildContext context) {
                              return CompleteProfilePage(
                                userModel: user,
                                name: nameController.text,
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
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                      return const LoginPage();
                    }));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Have an account.",
                        style: TextStyle(
                            color: ConstColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Login",
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
      ),
    );
  }
}
