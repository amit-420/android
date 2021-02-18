import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_connect/modelclass.dart';

class DataServices {
  final String email;
  final String parEmail;
  DataServices({this.email, this.parEmail});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users_record");
  // final CollectionReference studentsCollection =
  // FirebaseFirestore.instance.collection('students_record');

  Future updateProRecord(String email, String gender, String age) async {
    return await userCollection.doc(email).set({
      'email': email.toLowerCase(),
      'gender': gender.toLowerCase(),
      'age': age.toLowerCase(),
    });
  }

  Future addPartnerMail(String parEmail) async {
    return await userCollection.doc(email).set({
      'partner_email': parEmail.toLowerCase(),
    },SetOptions(merge:true));
  }

  Future saveAns(String qno, String ans) async {
    return userCollection.doc(email).set({
      'Answers':{
        '$qno': ["",'$ans'],
      },
    },SetOptions(merge: true));
  }
  Future saveAnsPart(String qno, String ans) async {
    return userCollection.doc(parEmail).set({
      'Answers':{
        '$qno': ["$ans",""],
      },
    },SetOptions(merge: true));
  }

  UsersData _profDataFromSnapshot(dynamic value) {
    return UsersData(
        email: value['email'],
        gender: value['gender'],
        age: value['age'],
        parMail: value['partner_email'],
        answers: value['Answers']);
  }

  Stream<UsersData> get userdata {
    return userCollection.doc(email).snapshots().map(_profDataFromSnapshot);
  }
}
