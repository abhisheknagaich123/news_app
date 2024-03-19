import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/View_Models/controler/FirebaseLogin/firebase_login.dart';
import 'package:news_app/View_Models/controler/user_prefernce/user_prefrence.dart';
import 'package:news_app/res/routes/routes.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  User? user = FirebaseAuth.instance.currentUser;
  final LoginController _controller = Get.put(LoginController());
  UserPreference userPreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home page'),
        actions: [
          IconButton(
              onPressed: () {
                _controller.logout();
                // Get.to(Login());
                Get.toNamed(RouteName.loginView);
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
                print("logout Icon Clicked");
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            if (user != null)
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user!.photoURL ?? ''),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome ${user!.displayName ?? ''}!',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            SizedBox(height: 20),
            Text('Welcome to the Home Page!'),
          ],
        ),
      ),
    );
  }
}
