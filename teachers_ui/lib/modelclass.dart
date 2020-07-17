class Student {
  final String uid;
  Student({this.uid});
}

class Teacher {
  final String uid;
  Teacher({this.uid});
}

class StudentData {
  final String name;
  final String rollno;
  StudentData({this.name, this.rollno});
}

class TeachersData {
  final String name;
  final String subjectTeaching;
  List<dynamic> section = [];
  TeachersData({this.name, this.subjectTeaching, this.section});
}

class Link {
  final String displayName;
  final String url;
  Link({this.displayName, this.url});
}

class SectionList {
  final String section;
  final bool;
  SectionList({this.section, this.bool});
}