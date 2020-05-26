import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/note.dart';



class DatabaseHelper {

  static DatabaseHelper _databaseHelper; //Singleton DatabaseHelper
  static Database _database;  //Singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper(){
    if (_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance(); //This will be only once singleton object
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  get sqflite => null;
  Future<Database> initializeDatabase() async {
    //get th directory path for both Android an ios to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    
    var noteDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return noteDatabase;
  }
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
    '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }
  //Fetch operation: Get all note objects from database
  Future<List<Map<String,dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }
  //Insert operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }
  //Update operation update a NOte object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(),where: '$colId = ?',whereArgs: [note.id]);
  }
  //Delete Operation:Delete a note object from database
Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
}
//Get number of Note objects in database
Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('Select Count (*) from $noteTable');
    int result = sqflite.firstIntValue(x);
    return result;
}

// get the 'Map list ' [List<Map>] and convert it to 'Note List' [List<Note>]
Future <List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList(); //Get 'Map List' from database
    int count = noteMapList.length;

  List<Note> noteList = List<Note>();
  // for loop to create a 'Notelist' from a 'Map List'
  for (int i = 0; i < count; i++){
    noteList.add(Note.fromMapObject(noteMapList[i]));
  }
  return noteList;
}
}