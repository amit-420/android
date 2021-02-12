import 'package:flutter/material.dart';
import 'package:lets_connect/constants.dart';
import 'package:lets_connect/services/auth.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          body: Center(child: Text('hello world')),
          floatingActionButton: FlatButton(
            onPressed: () async {
              AuthService().signOut();
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Text(
              "Logout",
              style: textStyleSubjects,
            ),
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
