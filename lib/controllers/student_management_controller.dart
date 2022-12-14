import 'dart:async';

import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/models/student_model.dart';
import 'package:attandence_admin_panel/views/student_management/students_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StudentManagementController extends GetxController {
  List<StudentModel> studentsList = [];

  writeToStudentManagement(StudentModel studentsModel) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(studentsCollection);

    users.add(studentsModel.toJson()).then((value) {
      Get.snackbar("Student added successfully", "",
          maxWidth: 400,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      Get.off(() => const StudentsListView());
    }).catchError((error) {
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  getStudents() async {
    studentsList.clear();
    FirebaseFirestore.instance
        .collection(studentsCollection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        StudentModel studentModel = StudentModel(
          image: doc["image"],
          fullName: doc["full_name"],
          admissionNumber: doc["admission_number"],
          gender: doc["gender"],
          address: doc["address"],
          joiningStandard: doc["joining_standard"],
          dob: (doc["dob"] as Timestamp).toDate(),
          joiningDate: (doc["joining_date"] as Timestamp).toDate(),
          medium: doc["medium"],
          firstLanguage: doc["first_language"],
          nationality: doc["nationality"],
          state: doc["state"],
          religion: doc["religion"],
          caste: doc["caste"],
          community: doc["community"],
          motherTongue: doc["mother_tongue"],
          previousSchool: doc["previous_school"],
          previousStandard: doc["previous_standard"],
          fatherName: doc["father_name"],
          emisCode: doc["EMIS_code"],
          busStop: doc["bus_stop"],
          route: doc["route"],
          transport: doc["transport"],
          guardianAddress: doc["guardian_address"],
          guardianMobileNumber: doc["guardian_mobile_number"],
          guardianName: doc["guardian_name"],
          mobileNumber: doc["mobile_number"],
          monthlyIncome: doc["monthly_income"],
          motherQualification: doc["mother_qualification"],
          fatherQualification: doc["father_qualification"],
          motherOccupation: doc["mother_occupation"],
          fatherOccupation: doc["father_occupation"],
          motherName: doc["mother_name"],
          markSheet: doc['mark_sheet'],
          aadhaarCard: doc['aadhaar_card'],
          transferCertificate: doc['transfer_certificate'],
          birthCertificate: doc['birth_certificate'],
        );
        studentsList.add(studentModel);
      }
      update();
    });
  }

  Future<String> storeImage(
      {required Uint8List? images,
      required String studentName,
      required String imageName}) async {
    print("::::::::::::::1:::::::::::::::::::");
    final storageReference =
        FirebaseStorage.instance.ref().child("Students/$studentName");
    print("::::::::::::::2:::::::::::::::::::");
    await storageReference.putData(images!);
    print("::::::::::::::3:::::::::::::::::::");
    final String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  }

  Future<String> storeFiles(
      {required Uint8List? file,
      required String studentName,
      required String fileName}) async {
    print("::::::::::::::1:::::::::::::::::::");
    final storageReference =
        FirebaseStorage.instance.ref().child("Students/$studentName");
    print("::::::::::::::2:::::::::::::::::::");
    await storageReference.putData(file!);
    print("::::::::::::::3:::::::::::::::::::");
    final String fileUrl = await storageReference.getDownloadURL();
    return fileUrl;
  }
}
