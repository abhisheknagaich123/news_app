import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/Models/Login/user_model.dart';
import 'package:news_app/Repository/login_Repository/LoginRepository.dart';
import 'package:news_app/View_Models/controler/user_prefernce/user_prefrence.dart';
import 'package:news_app/res/routes/routes.dart';
import 'package:news_app/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;

      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);

        userPreference.saveUser(userModel).then((value) {
          // releasing resouces because we are not going to use this
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.homeView)!.then((value) {});
          Utils.snackBar('Login', 'Login successfully');
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
