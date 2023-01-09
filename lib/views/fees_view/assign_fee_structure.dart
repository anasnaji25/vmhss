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

class AssignFeeView extends StatefulWidget {
  const AssignFeeView({super.key});

  @override
  State<AssignFeeView> createState() => _AssignFeeViewState();
}

class _AssignFeeViewState extends State<AssignFeeView> {
  var examName;
  var isLoading = false;
  var staff;
  var section;
  var subject;

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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              width: 500,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      h30,
                      Text(
                        "Add New Fee Type",
                        style: primaryFonts.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                      h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                h20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    h20,
                                    const Text(
                                      'Fee Name',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextFieldCommon(
                                        height: 40,
                                        controller: feeNameController,
                                        labelText: 'Fee Name'),
                                  ],
                                ),
                                h20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'Description',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextFieldCommon(
                                        height: 40,
                                        controller: feeNameController,
                                        labelText: 'Description'),
                                  ],
                                ),
                                h30,
                                CustomButton(
                                  width: 100,
                                  onTap: () {
                                    Get.back();
                                    const AssignFeeView();
                                  },
                                  buttonTitle: 'ADD',
                                  buttonColor: Colors.green,
                                ),
                                h20
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        width: 100,
                        onTap: () {
                          Get.back();
                          const AssignFeeView();
                        },
                        buttonTitle: 'CLOSE',
                        buttonColor: Colors.redAccent,
                      ),
                      CustomButton(
                        width: 100,
                        onTap: () {},
                        buttonTitle: 'SAVE',
                        buttonColor: Colors.green,
                      ),
                    ],
                  ),
                  h10
                ],
              ),
            ),
          ],
        );
      },
    );
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
                                    child: Text('ASSIGN FEE STRUCTURE',
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
                                h20,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 55,
                                        width: 600,
                                        decoration: BoxDecoration(
                                            color: HexColor('#337ab7'),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text(
                                              'Select Structure:',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            w30,
                                            Container(
                                              height: 40,
                                              width: 330,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black54
                                                          .withOpacity(0.5))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 7),
                                                child: DropdownButton<String>(
                                                  value: fileName,
                                                  hint: Text(
                                                    "Select Structure",
                                                    style: primaryFonts
                                                        .copyWith(fontSize: 14),
                                                  ),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: HexColor('#337ab7'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 650,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#337ab7'),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Text(
                                                    'Assign:',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    width: 330,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors
                                                                .black54
                                                                .withOpacity(
                                                                    0.5))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 7),
                                                      child: DropdownButton<
                                                          String>(
                                                        value: fileName,
                                                        hint: Text(
                                                          " Class Wise",
                                                          style: primaryFonts
                                                              .copyWith(
                                                                  fontSize: 14),
                                                        ),
                                                        isExpanded: true,
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down_outlined),
                                                        elevation: 0,
                                                        itemHeight: 55,
                                                        isDense: true,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black54),
                                                        onChanged:
                                                            (String? value) {
                                                          // This is called when the user selects an item.

                                                          setState(() {
                                                            fileName = value;
                                                          });
                                                        },
                                                        items: fileNameList.map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                            (value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  h20,
                                                  Row(
                                                    children: [
                                                      const Text('Selected:'),
                                                      w10,
                                                      Container(
                                                        color:
                                                            HexColor('#337ab7'),
                                                        child: const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.0),
                                                          child: Text(
                                                            '0',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  h10,
                                                  SingleChildScrollView(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black54
                                                                    .withOpacity(
                                                                        0.5))),
                                                        width: 600,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    width: 300,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const Text(
                                                                            'LKG A'),
                                                                        Checkbox(
                                                                            value:
                                                                                false,
                                                                            onChanged:
                                                                                (value) {})
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            h20
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                h40,
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: HexColor('#337ab7'),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(
                                        'SAVE',
                                        style: TextStyle(
                                            fontSize: 16,
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
