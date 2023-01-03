import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/controllers/whatsspp_message_controller.dart';
import 'package:attandence_admin_panel/models/exam_model.dart';
import 'package:attandence_admin_panel/models/exam_model_test.dart';
import 'package:attandence_admin_panel/models/marks_model.dart';
import 'package:attandence_admin_panel/models/student_model.dart';
import 'package:attandence_admin_panel/views/exam_view/exam_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExamController extends GetxController {
  dynamic classSelected;
  List<ExamModel> examList = [];

  List<ExamTempSubjectModel> subjectList = [];
  List<ExamSubjectModel> examSubjectList = [];

  List<ExamClassModel> examClassist = [];

  List<MarkModel> markList = [];

  RxBool isLoading = false.obs;

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
          subjectName: element, examDate: DateTime(3000), passMark: 40, id: "");

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

      Get.snackbar("Class Addedd successfully", "",
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

  //write marks for creating the list
  writeToExamMarks(MarkModel markModel, List<ExamSubjectModel> subjectList,
      String examDocID, String classDocID) async {
    print(
        "$examCollections->$examDocID->$examClassCollections->$examMarkCollections");
    CollectionReference users = FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections);

    users.add(markModel.toJson()).then((value) {
      for (var i = 0; i < subjectList.length; i++) {
        MarksSubjectsModel markSubjectModel = MarksSubjectsModel(
            passMark: subjectList[i].passMark,
            subjectName: subjectList[i].subjectName,
            writtenMark: 0);
        writeToMarksSubjects(markSubjectModel, examDocID, classDocID, value.id);
      }
      geteExamMarksList("", subjectList, classDocID, examDocID);
    }).catchError((error) {
      print(error);
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  //write marks for creating the list
  writeToMarksSubjects(MarksSubjectsModel markSubjectModel, String examDocID,
      String classDocID, String examMarkID) async {
    CollectionReference users = FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections)
        .doc(examMarkID)
        .collection(examMarkSunjectCollections);

    users.add(markSubjectModel.toJson()).then((value) {}).catchError((error) {
      print(error);
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  updateStudentsMark(
      {required String subject,
      required int mark,
      required String examDocID,
      required String classDocID,
      required String examMarkID}) async {
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections)
        .doc(examMarkID)
        .collection(examMarkSunjectCollections)
        .where("subject_name", isEqualTo: subject)
        .get()
        .then((QuerySnapshot querySnapshot) {
      FirebaseFirestore.instance
          .collection(examCollections)
          .doc(examDocID)
          .collection(examClassCollections)
          .doc(classDocID)
          .collection(examMarkCollections)
          .doc(examMarkID)
          .collection(examMarkSunjectCollections)
          .doc(querySnapshot.docs.first.id)
          .update({"written_mark": mark});
    });
  }

  Future<String> getmark(
      {required String subject,
      required String examDocID,
      required String classDocID,
      required String examMarkID}) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections)
        .doc(examMarkID)
        .collection(examMarkSunjectCollections)
        .where("subject_name", isEqualTo: subject)
        .get();

    String mark = querySnapshot.docs.first["written_mark"].toString();

    return mark;
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
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(docId)
        .collection(examClassCollections)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ExamClassModel examDetails = ExamClassModel(
          id: doc.id,
          classId: doc["class_id"],
          className: doc["class_name"],
          section: doc["section"],
        );
        examClassist.add(examDetails);
        update();
      }
    });
  }

  geteExamClassSubjects(String examdocId, String classDocId) async {
    examSubjectList.clear();
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examdocId)
        .collection(examClassCollections)
        .doc(classDocId)
        .collection(examSubjectsCollections)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ExamSubjectModel examDetails = ExamSubjectModel(
            examDate: (doc["exam_date"] as Timestamp).toDate(),
            passMark: doc["pass_mark"],
            id: doc.id,
            subjectName: doc["subject_name"]);
        examSubjectList.add(examDetails);
        update();
      }
    });
  }

  updateExamDate(
      {required String examdocId,
      required String classDocId,
      required String subjectDocId,
      required DateTime date}) async {
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examdocId)
        .collection(examClassCollections)
        .doc(classDocId)
        .collection(examSubjectsCollections)
        .doc(subjectDocId)
        .update({'exam_date': date}).then((value) {
      geteExamClassSubjects(examdocId, classDocId);
    }).catchError((error) {
      print("Failed to update user: $error");
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  updatePassMark(
      {required String examdocId,
      required String classDocId,
      required String subjectDocId,
      required String passMark}) async {
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examdocId)
        .collection(examClassCollections)
        .doc(classDocId)
        .collection(examSubjectsCollections)
        .doc(subjectDocId)
        .update({'pass_mark': int.parse(passMark)}).then((value) {
      geteExamClassSubjects(examdocId, classDocId);
    }).catchError((error) {
      print("Failed to update user: $error");
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  generateStudnetsMarkList(String classId, List<ExamSubjectModel> subjectList,
      String classDocID, String examDocID) async {
    print("Class id for student " + classId);
    FirebaseFirestore.instance
        .collection(studentsCollection)
        .where('class_id', isEqualTo: classId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(
          "............query................${querySnapshot.docs.length}.................");
      for (var doc in querySnapshot.docs) {
        MarkModel markModel = MarkModel(
            examID: examDocID,
            section: doc["joined_class"] + " " + doc["section"],
            studentId: doc.id,
            studentName: doc["full_name"]);
        writeToExamMarks(markModel, subjectList, examDocID, classDocID);
      }
      update();
    });
  }

  geteExamMarksList(String classId, List<ExamSubjectModel> subjectList,
      String classDocID, String examDocID) async {
    markList.clear();
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        generateStudnetsMarkList(classId, subjectList, classDocID, examDocID);
      }
      for (var doc in querySnapshot.docs) {
        MarkModel examDetails = MarkModel(
          studentId: doc.id,
          examID: doc["exam_id"],
          studentName: doc["student_name"],
          section: doc["section"],
        );
        markList.add(examDetails);
        update();
      }
    });
  }

  getwhatssapMessage(
      String examName,
      String classId,
      List<ExamSubjectModel> subjectList,
      String classDocID,
      String examDocID) async {
    // markList.clear();
    List<MarkModel> markModelList = [];
    List<MarksSubjectsModel> markSubjectModelList = [];
    String phoneNumber = "";
    String admissionNumber = "";
    String joinedclass = "";
    isLoading(true);
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        MarkModel examDetails = MarkModel(
          studentId: doc.id,
          examID: doc["exam_id"],
          studentName: doc["student_name"],
          section: doc["section"],
        );
        FirebaseFirestore.instance
            .collection(studentsCollection)
            .where('full_name', isEqualTo: examDetails.studentName)
            .get()
            .then((QuerySnapshot bquerySnapshot) {
          for (var bdoc in bquerySnapshot.docs) {
            phoneNumber = bdoc["mobile_number"];
            admissionNumber = bdoc["admission_number"];
            joinedclass = examDetails.section;
          }
        });
        FirebaseFirestore.instance
            .collection(examCollections)
            .doc(examDocID)
            .collection(examClassCollections)
            .doc(classDocID)
            .collection(examMarkCollections)
            .doc(doc.id)
            .collection(examMarkSunjectCollections)
            .get()
            .then((QuerySnapshot secondquerySnapshot) {
          markSubjectModelList.clear();
          for (var doc1 in secondquerySnapshot.docs) {
            print("-------------------${doc1["subject_name"]}---------------");
            print(secondquerySnapshot.docs.length);
            MarksSubjectsModel marksSubjectsModel = MarksSubjectsModel(
                passMark: doc1["pass_mark"],
                subjectName: doc1["subject_name"],
                writtenMark: doc1["written_mark"]);
            markSubjectModelList.add(marksSubjectsModel);

            print(markSubjectModelList);
          }
          update();
          Get.find<WhatsappMessageController>().sendWhatsappAsText(
              name: examDetails.studentName,
              phone: phoneNumber,
              examName: examName,
              mark1: markSubjectModelList.isNotEmpty
                  ? "${markSubjectModelList[0].subjectName} - ${markSubjectModelList[0].writtenMark}"
                  : "-",
              mark2: markSubjectModelList.length > 1
                  ? "${markSubjectModelList[1].subjectName} - ${markSubjectModelList[1].writtenMark}"
                  : "-",
              mark3: markSubjectModelList.length > 3
                  ? "${markSubjectModelList[2].subjectName} - ${markSubjectModelList[2].writtenMark}"
                  : "-",
              mark4: markSubjectModelList.length > 4
                  ? "${markSubjectModelList[3].subjectName} - ${markSubjectModelList[3].writtenMark}"
                  : "-",
              mark5: markSubjectModelList.length > 5
                  ? "${markSubjectModelList[4].subjectName} - ${markSubjectModelList[4].writtenMark}"
                  : "-",
              mark6: markSubjectModelList.length > 6
                  ? "${markSubjectModelList[5].subjectName} - ${markSubjectModelList[5].writtenMark}"
                  : "-");

          generatePdfAndSend(
              name: examDetails.studentName,
              phone: phoneNumber,
              markSubjectModelList: markSubjectModelList,
              admissionNumber: admissionNumber,
              joinedclass: joinedclass,
              examName: examName);
        });
      }
    });
  }


  sendWahtsappText() async{
    
  }

  generatePdfAndSend({
    required String name,
    required String phone,
    required String examName,
    required String admissionNumber,
    required String joinedclass,
    required List<MarksSubjectsModel> markSubjectModelList,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    "Vedhathri Maharishi Hr Sec School".toUpperCase(),
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              pw.Divider(),
              pw.SizedBox(
                height: 20,
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 20, right: 20),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          "Result of: ",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          examName,
                          style: pw.TextStyle(),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Class: ",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          joinedclass,
                          style: pw.TextStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 20, right: 20),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          "Name: ",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          name,
                          style: pw.TextStyle(),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Admission No: ",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          admissionNumber,
                          style: pw.TextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Container(
                color: PdfColors.white,
                padding: pw.EdgeInsets.all(20.0),
                child: pw.Table(
                  border: pw.TableBorder.all(color: PdfColors.black),
                  children: [
                    pw.TableRow(children: [
                      pw.Center(
                          child: pw.Padding(
                        padding: pw.EdgeInsets.all(5.0),
                        child: pw.Text(
                          'Subject',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      )),
                      pw.Center(
                          child: pw.Padding(
                        padding: pw.EdgeInsets.all(5.0),
                        child: pw.Text('Pass Mark',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      )),
                      pw.Center(
                          child: pw.Padding(
                        padding: const pw.EdgeInsets.all(5.0),
                        child: pw.Text('Written Mark',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      )),
                    ]),
                    for (int i = 0; i < markSubjectModelList.length; i++)
                      pw.TableRow(children: [
                        pw.Center(
                            child: pw.Padding(
                          padding: pw.EdgeInsets.all(3.0),
                          child: pw.Text(markSubjectModelList[i].subjectName),
                        )),
                        pw.Center(
                            child: pw.Padding(
                          padding: pw.EdgeInsets.all(3.0),
                          child: pw.Text(
                              markSubjectModelList[i].passMark.toString()),
                        )),
                        pw.Center(
                            child: pw.Padding(
                          padding: pw.EdgeInsets.all(3.0),
                          child: pw.Text(
                              markSubjectModelList[i].writtenMark.toString()),
                        )),
                      ]),
                  ],
                ),
              )
            ],
          ); // Center
        })); // Page

    var bytes = await pdf.save();

    String pdfUrl = await storePdf(
        images: bytes, studentName: "$name${DateTime.now().toIso8601String()}");

    Get.find<WhatsappMessageController>().sendWhatsappAsPDF(
        name: name, phone: phone, examName: examName, url: pdfUrl);
  }

  sendMarkSheet(
      {required String subject,
      required int mark,
      required String examDocID,
      required String classDocID,
      required String examMarkID}) async {
    FirebaseFirestore.instance
        .collection(examCollections)
        .doc(examDocID)
        .collection(examClassCollections)
        .doc(classDocID)
        .collection(examMarkCollections)
        .doc(examMarkID)
        .collection(examMarkSunjectCollections)
        .where("subject_name", isEqualTo: subject)
        .get()
        .then((QuerySnapshot querySnapshot) {
      FirebaseFirestore.instance
          .collection(examCollections)
          .doc(examDocID)
          .collection(examClassCollections)
          .doc(classDocID)
          .collection(examMarkCollections)
          .doc(examMarkID)
          .collection(examMarkSunjectCollections)
          .doc(querySnapshot.docs.first.id)
          .update({"written_mark": mark});
    });
  }

  Future<String> storePdf({
    required Uint8List? images,
    required String studentName,
  }) async {
    print("::::::::::::::::::::1:::::::::::::::::::");
    final storageReference =
        FirebaseStorage.instance.ref().child("Pdf/$studentName.pdf");
    print("::::::::::::::::::::2:::::::::::Pdf/$studentName.pdf::::::::");
    var metadata = SettableMetadata(contentType: "application/pdf");
    await storageReference.putData(images!, metadata);
    print("::::::::::::::::::::3:::::::::::::::::::");
    final String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
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
