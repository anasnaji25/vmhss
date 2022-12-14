class SectionModel {
  String standerd;
  String section;
  String classTeacher;
  List<dynamic> subject;

  SectionModel(
      {required this.standerd,
      required this.classTeacher,
      required this.section,
      required this.subject});

  Map<String, dynamic> toJson() {
    return {
      "standerd": standerd,
      "section": section,
      "class_teacher": classTeacher,
      "subject": subject,
    };
  }


}
