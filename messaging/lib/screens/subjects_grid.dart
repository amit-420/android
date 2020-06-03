import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectGrid extends StatelessWidget {
//  SubjectGrid({Key key, this.title}) : super(key: key);
//  final String title;
//List<List<int>> subjects = [
//  [0] = ["Chemistry","black"];
//  ["Electrical","Blue"];
//  ["Maths","pink"];
//  ["CP","yellow"];
//  ["Social-S",'green];
//];
  final List<String> subjects = [
  "Chemistry",
  "Electrical",
  "Maths",
  "CP",
  "Social-S",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SUBJECTS",style: TextStyle(fontSize: 20,letterSpacing: 4,color: Colors.white10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,strutStyle: StrutStyle(height: 5),),
        bottomOpacity: 0.1,
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          children: subjects.map((title){
          return  GestureDetector(
                onTap: (){Navigator.pushNamed(context, 'pert_subj', arguments: {'title':title});},
                child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Text(title,style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.indigoAccent[400],fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                      ],
                           ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                height: 180,
                width: 170,
                margin: EdgeInsets.all(10),
                ),);
                }).toList(),


        ),
      ),
    );
  }
}
