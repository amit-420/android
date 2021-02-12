import 'package:flutter/material.dart';
final textStyleSubjects = TextStyle(
    fontSize: 20,
    letterSpacing: 3,
    color: textColor,
    fontWeight: FontWeight.bold);

final textStyleAssLow = TextStyle(
    fontSize: 20,
    letterSpacing: 3,
    color: Colors.greenAccent[400],
    fontWeight: FontWeight.bold);

final textStyleAssMed = TextStyle(
    fontSize: 20,
    letterSpacing: 3,
    color: Colors.orangeAccent[400],
    fontWeight: FontWeight.bold);

final textStyleAssHig = TextStyle(
    fontSize: 20,
    letterSpacing: 3,
    color: Colors.redAccent[400],
    fontWeight: FontWeight.bold);

const appbar_text_Style = TextStyle(
    fontSize: 20,
    letterSpacing: 4,
    color: Colors.white10,
    fontWeight: FontWeight.bold);

final textColor = Colors.indigoAccent[400];


final textStyleInput = TextStyle(
    fontSize: 15,
    color: Colors.indigoAccent,
    fontWeight: FontWeight.bold);

final textStyleNormal = TextStyle(
  fontSize: 15,
  color: Colors.indigoAccent[400],);

const appbar_style = TextStyle(
    fontSize: 20,
    letterSpacing: 4,color: Colors.white10,
    fontWeight: FontWeight.bold);

Color colourChoice(dynamic percent){
  debugPrint('color $percent');
  if(percent <= 0.75){
    return Colors.redAccent[400];
  }else{
    return Colors.greenAccent[400];
  }
}



