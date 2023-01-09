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

class StudentFeeListing extends StatefulWidget {
  const StudentFeeListing({super.key});

  @override
  State<StudentFeeListing> createState() => _StudentFeeListingState();
}

class _StudentFeeListingState extends State<StudentFeeListing> {
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
                                    const StudentFeeListing();
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
                          const StudentFeeListing();
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
                                    child: Text('STUDENT FEE LISTING',
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
                              children: [
                                h30,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: HexColor('#337ab7'),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Text(
                                                'Due Fee',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.grey
                                                //           .withOpacity(0.7),
                                                //       blurRadius: 1)
                                                // ]
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Text(
                                                  'Paid Fee',
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('#337ab7'),
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      h30,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        HexColor('#337ab7'))),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 55,
                                                      decoration: BoxDecoration(
                                                          color: HexColor(
                                                              '#337ab7'),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                w20,
                                                                Row(
                                                                  children: [
                                                                    const Text(
                                                                      'Select Class:',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    w30,
                                                                    Container(
                                                                      height:
                                                                          40,
                                                                      width:
                                                                          250,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          border:
                                                                              Border.all(color: Colors.black54.withOpacity(0.5))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10,
                                                                            top:
                                                                                7),
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          value:
                                                                              fileName,
                                                                          hint:
                                                                              Text(
                                                                            "Select Class",
                                                                            style:
                                                                                primaryFonts.copyWith(fontSize: 14),
                                                                          ),
                                                                          isExpanded:
                                                                              true,
                                                                          icon:
                                                                              const Icon(Icons.keyboard_arrow_down_outlined),
                                                                          elevation:
                                                                              0,
                                                                          itemHeight:
                                                                              55,
                                                                          isDense:
                                                                              true,
                                                                          style:
                                                                              const TextStyle(color: Colors.black54),
                                                                          onChanged:
                                                                              (String? value) {
                                                                            // This is called when the user selects an item.

                                                                            setState(() {
                                                                              fileName = value;
                                                                            });
                                                                          },
                                                                          items:
                                                                              fileNameList.map<DropdownMenuItem<String>>((value) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: value,
                                                                              child: Text(value),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                w20,
                                                                Row(
                                                                  children: [
                                                                    const Text(
                                                                      'Pay By Date:',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    w30,
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              40,
                                                                          width:
                                                                              150,
                                                                          child: TextField(
                                                                              controller: startDateController,
                                                                              readOnly: true,
                                                                              onTap: () {
                                                                                _selectedDateEnd(context);
                                                                              },
                                                                              decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: Colors.white,
                                                                                // labelText:
                                                                                //     "Start Date",
                                                                                suffixIcon: const Icon(Icons.date_range),
                                                                                enabledBorder: borderstyle,
                                                                                focusedBorder: borderstyle,
                                                                              )),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                w20,
                                                                Row(
                                                                  children: [
                                                                    const Text(
                                                                      'Search',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    w30,
                                                                    Container(
                                                                      height:
                                                                          40,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            structureNameController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                          enabledBorder:
                                                                              borderstyle,
                                                                          focusedBorder:
                                                                              borderstyle,
                                                                          contentPadding: const EdgeInsets.fromLTRB(
                                                                              10.0,
                                                                              10.0,
                                                                              10.0,
                                                                              10.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                w20
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: HexColor(
                                                                '#337ab7'),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(5),
                                                                    color: Colors.green,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                          blurRadius:
                                                                              1)
                                                                    ]),
                                                                child:
                                                                    const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Text(
                                                                    'Send Remainder',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                h10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          HexColor('#337ab7')),
                                                  child: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.0),
                                                          child: Text(
                                                            'Fee Assigned',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: const [
                                                        CommonText(
                                                          text: 'Sl.No',
                                                        ),
                                                        CommonText(
                                                          text: 'Name',
                                                        ),
                                                        CommonText(
                                                          text: 'Class',
                                                        ),
                                                        CommonText(
                                                          text: 'Father Name',
                                                        ),
                                                        CommonText(
                                                          text:
                                                              'Contact Number',
                                                        ),
                                                        CommonText(
                                                          text:
                                                              'Admission Number',
                                                        ),
                                                        CommonText(
                                                          text: 'Net Payable',
                                                        ),
                                                        CommonText(
                                                          text: 'Due',
                                                        ),
                                                        CommonText(
                                                          text: 'Paid',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                h20
                                              ],
                                            ),
                                          ),
                                          h30
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                h30,
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

class CommonText extends StatelessWidget {
  const CommonText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            // border: Border(right: BorderSide(width: 1.0, color: Colors.black))
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 1)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
