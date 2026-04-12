import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthflow/data/models/profile_model.dart';

import '../data/models/user_model.dart';

class FirebaseHelper {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<ProfileModel?> getCurrentProfile(String uid) async {
    try {
      final userDoc =
          await firebaseFirestore.collection('profiles').doc(uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          return ProfileModel(
              uid: uid,
              password: userData['password'],
              email: userData['email'],
              name: userData['name'],
              gender: userData['gender'],
              birthDate: userData['birthDate'],
              age: userData['age'],
              weight: userData['weight'],
              height: userData['height'],
              goal: userData['goal'],
              bmi: userData['bmi']);
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ProfileModel> updateCurrentProfile(ProfileModel inputProfile) async {
    final docRef =
        firebaseFirestore.collection('profiles').doc(inputProfile.uid);

    try {
      final docSnapshot = await docRef.get();

      late ProfileModel finalProfile;

      if (docSnapshot.exists && docSnapshot.data() != null) {
        final existingProfile = ProfileModel.fromMap(docSnapshot.data()!);
        finalProfile = existingProfile.copyWith(
          newName: inputProfile.name,
          newGender: inputProfile.gender,
          newBirthDate: inputProfile.birthDate,
          newAge: inputProfile.age,
          newGoal: inputProfile.goal,
          newWeight: inputProfile.weight,
          newHeight: inputProfile.height,
          newBmi: inputProfile.bmi,
        );
      } else {
        finalProfile = inputProfile;
      }

      await docRef.set(finalProfile.toMap(), SetOptions(merge: true));
      return finalProfile;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // sign up
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create user
      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        password: "",
      );
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(user.toMap());
      // return user
      return user;
    } catch (e) {
      throw Exception('Login Failed : $e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }
    return UserModel(
      uid: user.uid,
      password: '',
      email: user.email!,
    );
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  Future<UserModel?> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      // sign in
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create user
      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        password: '',
        email: email,
      );
      // return user
      return user;
    } catch (e) {
      throw Exception('Login Failed : $e');
    }
  }
}
