import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachersui/screens/authentication/register.dart';
import 'package:teachersui/screens/dashboard.dart';
import 'package:teachersui/screens/loding.dart';
import 'package:teachersui/screens/messenger.dart';
import 'package:teachersui/screens/onesection.dart';
import 'package:teachersui/screens/authentication/login.dart';
import 'package:teachersui/modelclass.dart';
import 'package:teachersui/services/auth.dart';
import 'package:teachersui/services/database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Teacher>.value(
        value: AuthService().user,
        child:MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes:{
              '/': (context) => Wrapper(),
              'dashboard':(context) => DashBoard(),
              'absents':(context) => OneSection1(),
              'register': (context)=> Register(),
              'login': (context)=> Login(),
              'message': (context)=> OneSection2(),
              'loading': (context)=> Loading(),
        }

        ),

    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Teacher>(context);
    if (user == null) {
      return Login();
    }
    else{
      return DashBoard();
    }
  }
}


