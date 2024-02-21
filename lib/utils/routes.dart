import 'package:get/get.dart';
import 'package:myapp_flutter/pages/login.dart';

class Routes {
  var routes = [
    GetPage(name: "/", page: () => Login()),// First screen is represented by the / route meaning the root of the app.
    GetPage(name: "/login", page: () => Login()),
  ];
}
