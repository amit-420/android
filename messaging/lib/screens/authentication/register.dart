import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messaging/constants.dart';
import 'package:messaging/services/auth.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style: appbar_style,),
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'ALREADY HAVE AN ACCOUNT',
            icon: Icon(Icons.person),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
          )
        ],
      ),
      body:FormField(),
    );
  }
}

class FormField extends StatefulWidget {
  @override
  _FormFieldState createState() => _FormFieldState();
}


class _FormFieldState extends State<FormField> {

  final _formKey1 = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String name = '';
  String email = '';
  String subject = '';
  String section = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black87,

      ),
      child: Form(
        key: _formKey1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText:'Name',labelStyle: textStyleNormal),
              style: textStyleInput,
              cursorColor: Colors.indigoAccent,
              validator: (val) =>  val.length > 10 ? 'name must be less than 6 char long' : null,
              onChanged: (val){
                setState(() {
                  name = val;
                });
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(labelText:'Email',labelStyle: textStyleNormal,),
                style: textStyleInput,
              validator: (val) => val.length < 10 ? 'Enter valid email' : null,
              onChanged: (val){
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Rollno',labelStyle: textStyleNormal,hintText: '000'),
              style: textStyleInput,
              maxLength: 3,
              validator: (val) => val.runtimeType == int ? 'Enter valid Three digit rollno:' : null,
              onChanged: (val){
                setState(() {
                  subject = val;
                });
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Section',labelStyle: textStyleNormal),
              style: textStyleInput,
              maxLength: 1,
              validator: (val) => val.isEmpty ? 'Section must be in Camelcase & single char.' : null,
              onChanged: (val){
                setState(() {
                  section = val;
                });
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password',labelStyle: textStyleNormal),
              style: textStyleInput,
              validator: (val) => val.isEmpty ? 'Enter the flag' : null,
              obscureText: true,
              onChanged: (val){
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(height: 20,),
            FlatButton(
                onPressed: () async{
                  if (_formKey1.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.rWithEAndP(name, email, subject, section, password );
                    if (result == null){
                      setState(() {
                        error = 'please supply a valid email';
                        loading = false;
                      });
                    }else{
                      Navigator.pushReplacementNamed(context, 'grid');
                    }
                  }
                },
                child: Text("Register",style: textStyleSubjects,),
                color: Colors.black87,),
            Text(error,style: TextStyle(color: Colors.redAccent,fontSize: 14.0),),
          ],
        ),
      ),
    );
  }
}


