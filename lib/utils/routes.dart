import 'package:get/get.dart';
import 'package:myapp_flutter/pages/dashboard.dart';
import 'package:myapp_flutter/pages/login.dart';
import 'package:myapp_flutter/pages/registration.dart';
import 'package:myapp_flutter/pages/settings.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => const Login()),// First screen is represented by the / route meaning the root of the app.
    GetPage(name: "/registration", page: () => const RegistrationPage()),
    GetPage(name: "/home", page: () => const Dashboard()),
    GetPage(name: "/settings", page: () => SettingsPage()),
  ];
}
