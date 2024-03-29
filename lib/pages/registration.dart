import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/pages/login.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:myapp_flutter/views/customcontroller.dart';
import 'package:myapp_flutter/views/customtexts.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
          title: Text('Formula Dart'),
          centerTitle: true,
          backgroundColor: primaryColor,
          foregroundColor: appWhiteColor,
          titleTextStyle: TextStyle(
            color: headercolor,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Created a widget for the text
                Image.asset(
                  "assets/images/applogo.png",
                  height: 200,
                  width: 300,
                ),
                customText(
                  "Registration Screen",
                  label: 'Registration Page',
                  fontSize: FontSize(24.0),
                  fontWeight: FontWeight.bold,
                ),
                customText(
                  "Username",
                  label: 'Username',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  "Username",
                  label: 'Username',
                  hint: "Username",
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 10.0,
                ),
                customText(
                  "Phome number/email",
                  label: 'Phone number/email',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  "Phone number/email",
                  label: 'Phone number/email',
                  hint: "Phone number/Email",
                  icon: Icons.phone,
                ),
                SizedBox(
                  height: 10.0,
                ),

                customText(
                  "Password",
                  label: 'Password',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  "PASSWORD",
                  label: 'password',
                  hint: "Password",
                  icon: Icons.lock,
                  hideText: true,
                  ispassword: true,
                ),
                SizedBox(
                  height: 10.0,
                ),
                customText(
                  "Retype Password",
                  label: 'Retype Password',
                  fontSize: FontSize(18.0),
                ),
                CustomTextWidget(
                  "PASSWORD",
                  label: 'password',
                  hint: "Password",
                  icon: Icons.lock,
                  hideText: true,
                  ispassword: true,
                ),
                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 10.0,
                ),

                //Button to navigate to the login page
                custombutton(
                  label: 'Register',
                  labelColor: appWhiteColor,
                  action: () => Get.toNamed("/login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
