import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/views/profile_view/profile_view.dart';
import 'package:attandence_admin_panel/views/sections_view/section_view.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_detsils_list_view.dart';
import 'package:attandence_admin_panel/views/student_management/student_management_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardView extends StatefulWidget {
  DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          decoration: BoxDecoration(color: secondaryColor.withOpacity(0.3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.menu,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.dashboard_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "DashBoard",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.cloud_upload_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Data Import",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      CupertinoIcons.star,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Privilages",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SetionView());
                },
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.photo_size_select_small_outlined,
                        color: primaryColor,
                        size: 17,
                      ),
                    ),
                    Text(
                      "Section",
                      style: primaryFonts.copyWith(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 4, 63, 110),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const StudentManagementView());
                },
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.portrait_rounded,
                        color: primaryColor,
                        size: 17,
                      ),
                    ),
                    Text(
                      "Student",
                      style: primaryFonts.copyWith(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 4, 63, 110),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const StaffListView());
                },
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.person_pin,
                        color: primaryColor,
                        size: 17,
                      ),
                    ),
                    Text(
                      "Staf",
                      style: primaryFonts.copyWith(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 4, 63, 110),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.bus_alert_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Bus",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.table_chart_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Attandance",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.calculate_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Exam",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.data_saver_off_sharp,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Mark",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "T",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "01",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: size.width * 0.17,
                                            color:
                                                secondaryColor.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: size.width * 0.06,
                                                  color: primaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Total No Of Staffs",
                                        style: primaryFonts.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "T",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "01",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: size.width * 0.17,
                                            color:
                                                secondaryColor.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: size.width * 0.06,
                                                  color: primaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Total No Of Staffs",
                                        style: primaryFonts.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "T",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "01",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: size.width * 0.17,
                                            color:
                                                secondaryColor.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: size.width * 0.06,
                                                  color: primaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Total No Of Staffs",
                                        style: primaryFonts.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "T",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "01",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: size.width * 0.17,
                                            color:
                                                secondaryColor.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: size.width * 0.06,
                                                  color: primaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Total No Of Staffs",
                                        style: primaryFonts.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "T",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "01",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: size.width * 0.17,
                                            color:
                                                secondaryColor.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: size.width * 0.06,
                                                  color: primaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Total No Of Staffs",
                                        style: primaryFonts.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.8),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "T",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "01",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: size.width * 0.17,
                                            color:
                                                secondaryColor.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: size.width * 0.06,
                                                  color: primaryColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Total No Of Staffs",
                                        style: primaryFonts.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 4, 63, 110)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 20),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const ProfileView());
                  },
                  child: Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.yellow.withOpacity(0.5)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blue[300],
                            size: 16,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.settings_outlined,
                            color: Colors.blue[300],
                            size: 16,
                          )
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.sms_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "SMS",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.adf_scanner_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Bonafied",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.home_work_rounded,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Home Work",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.book_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Achivement",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.event,
                      color: primaryColor,
                      size: 17,
                    ),
                  ),
                  Text(
                    "Events",
                    style: primaryFonts.copyWith(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 4, 63, 110),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 280,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
