import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachersui/constants.dart';
import 'package:teachersui/main.dart';
import 'package:teachersui/modelclass.dart';
import 'package:teachersui/screens/loding.dart';
import 'package:teachersui/screens/messenger.dart';
import 'package:teachersui/screens/onesection.dart';
import 'package:teachersui/services/auth.dart';
import 'package:teachersui/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<Link> list = [
    Link(displayName: "Assignment Distro", url: 'message'),
    Link(displayName: "Syllabus Tracking", url: 'message'),
  ];
  TeachersData teachersData;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Teacher>(context);
    return StreamBuilder<TeachersData>(
        stream: DataServices(uid: user.uid).teachersData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TeachersData teachersData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'DashBoard',
                  style: appbar_style,
                ),
                backgroundColor: Colors.black87,
                elevation: 0,
                centerTitle: true,
              ),
              body: Container(
                color: Colors.black87,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      teachersData.name,
                      style: textStyleSubjects,
                    ),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text('Sections',style: textStyleSubjects,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GridView.builder(
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: teachersData.section.length),
                          itemCount: teachersData.section.length,
                          itemBuilder: (BuildContext context, int index){
                            return GestureDetector(
                              onTap:(){
                                debugPrint('button tapped');
                                Navigator.pushReplacementNamed(context, 'absents',arguments: {'section':teachersData.section[index]});},
                              child: Card(
                                color: Colors.black87,
                                child: Center(child: Text(teachersData.section[index],style: textStyleSubjects,)),
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, list[index].url);
                                },
                                child: Card(
                                  margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
                                  color: Colors.black87,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          list[index].displayName,
                                          style: textStyleSubjects,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ),
                    GestureDetector(
                        onTap: () {
                          AuthService().signOut();
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        child: Card(
                          margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
                          color: Colors.black87,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Logout',
                                  style: textStyleSubjects,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          }else if (snapshot.hasError){
            return Loading(message: 'Encountered an error ${snapshot.error}',);
          }else if (snapshot == null){
            return Loading(message: 'snapshot has no data' ,);
          }
          else {
            return Loading(message: 'Something else is going on ',);
          }
        });
  }
}
