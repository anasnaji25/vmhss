import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/controllers/exam_controller.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/exam_model.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';
import '../../constants/decoration.dart';
import '../../constants/helper_widgets.dart';
import '../../widgets/common_widgets/common_app_bar.dart';

class MarkView extends StatefulWidget {
  const MarkView({super.key});

  @override
  State<MarkView> createState() => _MarkViewState();
}

class _MarkViewState extends State<MarkView> {
  var examName;
  var isLoading = false;
  var staff;
  var section;
  var subject;
  String examDocId = "";
  String classDocId = "";
  String subjectDocId = "";

  List<String> studentStaffList = ["Student", "Staff"];
  List<String> sessionList = ["FN", "AN"];
  List<String> sectionList = ["LKG A", "LKG B", 'LKG C'];
  List<String> staffList = ["Primary", "Hr Sec", 'HighSchool'];
  List<String> examList = ["Annual", "Half yearly", 'Quarterly'];

  final studentManageController = Get.find<StudentManagementController>();
  final sectionManageController = Get.find<SectionController>();
  final examManageController = Get.find<ExamController>();
  var markController = TextEditingController();

  @override
  void initState() {
    super.initState();
    examManageController.examClassist.clear();
    examManageController.subjectList.clear();
    examManageController.markList.clear();
    studentManageController.getStudents();
    sectionManageController.getSections();
    examManageController.geteExams();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: customAppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LeftBar(),
            Expanded(
              child: GetBuilder<ExamController>(builder: (_) {
                return Container(
                  decoration: BoxDecoration(color: HexColor('#e3f2fd')),
                  height: size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                h30,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('MARKS MANAGEMENT',
                                        style: primaryFonts.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20)),
                                  ),
                                ),
                                h30,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 330,
                                        decoration: kDropdownDecoration,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: DropdownButton<ExamModel>(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: examName,
                                            hint: Text('Exam'),
                                            underline: null,
                                            isExpanded: true,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            elevation: 12,
                                            itemHeight: 50,
                                            isDense: true,
                                            style: kDropdownTextStyle,
                                            onChanged: ((value) {
                                              examManageController.examClassist.clear(); 
                                              examManageController.markList.clear(); 
                                          examManageController.update();
                                              examManageController
                                                  .geteExamClasses(
                                                      value!.docId);
                                              setState(() {
                                                examDocId = value.docId;
                                                examName = value;
                                              });
                                            }),
                                            items: examManageController.examList
                                                .map<
                                                        DropdownMenuItem<
                                                            ExamModel>>(
                                                    (ExamModel value) {
                                              return DropdownMenuItem<
                                                  ExamModel>(
                                                value: value,
                                                child: Text(value.examName),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      if (examManageController
                                          .examClassist.isNotEmpty)
                                        Container(
                                          height: 50,
                                          width: 330,
                                          decoration: kDropdownDecoration,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child:
                                                DropdownButton<ExamClassModel>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: section,
                                              hint: const Text('Class'),
                                              underline: null,
                                              isExpanded: true,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              elevation: 12,
                                              itemHeight: 50,
                                              isDense: true,
                                              style: kDropdownTextStyle,
                                              onChanged: ((value) {
                                                     examManageController.examSubjectList.clear(); 
                                                     examManageController.markList.clear();
                                                     subject = null;
                                                     examManageController.update();
                                                     examManageController
                                                    .geteExamClassSubjects(
                                                        examDocId,
                                                        value!.id);
                                                setState(() {
                                                  section = value;
                                                });
                                              }),
                                              items: examManageController
                                                  .examClassist
                                                  .map<
                                                          DropdownMenuItem<
                                                              ExamClassModel>>(
                                                      (ExamClassModel value) {
                                                return DropdownMenuItem<
                                                    ExamClassModel>(
                                                  value: value,
                                                  child: Text(
                                                      "${value.className} ${value.section}"),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      // DropDownCommon(
                                      //     width: 330,
                                      //     value: section,
                                      //     hintText: Text('Class'),
                                      //     listName: sectionManageController
                                      //         .sectionsList,
                                      //     onChange: (value) {
                                      //       setState(() {
                                      //         section = value;
                                      //       });
                                      //     },
                                      //     textStyle: kDropdownTextStyle,
                                      //     decoration: kDropdownDecoration),
                                      if (examManageController
                                          .examSubjectList.isNotEmpty)
                                        Container(
                                          height: 50,
                                          width: 330,
                                          decoration: kDropdownDecoration,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: DropdownButton<
                                                ExamSubjectModel>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: subject,
                                              hint: const Text('Subject'),
                                              underline: null,
                                              isExpanded: true,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              elevation: 12,
                                              itemHeight: 50,
                                              isDense: true,
                                              style: kDropdownTextStyle,
                                              onChanged: ((value) {
                                                setState(() {
                                                  subject = value;
                                                });
                                              }),
                                              items: examManageController
                                                  .examSubjectList
                                                  .map<
                                                          DropdownMenuItem<
                                                              ExamSubjectModel>>(
                                                      (ExamSubjectModel value) {
                                                return DropdownMenuItem<ExamSubjectModel>(
                                                  value: value,
                                                  child:
                                                      Text(value.subjectName),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                h30,
                                InkWell(
                                  onTap: () {
                                    examManageController.markList.clear();
                                    examManageController.update();
                                    
                                    ExamClassModel examclassmodel =
                                        section as ExamClassModel;
                                    examManageController.geteExamMarksList(
                                        examclassmodel.classId,
                                        examManageController.examSubjectList,
                                        examclassmodel.id,
                                        examDocId);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: HexColor('#0F2878')),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Next",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                h30
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                h30,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: tableHeadColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 50,
                                          child: Text(
                                            "Sl.No",
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            "Name",
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            "Subject",
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          width: 300,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Marks",
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                for (int i = 0;
                                    i < examManageController.markList.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 1,
                                              offset: Offset(
                                                  0, 1), // Shadow position
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 50,
                                              child: Text(
                                                (i + 1).toString(),
                                                style: primaryFonts.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    examManageController
                                                        .markList[i]
                                                        .studentName,
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    subject.subjectName,
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 300,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  FutureBuilder<String>(
                                                    future: examManageController.getmark(subject: subject.subjectName,examDocID:  examDocId, classDocID: section.id, examMarkID: examManageController
                                                            .markList[i].studentId),
                                                    builder: (context, snapshot) {
                                                      return Container(
                                                        height: 40,
                                                        width: 150,
                                                        child: snapshot.data == "0" ? TextField(
                                                          maxLines: 1,
                                                          onChanged: (value) {
                                                            int mark = int.parse(value);
                                                            ExamClassModel examclassmodel =  section as ExamClassModel;
                                                            examManageController.updateStudentsMark(subject: subject.subjectName, mark: mark, examDocID:  examDocId, classDocID: examclassmodel.id, examMarkID: examManageController
                                                            .markList[i].studentId);
                                                          },
                                                          decoration:InputDecoration(
                                                          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                                          hintText: snapshot.data,
                                                          enabledBorder: borderstyle,
                                                          focusedBorder: borderstyle),
                                                        ) : Text(snapshot.data.toString(),style: primaryFonts.copyWith(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600
                                                        ),),
                                                      );
                                                    }
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                h30
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const RightBar(),
          ],
        ));
  }
}
