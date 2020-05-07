import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[900],
      appBar: AppBar(
        title: Text('Developers Info'),
        backgroundColor: Colors.grey[800],
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 30,),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/pp.jpg'),
              ),
            ),
            SizedBox(height: 20,),
            Text('Amit',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[700],
              ),
              textAlign: TextAlign.center,),
            Text('VNIT, Nagpur',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[700],
              ),
              textAlign: TextAlign.center,),
            SizedBox(height: 40,),
            Text('Disclamer:Though we are trying to keep data up to date, due to dynamic ground situation please reverify for accurency(if requird).'
                'Developer will not be responsible for any kind of loss caused by irresponsible use of info',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
              textAlign: TextAlign.center,),
            Text('A CollegeConnect Product',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[400],
              ),
              textAlign: TextAlign.center,),



          ],
        ),
      ),
    );
  }
}
