import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/Models/Login/user_model.dart';
import 'package:news_app/View_Models/controler/user_prefernce/user_prefrence.dart';
import 'package:news_app/res/routes/routes.dart';
import 'package:news_app/utils/utils.dart';

class SignupController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final confirm_password = TextEditingController().obs;
  RxBool eye = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserPreference userPreference = UserPreference();

  cleartextfield() {
    email.value.clear();
    password.value.clear();
  }

  passwordobsucure() {
    eye.value = !eye.value;
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> emailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.value.text, password: password.value.text);
      print(userCredential);
      UserModel userModel =
          UserModel(token: userCredential.user!.uid, isLogin: true);
      // saveUser(userModel);
      userPreference.saveUser(userModel).then((value) {
        // releasing resouces because we are not going to use this
        //Get.delete<LoginViewModel>();
        Get.delete<SignupController>();
        Get.toNamed(RouteName.homeView)!.then((value) {});
        Utils.snackBar('Registration', 'Registration successfully');
      }).onError((error, stackTrace) {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Weak Password', 'Please choose a stronger password.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Email Already in Use', 'Please use a different email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> googleLogin() async {
    print("Google Login method Called");
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel userModel =
          UserModel(token: userCredential.user!.uid, isLogin: true);
      // saveUser(userModel);
      userPreference.saveUser(userModel).then((value) {
        // releasing resouces because we are not going to use this
        //Get.delete<LoginViewModel>();
        Get.delete<SignupController>();
        Get.toNamed(RouteName.homeView)!.then((value) {});
        Utils.snackBar('Registration', 'Registration successfully');
      }).onError((error, stackTrace) {});

      // print("Result $userCredential");
      // // print(userCredential.user!.displayName);
      // print(userCredential.user!.email);

      // Get.toNamed(RouteName.homeView);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        Get.snackbar('Account Exists',
            'An account already exists with the same email address but different sign-in credentials. Please sign in using the appropriate provider.');
      } else {
        Get.snackbar('Error', 'An error occurred while signing in.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // emailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: email.value.text, password: password.value.text);
  //     print(userCredential);

  //     Get.snackbar('successful', 'Registered Successfully');
  //     Get.to(home());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Get.snackbar('weak-password', 'Weak Password');
  //     } else if (e.code == 'email-already-in-use') {
  //       Get.snackbar('email-already-in-use', 'Email Already in Use');
  //     }
  //   }
  // }

  // googleLogin() async {
  //   print("googleLogin method Called");
  //   GoogleSignIn _googleSignIn = GoogleSignIn();
  //   try {
  //     var reslut = await _googleSignIn.signIn();
  //     if (reslut == null) {
  //       return;
  //     }

  //     final userData = await reslut.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: userData.accessToken, idToken: userData.idToken);
  //     var finalResult =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     print("Result $reslut");
  //     print(reslut.displayName);
  //     print(reslut.email);
  //     print(reslut.photoUrl);
  //     Get.to(home());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Get.snackbar('weak-password', 'Weak Password');
  //     } else if (e.code == 'email-already-in-use') {
  //       Get.snackbar('email-already-in-use', 'Email Already in Use');
  //     }
  //   }
  // }
}
