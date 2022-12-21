// import 'package:flutter/material.dart';

// class ExamModel {
//   String examName;
//   DateTime examStartDate;
//   DateTime examEndDate;

//   String classId;
//   String className;
//   String section;
//   List<ExamSubjectModel> examSubjects;

//   ExamModel(
//       {required this.examName,
//       required this.examStartDate,
//       required this.examEndDate,
//       required this.classId,
//       required this.className,
//       required this.section,
//       required this.examSubjects});

//   Map<String, dynamic> toJson() {
//     return {
//       "exam_name": examName,
//       "exam_start_time": examStartDate,
//       "exam_end_date": examEndDate,
//       "class_id": classId,
//       "class_name": className,
//       "section": section,
//       "exam_subjects": List<dynamic>.from(examSubjects.map((x) => x.toJson())),
//     };
//   }
// }

// class ExamSubjectModel {
//   String subjectName;
//   DateTime examDate;
//   DateTime examStartingTime;
//   DateTime examEndingTime;

//   ExamSubjectModel(
//       {required this.subjectName,
//       required this.examDate,
//       required this.examEndingTime,
//       required this.examStartingTime});

//   Map<String, dynamic> toJson() {
//     return {
//       "subject_name": subjectName,
//       "exam_date": examDate,
//       "exam_starting_time": examStartingTime,
//       "exam_ending_time": examEndingTime,
//     };
//   }
// }
