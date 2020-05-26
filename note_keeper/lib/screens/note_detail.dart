import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notekeeper/screens/note_detail.dart';
import 'dart:async';

class NoteDetail extends StatefulWidget {

  final String appBarTitle;
  final Note note;
  NoteDetail(this.note, this.appBarTitle);


  @override
  _NoteDetailState createState() => _NoteDetailState(this.note, this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = ["High","Low"];
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    titleController.text = note.title;
    descriptionController.text = note.description;
    return WillPopScope(

      onWillPop: (){moveToLastScreen();},

      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          elevation: 0,
          leading: IconButton(icon: Icon(
            Icons.arrow_back),
          onPressed: (){
            moveToLastScreen();
          },),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0,left:10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem){
                   return DropdownMenuItem<String> (
                     value: dropDownStringItem,
                     child: Text(dropDownStringItem),
                   );
                  }).toList(),
                  value: getPriorityAsString(note.priority),
                  onChanged: (valueSelectedByUser){
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      updatePriorityAsInt(valueSelectedByUser);
                    });
                  },
                ),
              ),
              // Second Element
              Padding(
                padding: 
                EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: null,
                  onChanged: (value) {
                    debugPrint("Something changed in Title Text field");
                    updateTitle();
                  },
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              //Third element
              Padding(
                padding:
                EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  style: null,
                  onChanged: (value) {
                    debugPrint("Something changed in Description Text field");
                    updateDescription();
                  },
                  decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              //Fourth Element
              Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('save',textScaleFactor: 1.5,),
                        onPressed: (){
                          setState(() {
                            debugPrint('save button pressed');
                            _save();
                          });
                        },

                      ),
                    ),
                    Container(width: 5.0,),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('delete',textScaleFactor: 1.5,),
                        onPressed: (){
                          setState(() {
                            debugPrint('delete button pressed');
                            _delete();
                          });
                        },

                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context,true);
  }
  // convert the string priority in the form of integer before saving it to Database
void updatePriorityAsInt(String value){
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
}
// Convert int priority to String to priority and display it to user in Dropdown
String getPriorityAsString(int value) {
    String priority;
  switch( value){
    case 1:
      priority = _priorities[0]; //high
      break;
    case 2:
      priority = _priorities[1];
      break;
  }
  return priority;
}
//Update the title of Note object
void updateTitle(){
    note.title = titleController.text;
}
//Update the description of Note object
void updateDescription(){
    note.description = descriptionController.text;
}
//delete from database
void _delete() async{
    moveToLastScreen();
    if(note.id == null){
      _showAlertDialog('Status', 'NO note was deleted');
      return;
    }
    int result = await helper.deleteNote((note.id));
    if(result != 0){
      _showAlertDialog('Status', 'Note deleted successfully');
    } else  {
      _showAlertDialog('Status', 'Error Ocurred while Deleting note');
    }
  }
// Save data to database
void _save() async {
    moveToLastScreen();

    //note.date = DatePickerDateOrder.ymd().format(DateTime.now());
    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
    } else {
      result = await helper.insertNote(note);
    }
    if (result != 0) {
      _showAlertDialog('Status', 'Note successfully saved');
    } else {
      _showAlertDialog('Status','Problem Saving Notes');
    }
}
void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context,
    builder: (_)=> alertDialog);
}
}

