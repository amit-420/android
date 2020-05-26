import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OneSubject extends StatefulWidget {
  @override
  _OneSubjectState createState() => _OneSubjectState();
}

void _print(){
  debugPrint('Back pressed');
}

class _OneSubjectState extends State<OneSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.change_history,),),
        title: Text("Subject 1", style: TextStyle(letterSpacing: 2,),),
      ),
      body: Column(
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
                        child: ListTile(
                          title: Text('Assignment 1'),
                          subtitle: Text('Deadline'),
                        ),
                        margin: EdgeInsets.all(20),
                        color: Colors.yellow,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      child: Card(
                        child: ListTile(
                          title: Text('Assignment 2'),
                          subtitle: Text('Deadline'),
                        ),
                        margin: EdgeInsets.all(20),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      child: Card(
                        child: ListTile(
                          title: Text('Assignment 3',style: TextStyle(fontSize: 20),),
                          subtitle: Text('Deadline'),
                        ),
                        margin: EdgeInsets.all(20),
                        color: Colors.green,
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
                color: Colors.orange,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Messaging & FeedBack',style: TextStyle(letterSpacing: 3,fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,)
                ],
              ),
            ),
          )
        ],
      ),
      );

  }
}

