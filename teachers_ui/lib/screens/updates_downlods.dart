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
import 'package:teachersui/screens/dashboard.dart';

class OneSection3 extends StatefulWidget {

  @override
  _OneSection3State createState() => _OneSection3State();
}

class _OneSection3State extends State<OneSection3> {
  final List<Link> list = [
    Link(displayName: "Daily Update 1", url: '/'),
    Link(displayName: "Daily Update 2", url: '/'),
    Link(displayName: "Daily Update 3", url: '/'),
    Link(displayName: "Monthly Downloads", url: '/'),
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
                  'Updates & content',
                  style: appbar_style,
                ),
                backgroundColor: Colors.lightBlue,
                elevation: 0,
                centerTitle: true,
              ),
              drawer: DashBoard(),
              body: Container(
                color: Colors.white,
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
