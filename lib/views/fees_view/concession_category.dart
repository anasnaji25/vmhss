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

class ConcessionCategory extends StatefulWidget {
  const ConcessionCategory({super.key});

  @override
  State<ConcessionCategory> createState() => _ConcessionCategoryState();
}

class _ConcessionCategoryState extends State<ConcessionCategory> {
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
                                    child: Text('CONCESSION CATEGORY',
                                        style: primaryFonts.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: HexColor('#f36b5b'),
                                            fontSize: 20)),
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
                                          'Create New Category',
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
                                      Container(
                                        width: 200,
                                        child: Text('Category Name'),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text('Value'),
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text('Percentage'),
                                      ),
                                      Container(
                                        width: 300,
                                        child: Row(
                                          children: [
                                            Text('Selected Students'),
                                            w10,
                                            Container(
                                              color: HexColor('#337ab7'),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                h15,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 200,
                                        child: TextField(
                                          controller: structureNameController,
                                          decoration: InputDecoration(
                                            labelText: 'Category Name',
                                            enabledBorder: borderstyle,
                                            focusedBorder: borderstyle,
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    10.0, 10.0, 10.0, 10.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 200,
                                        child: TextField(
                                          controller: structureNameController,
                                          decoration: InputDecoration(
                                            labelText: 'Value',
                                            enabledBorder: borderstyle,
                                            focusedBorder: borderstyle,
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    10.0, 10.0, 10.0, 10.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Switch(
                                                  // This bool value toggles the switch.
                                                  value: light,
                                                  activeColor: Colors.red,
                                                  onChanged: (bool value) {
                                                    // This is called when the user toggles the switch.
                                                    setState(() {
                                                      light = value;
                                                    });
                                                  }),
                                            ],
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black54
                                                        .withOpacity(0.5))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 7),
                                              child: DropdownButton<String>(
                                                value: fileName,
                                                hint: Text(
                                                  "Select Student",
                                                  style: primaryFonts.copyWith(
                                                      fontSize: 14),
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
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                h40,
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green,
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
