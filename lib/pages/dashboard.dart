import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/controllers/homecontroller.dart';
import 'package:myapp_flutter/pages/news.dart';
import 'package:myapp_flutter/pages/settings.dart';
import 'package:myapp_flutter/views/newscards.dart';

HomeController homeController = Get.put(HomeController());

var pages = [ 
  newsPage(),
  SettingsPage(),
  //Text("Settings"),
];

class Dashboard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Formula Dart'),
          centerTitle: true,
          backgroundColor: primaryColor,
          foregroundColor: appWhiteColor,
          titleTextStyle: TextStyle(
            color: headercolor,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          )),
      body:  
         Obx(() => pages[homeController.selectedPage.value]) ,
          // F1 News Section
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        items: [
          Icon(Icons.home),
          Icon(Icons.calendar_month),
          Icon(Icons.settings),
        ],
        onTap: (index) {
          homeController.updateSelectedPage(index);
        },
      ),
    );
  }
}
