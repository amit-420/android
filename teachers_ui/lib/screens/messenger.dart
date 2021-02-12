import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachersui/services/database.dart';
import 'package:teachersui/modelclass.dart';
import 'package:teachersui/screens/dashboard.dart';
import 'package:teachersui/constants.dart';

class OneSection2 extends StatefulWidget {
  final String name;
  OneSection2({this.name});
  @override
  _OneSection2State createState() => _OneSection2State();
}
class _OneSection2State extends State<OneSection2> {
  String name;

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messaging",style: appbar_style,textAlign: TextAlign.center,),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: DashBoard(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Messenger()),
          ],
        ),
      ),
    );
  }
}


class Messenger extends StatefulWidget {
  @override
  _MessengerState createState() => _MessengerState();
}
class _MessengerState extends State<Messenger> {
  List<String> message = [];
  final _control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      constraints: BoxConstraints.tightForFinite(width: double.maxFinite,height: 300),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: message.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color:
                      Colors.white10,width: 2,style: BorderStyle.solid),
                    ),
                    height: 25,
                    width: 20,
                    child: Text(message[index],style: TextStyle(color: Colors.indigo[500],letterSpacing: 2),),
                  );

                }),
          ),
          TextField(
            controller: _control,
            decoration: InputDecoration(filled: true,
              fillColor: Colors.white10,
              suffixIcon: IconButton(icon: Icon(Icons.send),onPressed: (){adding(_control.text);_control.clear();},),
            ),
            onSubmitted: (userIn) {
              debugPrint(userIn);
              _control.clear();
            },
          ),

        ],
      ),
    );
  }
  void adding(userInput){
    setState(() {
      message.add(userInput);
    });
  }
}