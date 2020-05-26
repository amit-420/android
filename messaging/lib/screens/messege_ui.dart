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
void _print(string){
  debugPrint(string);
}

class _MBoardState extends State<MBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              child:Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                          onSubmitted: (context)=> _print(context),
                          decoration: InputDecoration(hintText: 'message here')),
                  ),
          ),

        ],
      ),
    );
  }
}

