import 'package:flutter/material.dart';
import 'package:messaging/modelclass.dart';
import 'package:messaging/screens/messege_ui.dart';
import 'package:messaging/screens/perti_subj.dart';
import 'package:messaging/screens/subjects_grid.dart';
import 'package:messaging/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:messaging/screens/authentication/register.dart';
import 'package:messaging/screens/authentication/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Student>.value(
      value: AuthService().user,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Chat Screen',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context)=> Wrapper(),
            'pert_subj': (context) => OneSubject(),
            'm_ui': (context)=> MesUI(),
            'grid': (context)=>SubjectGrid(),
            'register': (context)=> Register(),
            'login': (context)=> Login(),
          }
        );
      }
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Student>(context);
    if (user == null) {
      return Login();
    }
    else{
      return SubjectGrid();
    }
  }
}


