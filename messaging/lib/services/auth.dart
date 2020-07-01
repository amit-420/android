import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messaging/modelclass.dart';
import 'package:messaging/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Extracting uid from Student object
//  Student _userIdOfStudentFromFirebase(FirebaseUser user) {
//    return user != null ? Student(uid: user.uid) : null;
//  }

  Student _userIdOfStudentFromFirebase(FirebaseUser user) {
    return user != null ? Student(uid: user.uid) : null;
  }

  // getting user stream
  Stream<Student> get user {
    return _auth.onAuthStateChanged
        .map(_userIdOfStudentFromFirebase);
  }

  // registering user
  Future rWithEAndP(String name,String email, String subject, String section, String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DataServices(uid: user.uid).updateStuRecord(
        name, email, subject,section,
      );
      return _userIdOfStudentFromFirebase(result.user);
      }catch(e){
      print(e.toString());
      return null;
    }

  }

  // signing in database
  Future signInWithEAndP(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email , password: password);
      return _userIdOfStudentFromFirebase(result.user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}