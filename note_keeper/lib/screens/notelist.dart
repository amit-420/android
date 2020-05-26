import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notekeeper/utils/database_helper.dart';
import 'package:notekeeper/models/note.dart';
import 'dart:async';

class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  Widget build(BuildContext context) {
    if (noteList == null){
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(context, count) ,
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          debugPrint("FAB clicked");
          navigateToDetail(Note('','',2),'Add Note');
        },
        tooltip: "Add Note",
        child: Icon(Icons.add),

      ),
    );

  }
ListView getNoteListView(context,count) {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
       itemCount: count,
       itemBuilder: (BuildContext context, int position) {
         final item = count;
         return Card(
             color: Colors.white,
             elevation: 2.0,
             child: ListTile(
                 leading: CircleAvatar(backgroundColor: getPriorityColor(this.noteList[position].priority),
                   child: getPriorityIcon(this.noteList[position].priority),),
                 title: Text(this.noteList[position].title),
                 subtitle: Text(this.noteList[position].description),
                 trailing: GestureDetector(
                     child: Icon(Icons.delete),
                   onTap: (){
                       _delete(context, noteList[position]);
                   },

                 ),
                 onTap: () {
                   debugPrint("ListTile Tapped");
                   navigateToDetail(this.noteList[position],'Edit Note');
                 }));
            }
       );
  }
  // returns priority colour
  Color getPriorityColor(int priority){
    switch (priority){
      case 1 :
        return Colors.red;
        break;
      case 2 :
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }
  // returns the priority icon
  Icon getPriorityIcon(int priority){
    switch(priority){
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }
  void _delete(BuildContext context, Note note) async{
    int result = await databaseHelper.deleteNote(note.id);
    if(result!=0){
      _showSnackBar(context, 'Note deleted Successfully');
      updateListView();
    }
  }
  void _showSnackBar(BuildContext context,String message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
  void navigateToDetail(Note note, String title) async{
   bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(note, title);
    }));
   if (result == true){
     updateListView();
   }

  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });

  }
}


