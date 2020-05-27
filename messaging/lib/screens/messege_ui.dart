import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MesUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('messaging Center',style: TextStyle(fontSize: 20,),),
      ),
      body: MBoard(),
    );
  }
}

class MBoard extends StatefulWidget {
  @override
  _MBoardState createState() => _MBoardState();
}
void _print(String string){
  debugPrint(string);
}

class _MBoardState extends State<MBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.limeAccent[400],
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child:Row(
                children: <Widget>[
                  Container(
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 320,
                          margin: EdgeInsets.fromLTRB(8, 0, 2, 0),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextField(
                              onSubmitted: (context)=> _print(context),
                              decoration: InputDecoration(hintText: 'message here')),
                      ),
                  IconButton(
                    onPressed: (){
                      _print('Drop down menu');
                    },
                    iconSize: 35,
                    icon: Icon(
                        Icons.attach_file),)
                ],
              ),
          ),

        ],
      ),
    );
  }
}

