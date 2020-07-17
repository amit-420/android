import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachersui/modelclass.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataServices {
  final String uid;
  DataServices({this.uid});

  final CollectionReference profCollection =
      Firestore.instance.collection("profs_record");
  final CollectionReference studentsCollection =
      Firestore.instance.collection('students_record');

  Future updateProRecord(
      String name, String email, String subject, List<String> section) async {
    return await profCollection.document(uid).setData({
      'name': name.toUpperCase(),
      'email': email.toLowerCase(),
      'subject_teaching': subject.toUpperCase(),
      'section': section,
    });
  }

  TeachersData _profDataFromSnapshot(dynamic value) {
    return TeachersData(
        name: value.data['name'],
        subjectTeaching: value.data['subject_teaching'],
        section: value.data['section']);
  }

  Stream<TeachersData> get teachersData {
    return profCollection.document(uid).snapshots().map(_profDataFromSnapshot);
  }
}
