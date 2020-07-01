import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices{

  final String uid;
  static String section;
  DataServices({this.uid});

final CollectionReference profCollection = Firestore.instance.collection("profs_record");
final CollectionReference stuCollection = Firestore.instance.collection('students_record_'+section);


Future updateStuRecord(String name,String email, String rollno, String section) async {
  return await Firestore.instance.collection('students_record_'+section).document(rollno).setData({
    'name':name,
    'email':email,
    'rollno':rollno,
    'section':section,
  });
}

Future<String> getstuRecord(String rollno) async {
    String name;
    await stuCollection.document(rollno).get().then((value) {name = value.data['name'];});
    return name;

}
}