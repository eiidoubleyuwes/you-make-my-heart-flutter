import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:myapp_flutter/views/customcontroller.dart';
import 'package:myapp_flutter/views/customtexts.dart';
import 'package:http/http.dart' as http;

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                //Created a widget for the text
                Image.asset(
                  "assets/images/applogo.png",
                  height: 200,
                  width: 300,
                ),
                const customText(
                  "Login Screen",
                  label: 'Login Page',
                  fontSize: FontSize(24.0),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10.0,
                ),

                const customText(
                  "Username",
                  label: 'Username',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  hint: "Username",
                  icon: Icons.person,
                  controller: usernameController,
                  ispassword: false,
                ),
                const SizedBox(
                  height: 10.0,
                ),

                const customText(
                  "Password",
                  label: 'Password',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  hint: "Password",
                  controller: passwordController,
                  icon: Icons.lock,
                  ispassword: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),

                const customText(
                  "Forgot password",
                  label: 'Forgot password?',
                  fontSize: FontSize(18.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                custombutton(
                    label: 'Login',
                    labelColor: appWhiteColor,
                    action: () {
                      login();
                      //clear the text fields
                      usernameController.clear();
                      passwordController.clear();
                    }),

                const SizedBox(
                  height: 10.0,
                ),

                //Button to navigate to the registration page
                custombutton(
                  label: 'Register',
                  action: () => Get.toNamed("/registration"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    http.Response response;
    response = await http.get(Uri.parse("http://barakambuguaon.top/news/login.php?username=${usernameController.text.trim()}&password=${passwordController.text.trim()}"));
    if (response.statusCode == 200) {
      var serverResponse = jsonDecode(response.body);
      int login = serverResponse['success'];
      if (login == 1) {
        Get.toNamed("/home");
      } else {
        Get.snackbar("Login Failed", "Invalid username or password",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      print("Failed to login ${response.statusCode}");
    }
  }
}
