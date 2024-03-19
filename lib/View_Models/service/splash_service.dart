import 'dart:async';

import 'package:get/get.dart';

import 'package:news_app/View_Models/controler/user_prefernce/user_prefrence.dart';
import 'package:news_app/res/routes/routes.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      print("this is Token${value.token}");
      print("this is value ${value.isLogin}");

      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
      }
    });
  }
}
