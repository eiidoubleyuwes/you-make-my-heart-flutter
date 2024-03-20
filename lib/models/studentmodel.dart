class studentModel{
  final String sname;
  final String admissionum;
  final dynamic id;
 //Constructor
  studentModel({required this.sname, required this.admissionum, required this.id});
  //Special constructor to convert json to object
  factory studentModel.fromJson(Map<String, dynamic> json) {
    return studentModel(
      sname: json['sname']??'',
      admissionum: json['admissionum']??'',
      id: json['id']??'',
    );
  }
}