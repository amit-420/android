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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading....'),
    );
  }
}
