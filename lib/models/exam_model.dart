import 'package:flutter/material.dart';

class ExamModel {
  String docId;
  String examName;
  DateTime examStartDate;
  DateTime examEndDate;

  ExamModel({
    required this.docId,
    required this.examName,
    required this.examStartDate,
    required this.examEndDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "exam_name": examName,
      "exam_start_time": examStartDate,
      "exam_end_date": examEndDate,
    };
  }
}

class ExamSubjectModel {
  String id;
  String subjectName;
  DateTime examDate;
  int passMark;

  ExamSubjectModel(
      {required this.subjectName,
      required this.examDate,
      required this.id,
      required this.passMark});

  Map<String, dynamic> toJson() {
    return {
      "subject_name": subjectName,
      "exam_date": examDate,
      "pass_mark": passMark,
    };
  }
}

class ExamClassModel {
  String classId;
  String className;
  String section;

  ExamClassModel(
      {required this.classId, required this.className, required this.section});

  Map<String, dynamic> toJson() {
    return {
      "class_id": classId,
      "class_name": className,
      "section": section,
    };
  }
}
