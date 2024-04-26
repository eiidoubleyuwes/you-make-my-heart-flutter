import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:myapp_flutter/views/custombutton.dart';
import 'package:http/http.dart' as http;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String username = ''; // Placeholder for the username from the server

  @override
  void initState() {
    super.initState();
    // Fetch the username from the server and update the state
    fetchUsername().then((value) {
      setState(() {
        username = value;
      });
    });
  }

  Future<String> fetchUsername() async {
    // Simulate an API call to fetch the username from the server
    http.Response response;
    response = await http.get(Uri.parse("http://barakambuguaon.top/news/username.php"));
    
    // Return the username from the response
    return response.body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username: $username',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            custombutton(label: "Sign out/up", action: () => Get.offAndToNamed("/login")),
            ],
        ),
      ),
    );
  }
}