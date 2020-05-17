import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_detail.dart';
import 'package:notekeeper/screens/notelist.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: NoteDetail(),
    );


  }
}
