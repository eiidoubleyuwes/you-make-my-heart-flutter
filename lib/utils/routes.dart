import 'package:get/get.dart';
import 'package:myapp_flutter/pages/api_test.dart';
import 'package:myapp_flutter/pages/calender.dart';
import 'package:myapp_flutter/pages/dashboard.dart';
import 'package:myapp_flutter/pages/login.dart';
import 'package:myapp_flutter/pages/registration.dart';
import 'package:myapp_flutter/pages/settings.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => Login()),// First screen is represented by the / route meaning the root of the app.
    GetPage(name: "/registration", page: () => RegistrationPage()),
    GetPage(name: "/home", page: () => Dashboard()),
    GetPage(name: "/Calender", page: () => CalendarPage()),
    GetPage(name: "/api_test", page: () => Api_test()),
    GetPage(name: "/settings", page: () => SettingsPage()),
  ];
}
