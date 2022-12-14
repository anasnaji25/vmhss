import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/views/student_management/student_management_view.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/helper_widgets.dart';
import '../profile_view/profile_view.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({super.key});

  @override
  State<StudentsListView> createState() => _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {
  var sort;
  List<String> sortList = ["Name", "Gender", 'Class'];
  final studentManageController = Get.find<StudentManagementController>();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    studentManageController.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/icons/vmhslogo.png",
                height: 70,
                width: 70,
              ),
            ),
            leadingWidth: 100,
            centerTitle: true,
            // title: Row(
            //   children: [
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: secondaryColor.withOpacity(0.3),
            //           borderRadius: BorderRadius.circular(13)),
            //       alignment: Alignment.center,
            //       child: Icon(
            //         Icons.menu,
            //         color: secondaryColor,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       width: 400,
            //       child: TextField(
            //         decoration: InputDecoration(
            //             hintText: "Search",
            //             prefixIcon: const Icon(Icons.search),
            //             enabledBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(13),
            //                 borderSide: const BorderSide(
            //                     color: Colors.black, width: 0.2)),
            //             focusedBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(13),
            //                 borderSide: const BorderSide(
            //                     color: Colors.black, width: 0.2))),
            //       ),
            //     )
            //   ],
            // ),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: HexColor('#0F2878'),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 4), // Shadow position
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.notifications_none,
                      // color: HexColor('#0F2878'),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const ProfileView());
                      },
                      child: Container(
                        height: 36,
                        width: 74,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: HexColor('#F7E467'),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: HexColor('#5E72C4'),
                                size: 23,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.settings_outlined,
                                color: HexColor('#5E72C4'),
                                size: 23,
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 1024,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'STUDENTS',
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
                                          onTap: () {
                                            Get.to(() =>
                                                const StudentManagementView());
                                          },
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20),
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
                                            Get.to(() =>
                                                const StudentManagementView());
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.7),
                                                      blurRadius: 3)
                                                ]),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.add,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "ADD",
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
                              height: 100,
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
                                            underline: null,
                                            isExpanded: true,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            elevation: 8,
                                            itemHeight: 50,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                                      width: 50,
                                      child: Text(
                                        "Sl.No",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    // Container(
                                    //   width: 50,
                                    //   child: Text(
                                    //     "Image",
                                    //     style: primaryFonts.copyWith(
                                    //         color: Colors.black,
                                    //         fontSize: 15,
                                    //         fontWeight: FontWeight.w600),
                                    //   ),
                                    // ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "Name",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      child: Text(
                                        "Class",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        "Phone Number",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        "Father Name",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    // Container(
                                    //   width: 150,
                                    //   child: Text(
                                    //     "Aadhaar Number",
                                    //     style: primaryFonts.copyWith(
                                    //         color: Colors.black87,
                                    //         fontSize: 15,
                                    //         fontWeight: FontWeight.w600),
                                    //   ),
                                    // ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "Actions",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            h10,
                            // const Divider(),
                            for (int i = 0;
                                i < studentManageController.studentsList.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1,
                                          offset:
                                              Offset(0, 1), // Shadow position
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
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
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Image.network(
                                                    studentManageController
                                                        .studentsList[i].image),
                                              ),
                                              Text(
                                                studentManageController
                                                    .studentsList[i].fullName,
                                                style: primaryFonts.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          child: Text(
                                            studentManageController
                                                .studentsList[i]
                                                .joiningStandard,
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            studentManageController
                                                .studentsList[i].mobileNumber,
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            studentManageController
                                                .studentsList[i].fatherName,
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
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
                                                        BorderRadius.circular(
                                                            20),
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
                              ),

                            h20
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
