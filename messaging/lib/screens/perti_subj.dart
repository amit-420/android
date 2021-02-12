import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messaging/constants.dart';
import 'package:messaging/modelclass.dart';
import 'package:messaging/services/database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OneSubject extends StatefulWidget {

  @override
  _OneSubjectState createState() => _OneSubjectState();
}

class _OneSubjectState extends State<OneSubject> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute
        .of(context)
        .settings
        .arguments;
    return StreamBuilder<Percent>(
      stream: DataServices(data: data).percent,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Percent percent = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.change_history,),),
              centerTitle: true,
              backgroundColor: Colors.black87,
              elevation: 0,
              title: Text(data['title'], style: appbar_text_Style,
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(height: 5),),
            ),
            body: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    child: CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 15.0,
                      percent: percent.no,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        '${percent.no * 100}', style: appbar_text_Style,),
                      header: new Text("Presenty:", style: textStyleAssHig),
                      backgroundColor: Colors.white10,
                      progressColor: colourChoice(percent),
                    ),
                  ),
                  Container(
                    height: 350,
                    child: ListView(
                      dragStartBehavior: DragStartBehavior.down,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 300,
                          child: Card(
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  'Assignment 1', style: textStyleAssHig,
                                  textAlign: TextAlign.center,),
                                subtitle: Text(
                                  'Deadline', style: textStyleAssHig,
                                  textAlign: TextAlign.center,),
                              ),
                            ),
                            margin: EdgeInsets.all(20),
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          child: Card(
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  'Assignment 2', style: textStyleAssLow,
                                  textAlign: TextAlign.center,),
                                subtitle: Text(
                                  'Deadline', style: textStyleAssLow,
                                  textAlign: TextAlign.center,),
                              ),
                            ),
                            margin: EdgeInsets.all(20),
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          child: Card(
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  'Assignment 3', style: textStyleAssMed,
                                  textAlign: TextAlign.center,),
                                subtitle: Text(
                                  'Deadline', style: textStyleAssMed,
                                  textAlign: TextAlign.center,),
                              ),
                            ),
                            margin: EdgeInsets.all(20),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'm_ui');
                      debugPrint('Entering messages');
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.elliptical(80, 100),
                              bottomRight: Radius.elliptical(10, 150))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Me&FeedBack', style: TextStyle(fontSize: 20,
                              letterSpacing: 3,
                              color: Colors.indigoAccent[400],
                              fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }else{
          return Scaffold(
            body:Container(
              child: Text("something is wrong"),
            ),
          );
        }
      }
    );
  }




}