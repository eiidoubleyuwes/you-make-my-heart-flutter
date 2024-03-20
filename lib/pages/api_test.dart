import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart' as http;
import 'package:myapp_flutter/controllers/studentcontroller.dart';
import 'package:myapp_flutter/models/studentmodel.dart';

StudentController studentController = Get.put(StudentController());

class Api_test extends StatelessWidget {
  const Api_test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test'),
      ),
      body: Obx(
        () => Column(
          children: [
            ElevatedButton(onPressed: getAPI, child: Text('Get Data')),
            ListView.builder(
              shrinkWrap: true,
              itemCount: studentController.studentList.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  Text('${studentController.studentList[index].sname}'),
                  Text('${studentController.studentList[index].admissionum}'),
                  Text('${studentController.studentList[index].id}'),

                ]);
              },
            ),
          ],
        ),
      ),
    );
  }

//Read data from API
  Future<void>? getAPI() async {
    try {
      http.Response response;
      //converts the URL to URI
      response = await http
          .get(Uri.parse("http://barakambuguaon.top/student/read.php"));
      if (response.statusCode == 200) {
        var studentResponse = json.decode(response.body);
        var studentDataResponse = studentResponse['data'];
        var newlist = studentDataResponse
            .map((students) => studentModel.fromJson(students))
            .toList();
        studentController.updateStudentlist(newlist);
      } else {
        print("Failed to get data {response.statusCode}");
      }
      studentController.updateloadingstudentdata(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
