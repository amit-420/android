import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




  Widget tiles(BuildContext context, DocumentSnapshot document) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 25, 15, 5),
     child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        
        children: <Widget>[
          Text(document['region'],
        textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
             fontSize: 30,)
          ),
          Text(document['cases'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[50],
                fontSize: 30,)
          ),
        ],
      ),

    ),
      );
  }

