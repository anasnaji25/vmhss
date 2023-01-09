import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/controllers/attendence_controller.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/staff_management_controller.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/section_model.dart';
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
  final attendanceController = Get.find<AttendenceController>();

  String _radioVal = '';
  int? _radioSelected;
  var studentStaff;
  var isLoading = false;
  var staff;
  var section;
  var session;

  int isAllPresent = 3;
  bool isAllabsent = false;

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
  final staffManageController = Get.find<StaffManagementController>();
  @override
  void initState() {
    super.initState();
    studentManageController.getStudents();
    attendanceController.getSections();
    staffManageController.getStaffs();
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
              child: GetBuilder<AttendenceController>(builder: (_) {
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
                                          hintText: const Text('Select'),
                                          listName: studentStaffList,
                                          onChange: (value) {
                                            setState(() {
                                              studentStaff = value;
                                            });
                                          },
                                          textStyle: kDropdownTextStyle,
                                          decoration: kDropdownDecoration),
                                      if (studentStaff == 'Student') ...[
                                        Container(
                                          height: 50,
                                          width: 330,
                                          decoration: kDropdownDecoration,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: DropdownButton<SectionModel>(
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
                                                setState(() {
                                                  section = value;
                                                });
                                              }),
                                              items: attendanceController
                                                  .sectionModelList
                                                  .map<
                                                          DropdownMenuItem<
                                                              SectionModel>>(
                                                      (SectionModel value) {
                                                return DropdownMenuItem<
                                                    SectionModel>(
                                                  value: value,
                                                  child: Text(
                                                      "${value.standerd} ${value.section}"),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ] else if (studentStaff == 'Staff') ...[
                                        DropDownCommon(
                                            width: 330,
                                            value: staff,
                                            hintText:
                                                const Text('Select Staff'),
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
                                          hintText: const Text('Session'),
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
                                  onTap: () {
                                    if (studentStaff == 'Student') {
                                      SectionModel sectionModel =
                                          section as SectionModel;
                                      attendanceController.getAttendenceList(
                                          sectionModel.id, session, 1);
                                    } else {
                                      attendanceController.getAttendenceList(
                                          staff, session, 0);
                                    }
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
                                          width: 400,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Actions -",
                                                style: primaryFonts.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Present All",
                                                style: primaryFonts.copyWith(),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  attendanceController
                                                      .markAllAsPresent();
                                                  setState(() {
                                                    isAllPresent = 0;
                                                  });
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: isAllPresent == 0
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                          )
                                                        : Container(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Text(
                                                "Absent All",
                                                style: primaryFonts.copyWith(),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  attendanceController
                                                      .markAllAsAbsent();
                                                  setState(() {
                                                    isAllPresent = 1;
                                                  });
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: isAllPresent == 1
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                          )
                                                        : Container(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                for (int i = 0;
                                    i <
                                        attendanceController
                                            .attendenceList.length;
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
                                                    attendanceController
                                                        .attendenceList[i].name,
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
                                                      InkWell(
                                                        onTap: () {
                                                          attendanceController
                                                              .attendenceList[i]
                                                              .isPresent = true;
                                                          attendanceController
                                                              .markAttendence(
                                                                  docId: attendanceController
                                                                      .attendenceList[
                                                                          i]
                                                                      .id,
                                                                  isPresent:
                                                                      true);
                                                          setState(() {
                                                            isAllPresent = 3;
                                                          });
                                                          attendanceController
                                                              .update();
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: attendanceController
                                                                    .attendenceList[
                                                                        i]
                                                                    .isPresent
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                  )
                                                                : Container(),
                                                          ),
                                                        ),
                                                      )
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
                                                      InkWell(
                                                        onTap: () {
                                                          attendanceController
                                                              .attendenceList[i]
                                                              .isPresent = false;

                                                          attendanceController
                                                              .markAttendence(
                                                                  docId: attendanceController
                                                                      .attendenceList[
                                                                          i]
                                                                      .id,
                                                                  isPresent:
                                                                      false);
                                                          setState(() {
                                                            isAllPresent = 3;
                                                          });
                                                          attendanceController
                                                              .update();
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: attendanceController
                                                                        .attendenceList[
                                                                            i]
                                                                        .isPresent ==
                                                                    false
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .red,
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                  )
                                                                : Container(),
                                                          ),
                                                        ),
                                                      )
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
