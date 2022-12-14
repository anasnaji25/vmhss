import 'package:attandence_admin_panel/controllers/whatsspp_message_controller.dart';
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
      home: const SplashScreenView(),
      // home: const StudentsListView(),
      // home: const StudentManagementView(),
    );
  }
}