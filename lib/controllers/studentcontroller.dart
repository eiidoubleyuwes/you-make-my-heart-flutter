import 'package:get/get.dart';

//This code is to update the application once the server sends information
class StudentController extends GetxController {
  final studentList = [].obs;
  final loadingstudentdata = true.obs;
  //A function to update the student list
  updateStudentlist(list) {
    studentList.value = list;
  }

  updateloadingstudentdata(loading) {
    loadingstudentdata.value = loading;
  }
}
