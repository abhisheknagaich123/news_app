import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/View_Models/controler/FirebaseLogin/firebase_login.dart';
import 'package:news_app/View_Models/controler/firebase_signup/FirebaseSignup.dart';
import 'package:news_app/res/assets/images_assets.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({super.key});

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final LoginController _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            print('Facebook CircleAvatar tapped!');
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/fb.png'),
          ),
        ),
        InkWell(
          onTap: () {
            print('GitHub CircleAvatar tapped!');
          },
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/github.jpeg'),
          ),
        ),
        InkWell(
          onTap: () {
            print('Google CircleAvatar tapped!');
            _controller.googleLogin();
          },
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/google.png'),
          ),
        ),
      ],
    );
  }
}
