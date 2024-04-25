
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:myapp_flutter/views/customtexts.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeEnabled = false;
  bool _notificationsEnabled = true;

  final damn = const Color(0xFFEC0023); // F1 Red


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return SwitchListTile(
              title: const customText(
                "Dark Mode",
                label: 'Birthday reminder',
                fontWeight: FontWeight.bold,
              ),
              value: _darkModeEnabled,
              activeColor: ferrariyellow,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;// Call updateTheme method
                });
              },
            );
          case 1:
            return SwitchListTile(
              title: customText(
                "Notifications",
                label: 'Notifications',
                fontWeight: FontWeight.bold,
                color: damn,
              ),
              value: _notificationsEnabled,
              activeColor: ferrariyellow,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            );
          //Custom button to route back to the login page once clicked
          case 2:
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: custombutton(
                  label: 'Account',
                  labelColor: appWhiteColor,
                  //The button should not fill the screen
                  action: () => Get.toNamed("/login")),
            );
          default:
            return const SizedBox(); // Handle potential out-of-bounds index
        }
      },
    );
  }
}
