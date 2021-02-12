import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messaging/modelclass.dart';

class DataServices{

  final String uid;
  final String subject;
  final Map data;
  DataServices({this.uid,this.subject,this.data});

final CollectionReference profCollection = Firestore.instance.collection("profs_record");
final CollectionReference stuCollection = Firestore.instance.collection('students_record');


Future updateStuRecord(String name,String email, String rollno, String section) async {
  return await Firestore.instance.collection('students_record').document(uid).setData({
    'name':name,
    'email':email,
    'rollno':rollno,
    'section':section,
  });
}
  StudentData _stuDataFromSnapshot(dynamic value) {
    return StudentData(
        name: value['name'],
        rollno: value['rollno'],
        section: value['section'],
        subject: null);
  }

  Percent _percent(dynamic done){
    var total;
    var end;
    Firestore.instance.collection('lectures_done_${data['section']}')
        .document(data['title']).get()
        .then((value) {
      print(value.data['lectures_done'].toString());
      total = value.data['lectures_done'];});
    end = (total - done )/total;
    print(end);
  return Percent(
    no: end,
  );
  }
Stream<StudentData> get studentData{
  return stuCollection.document(uid).snapshots().map(_stuDataFromSnapshot);
}


Stream<Percent> get percent {
  return Firestore.instance
          .collection('students_record_${data['section']}')
          .document('${data['rollno']}')
          .collection('absence_record')
          .document(data['title'])
          .snapshots().map((value1)=> _percent(value1));
}


}