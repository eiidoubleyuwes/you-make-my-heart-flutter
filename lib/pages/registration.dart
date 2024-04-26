import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:myapp_flutter/views/customcontroller.dart';
import 'package:myapp_flutter/views/customtexts.dart';
import 'package:http/http.dart' as http;

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confpassword = TextEditingController();
TextEditingController email = TextEditingController();

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                //Created a widget for the text
                Image.asset(
                  "assets/images/applogo.png",
                  height: 200,
                  width: 300,
                ),
                const customText(
                  "Registration Screen",
                  label: 'Registration Page',
                  fontSize: FontSize(24.0),
                  fontWeight: FontWeight.bold,
                ),
                const customText(
                  "Username",
                  label: 'Username',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  hint: "Username",
                  icon: Icons.person,
                  controller: username,
                  ispassword: false,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const customText(
                  "Email",
                  label: 'Email',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  hint: "Email",
                  icon: Icons.email,
                  controller: email,
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
                  icon: Icons.lock,
                  controller: password,
                  ispassword: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const customText(
                  "Retype Password",
                  label: 'Retype Password',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  hint: "Retype Password",
                  icon: Icons.lock,
                  controller: confpassword,
                  ispassword: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //Button to navigate to the login page
                custombutton(
                    label: 'Register',
                    labelColor: appWhiteColor,
                    action: () {
                      register();
                      //Delete everything from the controllers
                      username.clear();
                      email.clear();
                      password.clear();
                      confpassword.clear();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> register() async {
  var waitforsnakbar = false;
  if (password.text.trim() == confpassword.text.trim() &&
      username.text.isNotEmpty &&
      email.text.isNotEmpty &&
      password.text.isNotEmpty &&
      confpassword.text.isNotEmpty &&
      !waitforsnakbar) {
    http.Response response;
    response = await http.post(
      Uri.parse("http://barakambuguaon.top/news/register.php"),
      body: {
        "username": username.text.trim(),
        "email": email.text.trim(),
        "password": password.text.trim(),
      },
    );
    Get.snackbar("Passwords match", "Please procced to login again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    waitforsnakbar = true;
    await Future.delayed(const Duration(seconds: 1));
    waitforsnakbar = false;
    Get.toNamed("/login");
  } else if (password.text.trim() != confpassword.text.trim()) {
    Get.snackbar("Passwords don't match", "Please retype the password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  } else {
    Get.snackbar("Registration Failed", "Please fill in all the fields",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }
}
