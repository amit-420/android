import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  final String uid;
  DataServices({this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users_record");
  // final CollectionReference studentsCollection =
  // FirebaseFirestore.instance.collection('students_record');

  Future updateProRecord(
      String email, String gender, String age) async {
    return await userCollection.doc(uid).set({
      'email': email.toLowerCase(),
      'gender': gender.toLowerCase(),
      'age': age.toLowerCase(),
    });
  }

  // TeachersData _profDataFromSnapshot(dynamic value) {
  //   return TeachersData(
  //       name: value.data['name'],
  //       subjectTeaching: value.data['subject_teaching'],
  //       section: value.data['section']);
  // }
  //
  // Stream<TeachersData> get teachersData {
  //   return profCollection.doc(uid).snapshots().map(_profDataFromSnapshot);
  // }
}
