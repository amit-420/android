import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teachersui/constants.dart';
import 'package:teachersui/services/auth.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: appbar_style,
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'ALREADY HAVE AN ACCOUNT',
            icon: Icon(Icons.person),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
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
  String email = '';
  String subject = '';
  List<String> section = [];
  List<String> sectionList = ['R', 'S', 'T', 'U'];
  String password = '';
  String error = '';
  List<bool> checked = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black87),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name', labelStyle: textStyleNormal),
              style: textStyleInput,
              cursorColor: Colors.indigoAccent,
              validator: (val) =>
                  val.length > 6 ? 'name must be less than 6 char long' : null,
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: textStyleNormal,
              ),
              style: textStyleInput,
              validator: (val) => val.length < 6 ? 'Enter valid email' : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Subject teaching', labelStyle: textStyleNormal),
              style: textStyleInput,
              validator: (val) => val.isEmpty ? 'Enter the subject' : null,
              onChanged: (val) {
                setState(() {
                  subject = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: sectionList.length),
                        itemCount: sectionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          for (int i = 0 ; i <= sectionList.length; i++){
                            checked.add(false);
                          }
                              return CheckboxListTile(
                                title: Text(sectionList[index]),
                                value: checked[index],
                                onChanged: (val) {
                                  print(val.toString());
                                 setState(() {
                                   checked[index] = val;
                                   if (checked[index] == true) {
                                     section.add(sectionList[index]);
                                   }else if (checked[index] == false && section.isNotEmpty){
                                     section.removeAt(index);
                                   }
                                 });
                                 for (int i = 0; i < section.length; i++){
                                     debugPrint(section[i]);
                                 }
                                });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password', labelStyle: textStyleNormal),
              style: textStyleInput,
              validator: (val) => val.isEmpty ? 'Enter the flag' : null,
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = await _auth.rWithEAndP(
                      name, email, subject, section, password);
                  if (result == null) {
                    setState(() {
                      error = 'please supply a valid email';
                    });
                  }else{
                    setState(() {
                      error = "YOU have created account successfully";
                    });
                    Navigator.pushReplacementNamed(context, '/');
                  }
                }
              },
              child: Text(
                "Register",
                style: textStyleSubjects,
              ),
              color: Colors.black87,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.redAccent, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
