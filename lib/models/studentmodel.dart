class studentModel{
  final String sname;
  final String admissionum;
 //Constructor
  studentModel({required this.sname, required this.admissionum});
  //Special constructor to convert json to object
  factory studentModel.fromJson(Map<String, dynamic> json) {
    return studentModel(
      sname: json['sname'],
      admissionum: json['admissionum'],
    );
  }
}