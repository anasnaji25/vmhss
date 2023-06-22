import 'package:attandence_admin_panel/controllers/attendence_controller.dart';
import 'package:attandence_admin_panel/controllers/data_import_controller.dart';
import 'package:attandence_admin_panel/controllers/exam_controller.dart';
import 'package:attandence_admin_panel/controllers/whatsspp_message_controller.dart';
import 'package:attandence_admin_panel/views/dash_board_view/home_page_view.dart';
import 'package:attandence_admin_panel/views/fees_view/FeesView.dart';
import 'package:attandence_admin_panel/views/fees_view/assign_fee_structure.dart';
import 'package:attandence_admin_panel/views/fees_view/concession_category.dart';
import 'package:attandence_admin_panel/views/fees_view/manage_fee_structure_view.dart';
import 'package:attandence_admin_panel/views/fees_view/miscellaneous_fee.dart';
import 'package:attandence_admin_panel/views/fees_view/student_fee_listing.dart';
import 'package:attandence_admin_panel/views/sign_in_view/spash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controllers/auth_controller.dart';
import 'controllers/sections_controller.dart';
import 'controllers/staff_management_controller.dart';
import 'controllers/student_management_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController());
  Get.put(SectionController());
  Get.put(StaffManagementController());
  Get.put(StudentManagementController());
  Get.put(WhatsappMessageController());
  Get.put(ExamController());
  Get.put(AttendenceController());
  Get.put(DataImportController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomePageView(),
      // home: const MiscellaneousFee(),
      // home: const StudentManagementView(),
    );
  }
}
