import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/screens/health.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 4;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(context, count) ,
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () => count++,
        child: Icon(Icons.add),

      ),
    );

  }
ListView getNoteListView(context,count) {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
       itemCount: count,
       itemBuilder: (context, count) {
         final item = count;
         return ListTile(
           leading: CircleAvatar(backgroundColor: Colors.yellow,),
           title: Text("hello again!!"),
           subtitle: Text("this is subtitle: $count"),
           trailing: FlatButton.icon( icon: Icon(Icons.delete), label: Text("Delete")),
         );
       }
    );
}
}
