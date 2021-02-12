import 'package:firebase_auth/firebase_auth.dart';
import 'package:lets_connect/modelclass.dart';
import 'package:lets_connect/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Extracting uid from Student object
//  Student _userIdOfStudentFromFirebase(FirebaseUser user) {
//    return user != null ? Student(uid: user.uid) : null;
//  }

  Teacher _userIdOfTeacherFromFirebase(User user) {
    return user != null ? Teacher(uid: user.uid) : null;
  }

  // getting user stream
  Stream<Teacher> get user {
    return _auth.authStateChanges()
        .map(_userIdOfTeacherFromFirebase);
  }

  // registering user
  Future rWithEAndP(String email, String gender, String age, String password)async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      await DataServices(uid: user.uid).updateProRecord(
        email, gender, age,
      );
      return _userIdOfTeacherFromFirebase(userCredential.user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  // signing in database
  Future signInWithEAndP(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email , password: password);
      return _userIdOfTeacherFromFirebase(userCredential.user);
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