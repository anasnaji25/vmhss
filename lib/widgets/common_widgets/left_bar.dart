import 'package:attandence_admin_panel/views/dash_board_view/home_page_view.dart';
import 'package:attandence_admin_panel/views/sections_view/section_view.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_detsils_list_view.dart';
import 'package:attandence_admin_panel/views/student_management/students_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/helper_widgets.dart';
import 'icon_box.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      color: Colors.white,
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: 30,
          //       width: 55,
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //           color: secondaryColor.withOpacity(0.4),
          //           borderRadius: BorderRadius.circular(30)),
          //       child: Icon(
          //         Icons.menu,
          //         color: primaryColor,
          //         size: 17,
          //       ),
          //     ),
          //   ],
          // ),
          IconBox(
            icon: Icons.dashboard_outlined,
            text: 'Dashboard',
            onPress: () {
              Get.to(() => const HomePageView());
            },
          ),

          h20,
          IconBox(
            icon: Icons.cloud_upload_outlined, text: 'Data Import',
            //   onPress: () {
            //   Get.to(() => const HomePageView());
            // },
            onPress: () {},
          ),

          h20,
          IconBox(
            icon: CupertinoIcons.star, text: 'Privilages',
            //   onPress: () {
            //   Get.to(() => const HomePageView());
            // },
            onPress: () {},
          ),
          h20,
          IconBox(
            icon: Icons.photo_size_select_small_outlined,
            text: 'Section',
            onPress: () {
              Get.to(() => SetionView());
            },
          ),
          h20,
          IconBox(
            icon: Icons.portrait_rounded,
            text: 'Students',
            onPress: () {
              Get.to(() => const StudentsListView());
            },
          ),
          h20,
          IconBox(
            icon: Icons.person_pin,
            text: 'Staffs',
            onPress: () {
              Get.to(() => const StaffListView());
            },
          ),
          h20,
          IconBox(
            icon: Icons.bus_alert_outlined, text: 'Bus',
            //   onPress: () {
            //   Get.to(() => const HomePageView());
            // },
            onPress: () {},
          ),

          h20,
          IconBox(
            icon: Icons.table_chart_outlined, text: 'Attendance',
            //   onPress: () {
            //   Get.to(() => const HomePageView());
            // },
            onPress: () {},
          ),

          h20,
          IconBox(
            icon: Icons.calculate_outlined, text: 'Exam',
            //   onPress: () {
            //   Get.to(() => const HomePageView());
            // },
            onPress: () {},
          ),
          h20,
          IconBox(
            icon: Icons.data_saver_off_sharp, text: 'Marks',
            //   onPress: () {
            //   Get.to(() => const HomePageView());
            // },
            onPress: () {},
          ),

          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
