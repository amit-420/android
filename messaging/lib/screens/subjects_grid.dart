import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectGrid extends StatelessWidget {
//  SubjectGrid({Key key, this.title}) : super(key: key);
//  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subjects"),
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, 'pert_subj');},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                height: 180,
                width: 170,
                margin: EdgeInsets.all(10),
              ),
            ),
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, 'pert_subj');},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                height: 180,
                width: 170,
                margin: EdgeInsets.all(10),),
            )
          ],
        ),
      ),
    );
  }
}
