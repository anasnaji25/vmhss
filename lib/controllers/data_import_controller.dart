import 'dart:io';

import 'package:attandence_admin_panel/controllers/staff_management_controller.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/staff_model.dart';
import 'package:attandence_admin_panel/models/student_model.dart';
import 'package:attandence_admin_panel/views/loading_view/file_import_loading_view.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'dart:html' as html;

class DataImportController extends GetxController {
  RxBool isLoading = false.obs;

  readExcel() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );

    isLoading(true);

    /// file might be picked

    if (pickedFile != null) {
      var bytes = pickedFile.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table]!.maxCols);
        print(excel.tables[table]!.maxRows);
        for (var row in excel.tables[table]!.rows) {
          print("$row");
        }
      }
    }

    isLoading(false);
    update();
  }



  void downloadFile(String url) {
   html.AnchorElement anchorElement =   html.AnchorElement(href: url);
   anchorElement.download = url;
   anchorElement.click();
 }




  importStaffs() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    Get.to(()=> FileImportLoadingView());
    try {
      print("...............................1");
     var bytes = pickedFile!.files.single.bytes;
      print("...............................2");

      var decoder = SpreadsheetDecoder.decodeBytes(bytes!);
      print("...............................3");

      var table = decoder.tables['Sheet1'];
      print("...............................4");

      for (var i = 1; i < table!.maxRows; i++) {
        print("...............................5");
        var row = table.rows[i];
        String xFullName = row.elementAt(0);
        String xPhoneNumber = row.elementAt(1).toString();
        String xGender = row.elementAt(2);
        String xAddress = row.elementAt(3);
        String xEmail = row.elementAt(4);
        String xDateOfBirth = row.elementAt(5);
        String xJoiningDate = row.elementAt(6);
        String xQualification = row.elementAt(7);
        String xExperience = row.elementAt(8).toString();
        String xDesignation= row.elementAt(9);
        String xERI = row.elementAt(10);
        String xAadharNumber = row.elementAt(11).toString();
        String xPanCardNumber = row.elementAt(12).toString();
        
          StaffModel staffModel = StaffModel(
                                  image: "https://i.stack.imgur.com/34AD2.jpg",
                                  fullName: xFullName,
                                  mobileNumber: xPhoneNumber,
                                  gender: xGender,
                                  address: xAddress,
                                  email: xEmail,
                                  dob: DateTime(int.parse(xDateOfBirth.split("-")[0]),int.parse(xDateOfBirth.split("-")[1]),int.parse(xDateOfBirth.split("-")[2])),
                                  joiningDate: DateTime(int.parse(xJoiningDate.split("-")[0]),int.parse(xJoiningDate.split("-")[1]),int.parse(xJoiningDate.split("-")[2])),
                                  qualification:
                                      xQualification,
                                  totalExperience:
                                      xExperience,
                                  designation: xDesignation,
                                  esi: xERI,
                                  aadharCardNumber:
                                      xAadharNumber,
                                  panCardNumber: xPanCardNumber,
                                  aadharCardImage: "null",
                                  panCardImage: "null");
        
        Get.find<StaffManagementController>().importToStaffmanagement(staffModel);
        
      }
Get.back();
      Get.snackbar("Staffs Added", "",colorText: Colors.white,backgroundColor: Colors.green,maxWidth: 400);
      
    } catch (e) {
      print(e);
    }
  }



  importStudents(String classId,String joinedClass,String section) async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    Get.to(()=> FileImportLoadingView());
    try {
      print("...............................1");
     var bytes = pickedFile!.files.single.bytes;
      print("...............................2");

      var decoder = SpreadsheetDecoder.decodeBytes(bytes!);
      print("...............................3");

      var table = decoder.tables['Sheet1'];
      print("...............................4");

      for (var i = 1; i < table!.maxRows; i++) {
        print("...............................5");
        var row = table.rows[i];
        String xFullName = row.elementAt(0);
        String xAdmissionNumber = row.elementAt(1).toString();
        String xGender = row.elementAt(2);
        String xAddress = row.elementAt(3);
        String xJoinedStanderd = row.elementAt(4);
        String xDateOfBirth = row.elementAt(5);
        String xJoiningDate = row.elementAt(6);
        String xMedium = row.elementAt(7);
        String xFirstLanguage = row.elementAt(8).toString();
        String xNationality = row.elementAt(9);
        String xstate = row.elementAt(10);
        String xReligion = row.elementAt(11).toString();
        String xCast = row.elementAt(12).toString();
        String xCommunity = row.elementAt(13).toString();
        String xMotherTounge = row.elementAt(14).toString();
        String xFatherName = row.elementAt(15).toString();
        String xMotherName = row.elementAt(16).toString();
        String xFatherOccupation = row.elementAt(17).toString();
        String xMotherOccupation = row.elementAt(18).toString();
        String xFatherQualification = row.elementAt(19).toString();
        String xMotherQualification = row.elementAt(20).toString();
        String xMonthlyIncome = row.elementAt(21).toString();
        String xMobileNumber = row.elementAt(22).toString();
        String xGuardianName = row.elementAt(23).toString();
        String xGaurdianMobileNumber = row.elementAt(24).toString();
        // String xMotherQualification = row.elementAt(25).toString();
        // String xMotherQualification = row.elementAt(26).toString();


        String image = "https://i.stack.imgur.com/34AD2.jpg";

        StudentModel studentModel = StudentModel(image: image, fullName: xFullName, admissionNumber: xAdmissionNumber, gender: xGender, address: xAddress, joiningStandard: xJoinedStanderd, dob: DateTime(int.parse(xDateOfBirth.split("-")[0]),int.parse(xDateOfBirth.split("-")[1]),int.parse(xDateOfBirth.split("-")[2])), joiningDate: DateTime(int.parse(xJoiningDate.split("-")[0]),int.parse(xJoiningDate.split("-")[1]),int.parse(xJoiningDate.split("-")[2])), caste: xCast, community: xCommunity, firstLanguage: xFirstLanguage, medium: xMedium, motherTongue: xMotherTounge, nationality: xNationality, previousSchool: "", previousStandard: "", religion: xReligion, state: xstate, fatherName: xFatherName, emisCode: "", busStop: "", route: "", transport: "", guardianAddress: "", guardianMobileNumber: xGaurdianMobileNumber, guardianName: xGuardianName, mobileNumber: xMobileNumber, monthlyIncome: xMonthlyIncome, motherQualification: xMotherQualification, fatherQualification: xFatherQualification, motherOccupation: xMotherOccupation, fatherOccupation: xFatherOccupation, motherName: xMotherName, markSheet: "", aadhaarCard: "", transferCertificate: "", joinedClass: joinedClass, section: section, classId: classId, birthCertificate: "");
        Get.find<StudentManagementController>().importToStudentManagement(studentModel);
        
      }
      Get.back();
      Get.snackbar("Students Added SuccessFully", "",colorText: Colors.white,backgroundColor: Colors.green,maxWidth: 400);
      
    } catch (e) {
      print(e);
    }
  }
}
