import 'package:amitbrewform/screens/home/settings_form.dart';
import 'package:amitbrewform/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:amitbrewform/services/database.dart';
import 'package:provider/provider.dart';
import 'package:amitbrewform/screens/home/brew_list.dart';
import 'package:amitbrewform/models/brew.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[60],
        appBar: AppBar(
          title: Text('BrewCrew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: ()  async{
                  await _auth.signOut();
                  },
                icon: Icon(Icons.person),
                label: Text('Logout')
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Settings'),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            )
          ),
            child: BrewList()),
      ),
    );
  }
}
