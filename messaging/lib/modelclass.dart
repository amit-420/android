class Student{
  final String uid;
  Student({ this.uid });
}

class Teacher{
  final String uid;
  Teacher({this.uid});
}

class StudentData {
  final String name;
  final String rollno;
  final String section;
  final String subject;
  StudentData({this.name,this.rollno,this.section,this.subject});
}

class TeachersData{
  final String name;
  final String subjectTeaching;
  final String section;
  TeachersData({this.name,this.subjectTeaching,this.section});
}

class Link{
  final String displayName;
  final String url;
  Link({this.displayName,this.url});

}