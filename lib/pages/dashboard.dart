import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/controllers/homecontroller.dart';
import 'package:myapp_flutter/pages/news.dart';
import 'package:myapp_flutter/pages/racewinners.dart';
import 'package:myapp_flutter/pages/rumors.dart';
import 'package:myapp_flutter/pages/settings.dart';

HomeController homeController = Get.put(HomeController());

var pages = [ 
  const newsPage(),
  //Space for a list of all race winners 
  RaceWinnersPage(),
  //Predictions page
  RumorsPage(),
  //Account management page
  SettingsPage(),
];

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Parc Ferme'),
          centerTitle: true,
          backgroundColor: appWhiteColor,
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
            color: primaryColor,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          )),
      body:  
      //Setting default to index
         Obx(() => pages[homeController.selectedPage.value]) ,
          // F1 News Section
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        color: appWhiteColor,
        items: const [
          Icon(Icons.history_edu_sharp),
          Icon(Icons.emoji_events_sharp),
          Icon(Icons.track_changes_outlined),
          Icon(Icons.settings),
        ],
        onTap: (index) {
          homeController.updateSelectedPage(index);
        },
      ),
    );
  }
}
