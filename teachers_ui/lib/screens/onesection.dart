import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OneSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Into The S section",style: TextStyle(fontSize: 20,letterSpacing: 4,color: Colors.white10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
                AbsentStudents(),
          ],
        ),
      ),
    );
  }
}


class AbsentStudents extends StatefulWidget {

  @override
  _AbsentStudentsState createState() => _AbsentStudentsState();
}
final _controller = TextEditingController();
class _AbsentStudentsState extends State<AbsentStudents> {
  List<String> noAbsent = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      constraints: BoxConstraints.tightForFinite(width: double.maxFinite,height: 300),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: noAbsent.length,
                    itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onLongPress: (){removing();},
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              border: Border.all(color:
                              Colors.white10,width: 2,style: BorderStyle.solid)
                            ),
                            height: 25,
                            width: 20,
                            child: Text(noAbsent[index],style: TextStyle(color: Colors.indigo[500],letterSpacing: 2),),
                          ),
                        );

                    }),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(filled: true,
                    fillColor: Colors.white10,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  maxLength: 2,
                  onSubmitted: (context) {
                    debugPrint(context);
                    adding(context);
                    _controller.clear();

                  },
                ),
              ),
              RaisedButton(
                  onPressed: (){debugPrint('$noAbsent');},
                  child: Text('Submit final absent Numbers..'),)
            ],
          ),
        );
  }

  void adding(context){
    setState((){
      noAbsent.add(context);
    });
  }
  void removing(){
    setState((){
      noAbsent.removeLast();
    });
  }
}



