import 'dart:math';
import 'package:lets_connect/modelclass.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:lets_connect/constants.dart';
import 'package:lets_connect/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_connect/services/database.dart';


class Dashboard extends StatelessWidget {
  final random = Random(4);
  String email = '';
  @override
  Widget build(BuildContext context) {
    int qno = random.nextInt(4) +1;
    final user =  Provider.of<Human>(context);
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Game starts Here... "),

          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Partners email..',labelStyle: textStyleNormal),
                style: textStyleInput,
                validator: (val) => val.isEmpty ? 'Enter the flag' : null,

                onChanged: (val){
                    email = val;

                },
              ),
              RaisedButton(onPressed:(){
                DataServices(email: user.email).addPartnerMail(email);
                Navigator.of(context).pushReplacementNamed('showqns',arguments: {'paremail':email});
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
              Navigator.of(context).pushReplacementNamed('/');
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
