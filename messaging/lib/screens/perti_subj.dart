import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OneSubject extends StatefulWidget {

  @override
  _OneSubjectState createState() => _OneSubjectState();
}

class _OneSubjectState extends State<OneSubject> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.change_history,),),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text(data['title'], style: TextStyle(fontSize: 20,letterSpacing: 4,color: Colors.white10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,strutStyle: StrutStyle(height: 5),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: <Widget>[
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
                              title: Text('Assignment 1',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.redAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              subtitle: Text('Deadline',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.redAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                              title: Text('Assignment 2',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.greenAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              subtitle: Text('Deadline',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.greenAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                              title: Text('Assignment 3',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.yellowAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              subtitle: Text('Deadline',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.yellowAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
              onTap: (){
                Navigator.pushNamed(context, 'm_ui');
                debugPrint('Entering messages');
              },
              child: Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.elliptical(80, 100),bottomRight: Radius.elliptical(10, 150))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Me&FeedBack',style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.indigoAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      );

  }
}

