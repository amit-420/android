import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OneSubject extends StatefulWidget {

//  final String title;
//  OneSubject(this.title);
  @override
  _OneSubjectState createState() => _OneSubjectState();
}
void _print(){
  debugPrint('Back pressed');
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
        title: Text(data['title'], style: TextStyle(letterSpacing: 2),),
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.elliptical(80, 100),bottomRight: Radius.elliptical(10, 150))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Messaging & FeedBack',style: TextStyle(letterSpacing: 3,fontSize: 17,fontWeight:FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,)
                ],
              ),
            ),
          )
        ],
      ),
      );

  }
}

