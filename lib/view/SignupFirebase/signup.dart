import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/View_Models/controler/firebase_signup/FirebaseSignup.dart';
import 'package:news_app/res/routes/routes.dart';
import 'package:news_app/view/Login_With_firebase/google_Auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final SignupController _controller = Get.put(SignupController());

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
        title: Text('Signup in news App'),
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
                    'Signup',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    height: 80,
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
                    ),
                  ),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        child: Text('Sign Up'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GoogleAuth(),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(RouteName.loginView);
                      },
                      child:
                          Text('You already have an account? Please log in.')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
