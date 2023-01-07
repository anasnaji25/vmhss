import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/models/attendence_model.dart';
import 'package:attandence_admin_panel/models/section_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceController extends GetxController {
  List<AttendenceModel> attendenceList = [];
  List<SectionModel> sectionModelList = [];

  writeToAttendenceList(AttendenceModel attendenceModel) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(attendenceCollection);

    users.add(attendenceModel.toJson()).then((value) {}).catchError((error) {
      print(error);
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  getAttendenceList(String classId, String session, int staffOrStudent) async {
    attendenceList.clear();
    FirebaseFirestore.instance
        .collection(attendenceCollection)
        .where('common_id', isEqualTo: classId)
        .where('date',
            isEqualTo: formatDate(DateTime.now(), [dd, "-", mm, "-", yyyy]))
        .get()
        .then((QuerySnapshot querySnapshot) {
      print("__________$classId ___${formatDate(DateTime.now(), [
            dd,
            "-",
            mm,
            "-",
            yyyy
          ])}_____${querySnapshot.docs.length}._________");
      if (querySnapshot.docs.isEmpty) {
        if (staffOrStudent == 1) {
          generateStudnetsAttendance(classId, session);
        }
      }
      for (var doc in querySnapshot.docs) {
        AttendenceModel tAttendenceModel = AttendenceModel(
            id: doc.id,
            docId: doc['doc_id'],
            name: doc['name'],
            sections: doc['sections'],
            commonId: doc["common_id"],
            date: doc['date'],
            isPresent: doc['is_present']);
        attendenceList.add(tAttendenceModel);
        update();
      }
    });
  }

  markAttendence({required String docId, required bool isPresent}) async {
    FirebaseFirestore.instance
        .collection(attendenceCollection)
        .doc(docId)
        .update({'is_present': isPresent})
        .then((value) {})
        .catchError((error) {
          print("Failed to update user: $error");
          Get.snackbar("Something went wrong", "",
              maxWidth: 400,
              colorText: Colors.white,
              backgroundColor: Colors.red);
        });
  }

  getSections() async {
    sectionModelList.clear();
    FirebaseFirestore.instance
        .collection(sectionCollection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        SectionModel sectionModel = SectionModel(
          id: doc.id,
          classTeacher: doc["class_teacher"],
          section: doc["section"],
          standerd: doc["standerd"],
          subject: doc["subject"],
        );
        sectionModelList.add(sectionModel);
      }
      update();
    });
  }

  generateStudnetsAttendance(String classId, String session) async {
    FirebaseFirestore.instance
        .collection(studentsCollection)
        .where('class_id', isEqualTo: classId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(
          "............query................${querySnapshot.docs.length}.................");
      for (var doc in querySnapshot.docs) {
        AttendenceModel attendenceModel = AttendenceModel(
            id: "",
            docId: doc.id,
            commonId: classId,
            name: doc["full_name"],
            sections: session,
            date: formatDate(DateTime.now(), [dd, "-", mm, "-", yyyy]),
            isPresent: true);
        writeToAttendenceList(attendenceModel);
      }
      update();
    });
  }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     


  
}
