import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class HeathApp extends StatefulWidget {
  @override
  _HeathAppState createState() => _HeathAppState();
}

class _HeathAppState extends State<HeathApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('welcome back!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.pinkAccent[100],
                letterSpacing: 2.0,
              ),),
          ),

    );
  }
}
