import 'package:amitbrewform/screens/authenticate/authenticate.dart';
import 'package:amitbrewform/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:amitbrewform/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //print(user);

    //return either Home or Authenticate widget
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }

  }
}
