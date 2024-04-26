import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp_flutter/utils/routes.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/login", // Change the initial route to /home since account creation is not necessary
    debugShowCheckedModeBanner: false,
    getPages: Routes.routes,  // Add the routes
  ));
}







