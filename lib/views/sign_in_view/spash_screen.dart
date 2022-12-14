import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/controllers/auth_controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.checkLoggedInOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset("assets/icons/vmhslogo.png"),
      ),
    );
  }
}
