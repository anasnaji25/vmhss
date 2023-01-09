import 'dart:js';

import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/controllers/exam_controller.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/exam_model.dart';
import 'package:attandence_admin_panel/views/student_management/student_management_view.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';
import '../../constants/decoration.dart';
import '../../constants/helper_widgets.dart';
import '../../widgets/common_widgets/common_app_bar.dart';
import '../../widgets/common_widgets/common_button.dart';
import '../../widgets/common_widgets/dropdown_common.dart';
import '../../widgets/common_widgets/textFieldCommon.dart';

class MiscellaneousFee extends StatefulWidget {
  const MiscellaneousFee({super.key});

  @override
  State<MiscellaneousFee> createState() => _MiscellaneousFeeState();
}

class _MiscellaneousFeeState extends State<MiscellaneousFee> {
  var examName;
  var isLoading = false;
  var staff;
  var section;
  var subject;
  bool light = true;
  var fileName;
  List fileNameList = ['abcd', 'dhwuif'];
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
  var feeNameController = TextEditingController();
  var structureNameController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

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

  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now().subtract(const Duration(days: 10000)),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date = picked;
        startDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  _selectedDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date2,
        firstDate: DateTime.now().subtract(const Duration(days: 10000)),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date2) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date2 = picked;
        endDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
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
              child: GetBuilder<SectionController>(builder: (_) {
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
                                    child: Text('MISCELLANEOUS FEE',
                                        style: primaryFonts.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: HexColor('#f36b5b'),
                                            fontSize: 20)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('For Academic Year 2022 - 2023.',
                                            style: primaryFonts.copyWith(
                                                fontWeight: FontWeight.w100,
                                                color: HexColor('#f36b5b'),
                                                fontSize: 12)),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        InkWell(
                                          child: Text('Change?',
                                              style: primaryFonts.copyWith(
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.blueAccent,
                                                  fontSize: 12)),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                h30,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 55,
                                        width: 600,
                                        decoration: BoxDecoration(
                                            color: HexColor('#337ab7'),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Text(
                                          'Create Miscellaneous Fee',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                h20,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Select Fee Type'),
                                          h10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black54
                                                            .withOpacity(0.5))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 7),
                                                  child: DropdownButton<String>(
                                                    value: fileName,
                                                    // hint: Text(
                                                    //   "Select Student",
                                                    //   style: primaryFonts
                                                    //       .copyWith(fontSize: 14),
                                                    // ),
                                                    isExpanded: true,
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down_outlined),
                                                    elevation: 0,
                                                    itemHeight: 55,
                                                    isDense: true,
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                    onChanged: (String? value) {
                                                      // This is called when the user selects an item.

                                                      setState(() {
                                                        fileName = value;
                                                      });
                                                    },
                                                    items: fileNameList.map<
                                                        DropdownMenuItem<
                                                            String>>((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Select Payment Type'),
                                          h10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black54
                                                            .withOpacity(0.5))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 7),
                                                  child: DropdownButton<String>(
                                                    value: fileName,
                                                    // hint: Text(
                                                    //   "Select Student",
                                                    //   style: primaryFonts
                                                    //       .copyWith(fontSize: 14),
                                                    // ),
                                                    isExpanded: true,
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down_outlined),
                                                    elevation: 0,
                                                    itemHeight: 55,
                                                    isDense: true,
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                    onChanged: (String? value) {
                                                      // This is called when the user selects an item.

                                                      setState(() {
                                                        fileName = value;
                                                      });
                                                    },
                                                    items: fileNameList.map<
                                                        DropdownMenuItem<
                                                            String>>((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Start Date',
                                          ),
                                          h10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 150,
                                                child: TextField(
                                                    controller:
                                                        startDateController,
                                                    readOnly: true,
                                                    onTap: () {
                                                      _selectedDateEnd(context);
                                                    },
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      // labelText:
                                                      //     "Due Date",
                                                      suffixIcon: const Icon(
                                                          Icons.date_range),
                                                      enabledBorder:
                                                          borderstyle,
                                                      focusedBorder:
                                                          borderstyle,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'End Date',
                                          ),
                                          h10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 150,
                                                child: TextField(
                                                    controller:
                                                        endDateController,
                                                    readOnly: true,
                                                    onTap: () {
                                                      _selectedDateEnd(context);
                                                    },
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      // labelText:
                                                      //     "Due Date",
                                                      suffixIcon: const Icon(
                                                          Icons.date_range),
                                                      enabledBorder:
                                                          borderstyle,
                                                      focusedBorder:
                                                          borderstyle,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Amount'),
                                          h10,
                                          Container(
                                            height: 40,
                                            width: 150,
                                            child: TextField(
                                              controller:
                                                  structureNameController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                enabledBorder: borderstyle,
                                                focusedBorder: borderstyle,
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 10.0, 10.0, 10.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(),
                                          h10,
                                          InkWell(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.green,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    'Add Students',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                            onTap: () {},
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                h40,
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(
                                        'SAVE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )),
                                h20
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
