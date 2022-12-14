import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/models/section_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionController extends GetxController {
  var sectionSecled;
  var teacherSelected;

  List<String> sectionsList = [];
  var subjectList = [];
  List<String> teachersList = ["Radha", "Sam", "John"];
  List<SectionModel> sectionModelList = [];
  var sectionModel = [];

  addToDb(var subjectList, var teacherlList) async {
    for (var v = 0; v < sectionsList.length; v++) {
      List tsubjectList = [];
      String teacher = "";
      for (var i = 0; i < teacherlList.length; i++) {
        Map teacherMap = teacherlList[i] as Map;
        if (teacherMap.keys.single == sectionsList[v]) {
          teacher = teacherlList[i][sectionsList[v]];
        }
      }

      for (var j = 0; j < subjectList.length; j++) {
        Map subMap = subjectList[j] as Map;
        if (subMap.keys.single == sectionsList[v]) {
          tsubjectList.add(subjectList[j][sectionsList[v]]);
        }
      }

      print(sectionsList[v]);
      print(teacher);
      print(tsubjectList);
      var sectionTempList = sectionsList[v].split(" ");
      SectionModel sectionModel = SectionModel(
          classTeacher: teacher,
          section: sectionTempList.last,
          subject: tsubjectList,
          standerd: sectionTempList.first);

      writeToSection(sectionModel);
    }
  }

  writeToSection(SectionModel sectionModel) async {
    sectionModelList.clear();
    CollectionReference users =
        FirebaseFirestore.instance.collection(sectionCollection);

    users.add(sectionModel.toJson()).then((value) {
      getSections();
      Get.snackbar("Section added successfully", "",
          maxWidth: 400,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }).catchError((error) {
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
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
}
