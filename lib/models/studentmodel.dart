class studentModel{
  final String sname;
  final String admissionum;
  final String id;
  final String image;
 //Constructor
  studentModel({required this.sname, required this.admissionum, required this.id, required this.image});
  //Special constructor to convert json to object
  factory studentModel.fromJson(Map<String, dynamic> json) {
    return studentModel(
      sname: json['sname']??'',
      admissionum: json['admissionum']??'',
      id: json['id']??'',
      image: json['image']??'',
    );
  }
}