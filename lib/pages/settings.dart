import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/custombutton.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoggedIn = false;
  String username = '';
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoggedIn)
              Column(
                children: [
                  Text('Logged in as: $username'),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  SizedBox(height: 20),
                ],
              )
            else
              Column(
                children: [
                  Text('No account signed in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ferrariyellow)),
                  SizedBox(height: 20),
                  custombutton(label: "Login" ,action: () {
                    Get.toNamed('/login');
                  }),
                  SizedBox(height: 20),
                 custombutton(label: "Register", action: () {
                    Get.toNamed('/registration');
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
