import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_test extends StatelessWidget {
  const Api_test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              getAPI();
            },
            child: Text('Get Data'),
          ),
        ],
      ),
    );
  }
//Read data from API
  Future<void>? getAPI() async {
    http.Response response;
    //converts the URL to URI
    response = await http.get(Uri.parse("http://barakambuguaon.top/student/read.php"));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Failed to load data ${response.statusCode}');
    }
  }
}
