import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class NoteDetail extends StatefulWidget {
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {

  static var _priorities = ["High","Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
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
                value: "Low",
                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint('User selected $valueSelectedByUser');
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
    );
  }
}

