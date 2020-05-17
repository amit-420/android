import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(context, count) ,
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          debugPrint("FAB clicked");
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
             leading: CircleAvatar(backgroundColor: Colors.yellow,
             child: Icon(Icons.keyboard_arrow_right),),
             title: Text("hello again!!"),
             subtitle: Text("this is subtitle: $count"),
             trailing: Icon(Icons.delete),
             onTap: (){
               debugPrint("LIstTile Tapped");
             },
           ),


         );
       }
    );
}
}
