class MarkModel {
  String studentId;
  String examID;
  String studentName;
  String section;

  MarkModel(
      {required this.studentId,
      required this.studentName,
      required this.examID,
      required this.section});

  Map<String, dynamic> toJson() {
    return {
      "student_id": studentId,
      "student_name": studentName,
      "exam_id": examID,
      "section": section
    };
  }
}


class MarksSubjectsModel {
  String subjectName;
  int passMark;
  int writtenMark;

  MarksSubjectsModel(
      {required this.subjectName,
      required this.passMark,
      required this.writtenMark});

  Map<String, dynamic> toJson() {
    return {
      "subject_name": subjectName,
      "pass_mark": passMark,
      "written_mark": writtenMark,
    };
  }
}
