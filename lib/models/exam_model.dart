import 'package:flutter/material.dart';

class ExamModel {
  String examName;
  DateTime examStartDate;
  DateTime examEndDate;

  ExamModel({
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
  String subjectName;
  DateTime examDate;
  DateTime examStartingTime;
  DateTime examEndingTime;

  ExamSubjectModel(
      {required this.subjectName,
      required this.examDate,
      required this.examEndingTime,
      required this.examStartingTime});

  Map<String, dynamic> toJson() {
    return {
      "subject_name": subjectName,
      "exam_date": examDate,
      "exam_starting_time": examStartingTime,
      "exam_ending_time": examEndingTime,
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
