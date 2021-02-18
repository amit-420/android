import 'dart:math';
import 'package:lets_connect/modelclass.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:lets_connect/constants.dart';
import 'package:lets_connect/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_connect/services/database.dart';


class ShowQns extends StatelessWidget {

  final random = Random(4);
  @override
  Widget build(BuildContext context) {
    Map data = {};
    String answer = '';
    int qno = random.nextInt(4) + 1;
    final user =  Provider.of<Human>(context);
    data = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Game starts Here..."),

          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(color: Colors.blue,elevation: 0,
                margin: EdgeInsets.all(10),
                child: Container(
                    height: 200,
                    width: 200,
                    child: Questions(random.nextInt(4)+1)),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Answer',labelStyle: textStyleNormal),
                style: textStyleInput,
                validator: (val) => val.isEmpty ? 'Enter the flag' : null,

                onChanged: (val){
                  answer = val;

                },
              ),
              RaisedButton(onPressed:(){
                DataServices(email: user.email).saveAns(qno.toString(), answer);
                DataServices(parEmail: data['paremail']).saveAnsPart(qno.toString(), answer);
                Navigator.of(context).pushReplacementNamed('showans',arguments: {'qno':qno , 'paremail': data['paremail']});
              },
                child: Text(
                  'Submit and Next..',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.indigo[500],
              ),
            ],
          ),
          floatingActionButton: FlatButton(
            onPressed: () async {
              AuthService().signOut();
              Navigator.of(context).pushReplacementNamed('/', );
            },
            child: Text(
              "Logout",
              style: textStyleSubjects,
            ),
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class Questions extends StatelessWidget {
  final int Qno;

  Questions(this.Qno);
  @override
  Widget build(BuildContext context) {
    DocumentReference ques = FirebaseFirestore.instance.collection('questions').doc('questions');

    return FutureBuilder<DocumentSnapshot>(
      future: ques.get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data()['questions'];
          return Text("Q: ${data[Qno.toString()]}");
        }

        return Text("loading");
      },
    );
  }
}
