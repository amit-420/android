import 'package:covidupdate/models/list.dart';
import 'package:flutter/material.dart';
import 'package:covidupdate/settings.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Settings(),
        );
      });
    }

    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('COVID-19 Updates'),
        backgroundColor: Colors.grey[800],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.info),
            label: Text('info'),
              )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/covid.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: DataList(),
      )


    );
  }
}
