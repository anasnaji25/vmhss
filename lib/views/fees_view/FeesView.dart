import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/controllers/exam_controller.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/exam_model.dart';
import 'package:attandence_admin_panel/views/fees_view/assign_fee_structure.dart';
import 'package:attandence_admin_panel/views/fees_view/concession_category.dart';
import 'package:attandence_admin_panel/views/fees_view/manage_fee_structure_view.dart';
import 'package:attandence_admin_panel/views/fees_view/miscellaneous_fee.dart';
import 'package:attandence_admin_panel/views/fees_view/student_fee_listing.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';
import '../../constants/decoration.dart';
import '../../constants/helper_widgets.dart';
import '../../widgets/common_widgets/common_app_bar.dart';
import '../../widgets/common_widgets/common_button.dart';

class FeesView extends StatefulWidget {
  const FeesView({super.key});

  @override
  State<FeesView> createState() => _FeesViewState();
}

class _FeesViewState extends State<FeesView> {
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
                                    child: Text('FEES MANAGEMENT',
                                        style: primaryFonts.copyWith(
                                            fontWeight: FontWeight.w700,
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
                              children: [
                                h30,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomButton(
                                        onTap: () {
                                          Get.to(() =>
                                              const ManageFeeStructureView());
                                        },
                                        buttonTitle: "MANAGE FEE STRUCTURE",
                                        buttonColor: HexColor('#f36b5b'),
                                      ),
                                      CustomButton(
                                        onTap: () {
                                          Get.to(() => const AssignFeeView());
                                        },
                                        buttonTitle: "ASSIGN FEE STRUCTURE",
                                        buttonColor: HexColor('#62549a'),
                                      ),
                                      CustomButton(
                                        onTap: () {
                                          Get.to(
                                              () => const StudentFeeListing());
                                        },
                                        buttonTitle: "STUDENT FEE LIST",
                                        buttonColor: HexColor('#f36b5b'),
                                      ),
                                      CustomButton(
                                        onTap: () {
                                          Get.to(
                                              () => const ConcessionCategory());
                                        },
                                        buttonTitle: "CONCESSION CATEGORY",
                                        buttonColor: HexColor('#62549a'),
                                      ),
                                      CustomButton(
                                        onTap: () {},
                                        buttonTitle: "TRANSPORT ROUTE FEE",
                                        buttonColor: HexColor('#f36b5b'),
                                      ),
                                      CustomButton(
                                        onTap: () {
                                          Get.to(
                                              () => const MiscellaneousFee());
                                        },
                                        buttonTitle: "MISCELLANEOUS FEE",
                                        buttonColor: HexColor('#62549a'),
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
