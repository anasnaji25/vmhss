import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/models/section_model.dart';
import 'package:attandence_admin_panel/models/staff_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionController extends GetxController {
  var sectionSelected;
  var teacherSelected;

  List<String> sectionsList = [];
  var subjectList = [];
  List<String> teachersList = [];
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

  getTeachersNames() async {
    teachersList.clear();
    FirebaseFirestore.instance
        .collection(staffCollection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print(doc["full_name"]);
        StaffModel staffDetail = StaffModel(
          image: doc["full_name"],
          fullName: doc["full_name"],
          mobileNumber: doc["mobile_number"],
          gender: doc["gender"],
          address: doc["address"],
          email: doc["email"],
          dob: (doc["dob"] as Timestamp).toDate(),
          joiningDate: (doc["joining_date"] as Timestamp).toDate(),
          qualification: doc["qualification"],
          totalExperience: doc["totalExperience"],
          designation: doc["designation"],
          esi: doc["esi"],
          aadharCardNumber: doc["aadhar_card_number"],
          aadharCardImage: doc["aadhar_card_image"],
          panCardImage: doc["pan_card_image"],
          panCardNumber: doc["pan_card_number"],
        );
        teachersList.add(staffDetail.fullName);
      }
      update();
    });
  }
}


//git changes