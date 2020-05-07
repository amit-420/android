import 'package:amitbrewform/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amitbrewform/models/brew.dart';
class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');


  Future updateUserData(String sugars,String name,int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength':strength,
    });
  }

  //brew list from the snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars:  doc.data['sugars'] ?? '0'
      );
    }).toList();

  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']
    );
  }

  //get brews stream
Stream<List<Brew>> get brews{
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
}

// get user doc stream
Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
}

}