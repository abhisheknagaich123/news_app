import 'package:get/get.dart';
import 'package:news_app/View_Models/controler/home/homebottomController.dart';
import 'package:news_app/res/routes/routes.dart';

import 'package:news_app/view/Login_With_firebase/Login.dart';
import 'package:news_app/view/Login_With_firebase/homewidget.dart';
import 'package:news_app/view/SignupFirebase/signup.dart';
import 'package:news_app/view/home_View/homeview.dart';
import 'package:news_app/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => Login(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.SighupView,
          page: () => Signup(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => homebottomController(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
