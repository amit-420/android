import 'package:flutter/material.dart';
import 'package:teachersui/constants.dart';
import 'package:teachersui/modelclass.dart';
import 'package:teachersui/services/auth.dart';
import 'package:teachersui/services/database.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login here',style: appbar_style,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            tooltip: 'DON\'T HAVE ACCOUNT',
            icon: Icon(Icons.person),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'register'),
          )
        ],

      ),
      body: FormField(),
    );
  }
}


class FormField extends StatefulWidget {
  @override
  _FormFieldState createState() => _FormFieldState();
}


class _FormFieldState extends State<FormField> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String name = '';
  String currentSection = '';
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black87
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(labelText:'Email',labelStyle: textStyleNormal,),
              style: textStyleInput,
              validator: (val) => val.length < 6 ? 'Enter valid email' : null,
              onChanged: (val){
                setState(() {
                  email = val;
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
                if (_formKey.currentState.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _auth.signInWithEAndP(email, password);
                  if (result == null){
                    setState(() {
                      error = 'please supply a valid email';
                      loading = false;
                    });
                  }else{
                    error = 'User logged in successfully';
                    Navigator.pushReplacementNamed(context, '/');
                    loading = false;
                  }
                }
              },
              child: Text("Login",style: textStyleSubjects,),
              color: Colors.black87,),
            Text(error,style: TextStyle(color: Colors.redAccent,fontSize: 14.0),),
          ],

        ),
      ),
    );
  }
}
