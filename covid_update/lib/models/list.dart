import 'package:flutter/material.dart';
import 'package:covidupdate/tiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {

  @override
  Widget build(BuildContext context) {

//   final cov = Provider.of<List<Cov>>(context) ?? [];

    return StreamBuilder(
      stream: Firestore.instance.collection('cov').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Text('Loading...');
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              return tiles(context, snapshot.data.documents[index]);
            },
        );
      }
    );

  }
}
