import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:myapp_flutter/views/customcontroller.dart';
import 'package:myapp_flutter/views/customtexts.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,),
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
                  hint: "Password",
                  icon: Icons.lock,
                  controller: password,
                  ispassword: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //Button to navigate to the login page
                custombutton(
                  label: 'Register',
                  labelColor: appWhiteColor,
                  action: () => Get.toNamed("/home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
