import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messaging/constants.dart';
import 'package:messaging/modelclass.dart';
import 'package:messaging/services/auth.dart';
import 'package:messaging/services/database.dart';
import 'package:provider/provider.dart';

class SubjectGrid extends StatelessWidget {

  final List<String> subjects = [
  "Chemistry",
  "Electrical",
  "Maths",
  "CP",
  "Social-S",
];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Student>(context);
    return StreamBuilder<StudentData>(
      stream: DataServices(uid: user.uid).studentData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          StudentData studentData = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text('welcome ${studentData.name.toUpperCase()}',style: appbar_text_Style,textAlign: TextAlign.center,strutStyle: StrutStyle(height: 5),),
            bottomOpacity: 0.1,
            backgroundColor: Colors.black87,
            elevation: 0,
            centerTitle: true,
            actions: <Widget>[
              RaisedButton( child: Text('SignOut',style: textStyleNormal,),
                  color: Colors.black87,
                  elevation: 0,

                  onPressed: (){
                AuthService().signOut();
              })
            ],
          ),
          body: Container(
            color: Colors.black87,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              children: subjects.map((subject){
              return  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, 'pert_subj', arguments: {'title':subject});},
                    child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text(subject,style: textStyleSubjects,textAlign: TextAlign.center,)
                          ],
                               ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                    height: 180,
                    width: 170,
                    margin: EdgeInsets.all(10),
                    ),);
                    }).toList(),


            ),
          ),
        );}
        else{
          return Container(
            child: Text("something is wrong"),
          );
        }
      }
    );
  }
}
