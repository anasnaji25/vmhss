import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/staff_management_controller.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_management.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/dropdown_common.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';
import '../../constants/decoration.dart';
import '../../constants/helper_widgets.dart';
import '../../widgets/common_widgets/common_app_bar.dart';
enum radioBtnChoice { Present, Absent }

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  String _radioVal = '';
  int? _radioSelected;
  var studentStaff;
  var isLoading = false;
  var staff;
  var section;
  var session;

  List<String> studentStaffList = ["Student", "Staff"];
  List<String> sessionList = ["FN", "AN"];
  List<String> sectionList = ["LKG A", "LKG B", 'LKG C'];
  List<String> staffList = [
    "Primary",
    "High School",
    "HR Sec",
    "Special Teacher",
    "Driver",
    "Attender",
    "AAYA",
    "Security",
    "Office Staff"
  ];

  final studentManageController = Get.find<StudentManagementController>();
  final sectionManageController = Get.find<SectionController>();
  @override
  void initState() {
    super.initState();
    studentManageController.getStudents();
    sectionManageController.getSections();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var radioValue = radioBtnChoice.Present;
    return Scaffold(
        appBar: customAppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LeftBar(),
            Expanded(
              child: GetBuilder<StudentManagementController>(builder: (_) {
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
                                    child: Text('ATTENDANCE MANAGEMENT',
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
                                      DropDownCommon(
                                          width: 330,
                                          value: studentStaff,
                                          hintText: Text('Select'),
                                          listName: studentStaffList,
                                          onChange: (value) {
                                            setState(() {
                                              studentStaff = value;
                                            });
                                          },
                                          textStyle: kDropdownTextStyle,
                                          decoration: kDropdownDecoration),
                                      if (studentStaff == 'Student') ...[
                                        DropDownCommon(
                                            width: 330,
                                            value: section,
                                            hintText: Text('Class'),
                                            listName: sectionList,
                                            onChange: (value) {
                                              setState(() {
                                                section = value;
                                              });
                                            },
                                            textStyle: kDropdownTextStyle,
                                            decoration: kDropdownDecoration),
                                      ] else if (studentStaff == 'Staff') ...[
                                        DropDownCommon(
                                            width: 330,
                                            value: staff,
                                            hintText: Text('Select Staff'),
                                            listName: staffList,
                                            onChange: (value) {
                                              setState(() {
                                                staff = value;
                                              });
                                            },
                                            textStyle: kDropdownTextStyle,
                                            decoration: kDropdownDecoration),
                                      ],
                                      DropDownCommon(
                                          width: 330,
                                          value: session,
                                          hintText: Text('Session'),
                                          listName: sessionList,
                                          onChange: (value) {
                                            setState(() {
                                              session = value;
                                            });
                                          },
                                          textStyle: kDropdownTextStyle,
                                          decoration: kDropdownDecoration),
                                    ],
                                  ),
                                ),
                                h30,
                                InkWell(
                                  onTap: () {},
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
                                          width: 400,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Actions",
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
                                    i <
                                        studentManageController
                                            .studentsList.length;
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
                                                    studentManageController
                                                        .studentsList[i]
                                                        .fullName,
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
                                              width: 400,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Present',
                                                        style: primaryFonts
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      w20,
                                                      Radio(
                                                          value: 1,
                                                          groupValue:
                                                              _radioSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _radioSelected =
                                                                  value as int?;
                                                              _radioVal =
                                                                  'Present In';
                                                            });
                                                          })
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        'Absent',
                                                        style: primaryFonts
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      w20,
                                                      Radio(
                                                          value: 2,
                                                          groupValue:
                                                              _radioSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _radioSelected =
                                                                  value as int?;
                                                              _radioVal =
                                                                  'Absent';
                                                            });
                                                          })
                                                    ],
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
