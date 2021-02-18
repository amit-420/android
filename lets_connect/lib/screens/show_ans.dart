import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_connect/modelclass.dart';
import 'package:lets_connect/screens/messages.dart';
import 'package:lets_connect/services/database.dart';
import 'package:provider/provider.dart';



class ShowAns extends StatefulWidget {
  @override
  _ShowAnsState createState() => _ShowAnsState();
}

class _ShowAnsState extends State<ShowAns> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<Human>(context);
    data = ModalRoute.of(context).settings.arguments;
    final qno = data['qno'];
    return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Both answers'),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Card(color: Colors.blue,elevation: 0,
                  margin: EdgeInsets.all(10),
                  child: Container(
                      height: 200,
                      width: 200,
                      child: Answer1(qno)),
                  ),
                  Card(color: Colors.blue,elevation: 0,
                    margin: EdgeInsets.all(10),
                    child: Container(
                        height: 200,
                        width: 200,
                        // child: Answer2(data['qno'])
                      child: Answer2(qno),
                    ),
                  ),
                  RaisedButton(onPressed:(){
                    Navigator.of(context).pushReplacementNamed('showqns',arguments: {'paremail': data['paremail']});
                  },
                    child: Text(
                      'Next Question..',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.indigo[500],
                  ),
                ],
            ),
          ),
        );
  }
}

class Answer1 extends StatelessWidget {
  final int Qno;

  Answer1(this.Qno);
  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<Human>(context);
    DocumentReference ques = FirebaseFirestore.instance.collection('users_record').doc(user.email);

    return FutureBuilder<DocumentSnapshot>(
      future: ques.get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data()['Answers'];
          return Text("$Qno ${data['$Qno'][1]}");
        }

        return Text("loading");
      },
    );
  }
}


class Answer2 extends StatelessWidget {
  final int Qno;

  Answer2(this.Qno);
  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<Human>(context);

    return StreamBuilder<UsersData>(

      stream: DataServices(email: user.email).userdata,
      builder: (BuildContext context, AsyncSnapshot<UsersData> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if (snapshot.hasData){
          UsersData data = snapshot.data;
        return Text(data.answers['$Qno'][0]);}
        return Loading();
      },
    );
  }
}