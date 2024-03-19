import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/View_Models/controler/FirebaseLogin/firebase_login.dart';
import 'package:news_app/res/routes/routes.dart';
import 'package:news_app/view/Login_With_firebase/google_Auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login News App'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.cyanAccent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 70,
                      width: 380,
                      child: TextFormField(
                        enableSuggestions: true, // Enable suggestions/paste
                        autocorrect: true,

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _controller.email.value,
                        validator: _controller.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Container(
                        height: 70,
                        width: 380,
                        child: TextFormField(
                          obscureText: _controller.eye.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                          controller: _controller.password.value,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffix: IconButton(
                              onPressed: () {
                                _controller.passwordobsucure();
                              },
                              icon: Icon(Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle your login logic here
                        _controller.emailAndPassword();
                        _controller.cleartextfield();
                        print('Login tapped');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 59, 127, 230),
                      ),
                      width: 280,
                      height: 60,
                      child: const Center(
                        child: Text('Login'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: () {}, child: Text('Forgot Password')),
                  GoogleAuth(),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(RouteName.SighupView);
                      },
                      child: Text('New User? Create Account')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/res/components/round_button.dart';
// import 'package:news_app/view/Login_With_firebase/Emailwidget.dart';
// import 'package:news_app/view/Login_With_firebase/PasswordWidget.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // final loginVM = Get.put(LoginViewModel());
//   final _formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         title: Text('login'.tr),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   EmailWidget(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   password_widget()
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             // LoginButtonWidget(
//             //   formKey: _formkey,
//             // )
//             RoundButton(
//               title: 'Login',
//               width: 200,
//               onPress: () {},
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
