import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/controllers/exam_controller.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/staff_management_controller.dart';
import 'package:attandence_admin_panel/models/exam_model.dart';
import 'package:attandence_admin_panel/models/exam_model_test.dart';
import 'package:attandence_admin_panel/models/section_model.dart';
import 'package:attandence_admin_panel/views/exam_view/add_class_exam_view.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_management.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../constants/helper_widgets.dart';
import '../../widgets/common_widgets/common_app_bar.dart';
import '../profile_view/profile_view.dart';

class ExamListView extends StatefulWidget {
  const ExamListView({super.key});

  @override
  State<ExamListView> createState() => _ExamListViewState();
}

class _ExamListViewState extends State<ExamListView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  final examController = Get.find<ExamController>();

  final sectionController = Get.find<SectionController>();

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now(),
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
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date2) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date2 = picked;
        endDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  var sort;
  List<String> sortList = ["Name", "Gender", 'Designation'];

  final examTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    sectionController.getSections();
    examController.geteExams();
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
                      h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Exam",
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.back();
                                  const ExamListView();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 24,
                                )),
                          ],
                        ),
                      ),
                      h30,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Exam Name',
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              height: 50,
                              width: 330,
                              child: TextField(
                                  controller: examTextController,
                                  decoration: InputDecoration(
                                    enabledBorder: borderstyle,
                                    focusedBorder: borderstyle,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Start Date',
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              height: 50,
                              width: 330,
                              child: TextField(
                                  controller: startDateController,
                                  readOnly: true,
                                  onTap: () {
                                    _selectedDate(context);
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.date_range),
                                    enabledBorder: borderstyle,
                                    focusedBorder: borderstyle,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'End Date',
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              height: 50,
                              width: 330,
                              child: TextField(
                                  controller: endDateController,
                                  readOnly: true,
                                  onTap: () {
                                    _selectedDateEnd(context);
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.date_range),
                                    enabledBorder: borderstyle,
                                    focusedBorder: borderstyle,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (examTextController.text.isNotEmpty &&
                                    startDateController.text.isNotEmpty &&
                                    endDateController.text.isNotEmpty) {
                                        ExamModel examModel = ExamModel(
                                      examName: examTextController.text,
                                      examStartDate: _date,
                                      examEndDate: _date2,
                                     );

                                  examController.writeToExamList(examModel);
                                    examController.geteExams();
                                     examController.update();
                                  Get.back();
                                 
                                  // _dialogBuilder2(context);
                                } else {
                                  Get.snackbar("Fill All The Fields", "",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red,
                                      maxWidth: 400);
                                }
                                // const ExamListView();
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('#0F2878')),
                                alignment: Alignment.center,
                                child: const Text(
                                  'ADD',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        h20
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            GetBuilder<ExamController>(builder: (_) {
              return Container(
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        h20,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add Class and Sections",
                                style: primaryFonts.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                    // const ExamListView();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 24,
                                  )),
                            ],
                          ),
                        ),
                        h30,
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButton<SectionModel>(
                                value: examController.classSelected,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                onChanged: (SectionModel? value) {
                                  // This is called when the user selects an item.
                                  examController.classSelected = value;
                                  examController.getSubjects(value!.subject);
                                  examController.update();
                                  // List<SectionModel> sectionModelList
                                },
                                items: sectionController.sectionModelList
                                    .map<DropdownMenuItem<SectionModel>>(
                                        (SectionModel value) {
                                  return DropdownMenuItem<SectionModel>(
                                    value: value,
                                    child: Text(
                                        "${value.standerd} ${value.section}"),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        h20,
                        if (examController.subjectList.isNotEmpty)
                          Text(
                            "Choose Subjects and Exam times",
                            style: primaryFonts.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        h20,
                        for (int i = 0;
                            i < examController.subjectList.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    examController.subjectList[i].subjectName,
                                    style: primaryFonts.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Checkbox(
                                      activeColor: Colors.green,
                                      value: examController
                                          .subjectList[i].isSelected,
                                      onChanged: (val) {
                                        examController
                                            .subjectList[i].isSelected = val!;
                                        examController.update();
                                      })
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                    h20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (examController.classSelected != null) {
                                    SectionModel sectionModel = examController
                                        .classSelected as SectionModel;

                                    List<ExamSubjectModel> examSubjectList = [];

                                    examController.subjectList
                                        .forEach((element) {
                                      if (element.isSelected) {
                                        ExamSubjectModel exModel =
                                            ExamSubjectModel(
                                                examDate: _date,
                                                examEndingTime: DateTime.now(),
                                                examStartingTime:
                                                    DateTime.now(),
                                                subjectName:
                                                    element.subjectName);
                                        examSubjectList.add(exModel);
                                      }
                                    });
                                    // ExamModel examModel = ExamModel(
                                    //     className: sectionModel.standerd,
                                    //     section: sectionModel.section,
                                    //     classId: sectionModel.id,
                                    //     examName: examTextController.text,
                                    //     examStartDate: _date,
                                    //     examEndDate: _date2,
                                    //     examSubjects: examSubjectList);

                                    // examController.writeToExamList(examModel);

                                    Get.back();
                                    const ExamListView();
                                  } else {
                                    Get.snackbar("Fill All The Fields", "",
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red,
                                        maxWidth: 400);
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor('#0F2878')),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'ADD',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          h20
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'EXAMS',
                                    style: primaryFonts.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 55,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .vertical_align_bottom,
                                                      color: Colors.black),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Export",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: () {
                                            _dialogBuilder(context);
                                            // Get.to(
                                            //     () => const StaffManageView());
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: HexColor('#0F2878'),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.7),
                                                      blurRadius: 3)
                                                ]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    "ADD EXAM",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          prefixIcon: const Icon(Icons.search),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.2)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.2))),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black54
                                                    .withOpacity(0.5))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButton<String>(
                                            value: sort,
                                            hint: Text(
                                              "Sort By",
                                              style: primaryFonts.copyWith(
                                                  fontSize: 14),
                                            ),
                                            isExpanded: true,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            elevation: 8,
                                            isDense: true,
                                            style: const TextStyle(
                                                color: Colors.black54),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.

                                              setState(() {
                                                sort = value!;
                                              });
                                            },
                                            items: sortList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            h20,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: tableHeadColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
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
                                        "Exam",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        "From",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        "To",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
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
                            h10,
                            for (int i = 0;
                                i < examController.examList.length;
                                i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Container(
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
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 40,
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
                                              child: Text(
                                                examController
                                                    .examList[i].examName,
                                                style: primaryFonts.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child: Flexible(
                                                child: Text(
                                                  formatDate(
                                                      examController.examList[i]
                                                          .examStartDate,
                                                      [
                                                        "dd",
                                                        "-",
                                                        "mm",
                                                        "-",
                                                        "yyyy"
                                                      ]),
                                                  style: primaryFonts.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child: Flexible(
                                                child: Text(
                                                  formatDate(
                                                      examController.examList[i]
                                                          .examEndDate,
                                                      [
                                                        "dd",
                                                        "-",
                                                        "mm",
                                                        "-",
                                                        "yyyy"
                                                      ]),
                                                  style: primaryFonts.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.green),
                                                      alignment:
                                                          Alignment.center,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                              AddClassExamView());
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'Manage',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )),
                                                  Container(
                                                    height: 20,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.red),
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons.delete,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.blue),
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons.edit,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
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
