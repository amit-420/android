import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teachersui/constants.dart';
import 'package:teachersui/screens/dashboard.dart';
import 'package:teachersui/screens/loding.dart';
import 'package:teachersui/services/database.dart';
import 'package:provider/provider.dart';
import 'package:teachersui/modelclass.dart';
import 'package:teachersui/screens/messenger.dart';

class OneSection1 extends StatefulWidget {
  final String section1;
  OneSection1({this.section1});
  @override
  _OneSection1State createState() => _OneSection1State();
}

class _OneSection1State extends State<OneSection1> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    //print(name);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
          debugPrint('menu pressed');
          Navigator.pushReplacementNamed(context, 'dashboard');
        }),
        title: Text(
          "${data['section']} Section",
          style: appbar_style,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: AbsentStudents(
              section: widget.section1,
            )),
          ],
        ),
      ),
    );
  }
}

class AbsentStudents extends StatefulWidget {
  final String section;
  AbsentStudents({this.section});
  @override
  _AbsentStudentsState createState() => _AbsentStudentsState();
}

final _control = TextEditingController();

class _AbsentStudentsState extends State<AbsentStudents> {
  List<String> noAbsent = [];
  String subject;
  final firebase = Firestore.instance;
  TeachersData teachersData;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Teacher>(context);
    return StreamBuilder<TeachersData>(
        stream: DataServices(uid: user.uid).teachersData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TeachersData teachersData = snapshot.data;
            return Container(
              margin: EdgeInsets.all(10),
              constraints: BoxConstraints.tightForFinite(
                  width: double.maxFinite, height: 300),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: noAbsent.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onLongPress: () {
                              removing(index);
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  border: Border.all(
                                      color: Colors.white10,
                                      width: 2,
                                      style: BorderStyle.solid)),
                              height: 25,
                              width: 20,
                              child: Text(
                                noAbsent[index],
                                style: TextStyle(
                                    color: Colors.indigo[500],
                                    letterSpacing: 2),
                              ),
                            ),
                          );
                        }),
                  ),
                  TextField(
                    controller: _control,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          adding(_control.text);
                          _control.clear();
                        },
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: false),
                    maxLength: 2,
                    onSubmitted: (userIn) {
                      debugPrint(userIn);
                      adding(userIn);
                      _control.clear();
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      print('foo()');
                      for (int i = 0; i < noAbsent.length; i++) {
                        _writing(i, widget.section, teachersData.subjectTeaching);
                        debugPrint('$noAbsent' + 'Uploaded');
                      }
                    },
                    child: Text(
                      'Submit final absent Numbers..',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.white10,
                    textColor: Colors.indigo[500],
                    splashColor: Colors.indigo[500],
                  )
                ],
              ),
            );
          } else if (snapshot.hasError){
            print(snapshot.error);
            return Loading(message: 'Encountered an error');

          }else{
            return Loading(message: 'Something else is going on');
          }
        });
  }

  void adding(String userInput) {
    setState(() {
      noAbsent.add(userInput);
    });
  }

  void removing(int index) {
    setState(() {
      noAbsent.removeAt(index);
    });
  }

  void _writing(int i, String section, String subject) async {
    return await firebase
        .collection('students_record_' + section)
        .document(noAbsent[i])
        .collection('absence_record')
        .document(subject)
        .setData({
      "absents": FieldValue.arrayUnion([DateTime.now()]),
      "absented_no": FieldValue.increment(1),
    }, merge: true).then((_) {
      debugPrint("data Uploaded");
    });
  }
}
