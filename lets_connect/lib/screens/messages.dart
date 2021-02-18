import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Text('Something went wrong'),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String message;
  Loading({this.message});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child:Text('Loading.... $message')),
      ),
    );
  }
}
