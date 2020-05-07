import 'package:amitbrewform/screens/authenticate/authenticate.dart';
import 'package:amitbrewform/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:amitbrewform/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:amitbrewform/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),

      ),
    );
  }
}



