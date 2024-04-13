import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:myapp_flutter/views/customcontroller.dart';
import 'package:myapp_flutter/views/customtexts.dart';

const adminUsername = 'admin';
const adminPassword = 'admin';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Username",
                  label: 'Username',
                  hint: "Username/email",
                  icon: Icons.person,
                  controller: usernameController,
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
                  "PASSWORD",
                  label: 'password',
                  hint: "Password",
                  icon: Icons.lock,
                  hideText: true,
                  ispassword: true,
                  controller: passwordController,
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
                      if (usernameController.text == adminUsername &&
                          passwordController.text == adminPassword) {
                        Get.toNamed("/home"); // Redirect to dashboard area
                      } else {
                        setState(() {
                          // Highlight text fields in red
                          usernameController.text = ""; // Clear username field
                          passwordController.text = ""; // Clear password field
                          usernameController.selection =
                              TextSelection.fromPosition(const TextPosition(
                                  offset:
                                      0)); // Place cursor at the beginning of username field
                          passwordController.selection =
                              TextSelection.fromPosition(const TextPosition(
                                  offset:
                                      0)); // Place cursor at the beginning of password field
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid username or password"),
                            backgroundColor: primaryColor,
                          ),
                        );
                      }
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

  void setState(Null Function() param0) {}
}
