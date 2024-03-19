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
import 'package:news_app/data/response/status.dart';
import 'package:news_app/res/routes/routes.dart';
import 'package:news_app/utils/utils.dart';

class LoginController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final confirm_password = TextEditingController().obs;
  RxBool eye = true.obs;
  UserPreference userPreference = UserPreference();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  cleartextfield() {
    email.value.clear();
    password.value.clear();
  }

  //  final rxRequestStatus = Status.LOADING.obs;
  // // final userList = UserListModel().obs;
  // RxString error = ''.obs;

  //  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  // void setError(String _value) => error.value = _value;

  // void refreshApi() {
  //   setRxRequestStatus(Status.LOADING);

  //   _api.userListApi().then((value) {
  //     setRxRequestStatus(Status.COMPLETED);
  //     setUserList(value);
  //   }).onError((error, stackTrace) {
  //     setError(error.toString());
  //     setRxRequestStatus(Status.ERROR);
  //   });
  // }

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

  // Future<void> emailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email.value.text, password: password.value.text);
  //     print(userCredential);

  //     Get.snackbar('Successful', 'Login Successfully');
  //     // Get.to(home());
  //     Get.toNamed(RouteName.homeView);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'invalid-credential') {
  //       Get.snackbar('invalid-credential',
  //           'invalid-credential check email and password.');
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
  //     // Get.to(home());
  //     Get.toNamed(RouteName.homeView);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> emailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.value.text, password: password.value.text);
      print(userCredential);

      UserModel userModel =
          UserModel(token: userCredential.user!.uid, isLogin: true);
      // saveUser(userModel);
      userPreference.saveUser(userModel).then((value) {
        // releasing resouces because we are not going to use this
        //Get.delete<LoginViewModel>();
        Get.delete<LoginController>();
        Get.toNamed(RouteName.homeView)!.then((value) {});
        Utils.snackBar('Login', 'Login successfully');
      }).onError((error, stackTrace) {});

      // Get.snackbar('Successful', 'Login Successfully');
      //Get.toNamed(RouteName.homeView);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Get.snackbar('invalid-credential',
            'Invalid credentials. Please check your email and password.');
      } else {
        Get.snackbar('Error', e.message ?? 'An error occurred during login.');
      }
    }
  }

  Future<void> googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      UserModel userModel =
          UserModel(token: userCredential.user!.uid, isLogin: true);

      userPreference.saveUser(userModel).then((value) {
        // releasing resouces because we are not going to use this
        Get.delete<LoginController>();
        Get.toNamed(RouteName.homeView)!.then((value) {});
        Utils.snackBar('Login', 'Login successfully');
      }).onError((error, stackTrace) {});

      // Get.snackbar('Successful', 'Login Successfully');
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
