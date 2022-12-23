import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/models/exam_model.dart';
import 'package:attandence_admin_panel/models/exam_model_test.dart';
import 'package:attandence_admin_panel/views/exam_view/exam_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {
  dynamic classSelected;
  List<ExamModel> examList = [];

  List<ExamTempSubjectModel> subjectList = [];

  List<ExamClassModel> examClassist = [];

  writeToExamList(ExamModel examModel) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(examCollections);
    users.add(examModel.toJson()).then((value) {
      Get.snackbar("Exam Addedd successfully", "",
          maxWidth: 400,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      Get.off(() => const ExamListView());
    }).catchError((error) {
      print(error);
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  addExamClassSubjects(
      List<dynamic> subjects, String examDocID, String classDocID) {
    subjects.forEach((element) {
      ExamSubjectModel examSubjectModel = ExamSubjectModel(
          subjectName: element, examDate: DateTime(3000), passMark: 0);

      writeToExamClassSubjets(examSubjectModel, examDocID, classDocID);
    });
  }

  writeToExamClassSubjets(ExamSubjectModel examSubjectModel, String examDocID,
      String classDocID) async {
    CollectionReference users = FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examSubjectsCollections);

    users.add(examSubjectModel.toJson()).then((value) {
      Get.closeAllSnackbars();
      Get.snackbar("Exam Addedd successfully", "",
          maxWidth: 400,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      // Get.off(() => const ExamListView());
    }).catchError((error) {
      print(error);
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  writeToExamClassList(ExamClassModel examClassModel, String docId,
      List<dynamic> subjects) async {
    CollectionReference users = FirebaseFirestore.instance
        .collection(examCollections)
        .doc(docId)
        .collection(examClassCollections);

    users.add(examClassModel.toJson()).then((value) {
      addExamClassSubjects(subjects, docId, value.id);
      // await Future.delayed(Duration(seconds: 1));
      Get.closeAllSnackbars();
      Get.snackbar("Exam Addedd successfully", "",
          maxWidth: 400,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      // Get.off(() => const ExamListView());
    }).catchError((error) {
      print(error);
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });

    geteExamClasses(docId);
  }

  getSubjects(List<dynamic> subjetcts) {
    subjectList.clear();
    subjetcts.forEach((element) {
      ExamTempSubjectModel examTempSubjectModel =
          ExamTempSubjectModel(isSelected: true, subjectName: element);
      subjectList.add(examTempSubjectModel);
    });
    update();
  }

  geteExams() async {
    examList.clear();
    FirebaseFirestore.instance
        .collection(examCollections)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ExamModel examDetails = ExamModel(
          docId: doc.id,
          examName: doc["exam_name"],
          examStartDate: (doc["exam_start_time"] as Timestamp).toDate(),
          examEndDate: (doc["exam_end_date"] as Timestamp).toDate(),
        );
        examList.add(examDetails);
      }
      update();
    });
  }

  geteExamClasses(String docId) async {
    examClassist.clear();
    update();
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(docId)
        .collection(examClassCollections)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ExamClassModel examDetails = ExamClassModel(
          classId: doc["class_id"],
          className: doc["class_name"],
          section: doc["section"],
        );
        examClassist.add(examDetails);
         update();
      }
    });
   
  }
}

//  classId: doc["class_id"],
//           className: doc["class_name"],
//           section: doc["section"],
//           examSubjects: List<ExamSubjectModel>.from(doc["exam_subjects"].map(
//               (x) => ExamSubjectModel(
//                   subjectName: x["subject_name"],
//                   examDate: (x["exam_date"] as Timestamp).toDate(),
//                   examEndingTime: (x["exam_ending_time"] as Timestamp).toDate(),
//                   examStartingTime:
//                       (x["exam_starting_time"] as Timestamp).toDate()))),

class ExamTempSubjectModel {
  String subjectName;
  bool isSelected;
  ExamTempSubjectModel({required this.isSelected, required this.subjectName});
}
