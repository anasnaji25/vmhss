import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/controllers/auth_controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignINView extends StatefulWidget {
  SignINView({Key? key}) : super(key: key);

  @override
  State<SignINView> createState() => _SignINViewState();
}

class _SignINViewState extends State<SignINView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  bool isObscure = true;

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              child: Image(
            image: AssetImage("assets/icons/vmhslogo.png"),
          )),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          suffixIcon: InkWell(
                              onTap: () {
                                emailController.clear();
                              },
                              child: const Icon(CupertinoIcons.xmark_circle)),
                          enabledBorder: borderstyle,
                          focusedBorder: borderstyle),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 330,
                      child: TextField(
                        controller: passwordController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                child: isObscure
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            enabledBorder: borderstyle,
                            focusedBorder: borderstyle),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 330,
                    child: Row(
                      children: [
                        Checkbox(
                            value: rememberMe,
                            activeColor: primaryColor,
                            onChanged: (val) {
                              setState(() {
                                rememberMe = val!;
                              });
                            }),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Remember Password",
                          style: primaryFonts.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Container(
                        width: 330,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 5,
                            ),
                            authController.isLoading.isFalse
                                ? InkWell(
                                    onTap: () {
                                      if (emailController.text.isNotEmpty &&
                                          passwordController.text.isNotEmpty) {
                                        authController.signIn(
                                            context,
                                            emailController.text,
                                            passwordController.text);
                                      } else {
                                        Get.snackbar(
                                            "Please Enter Email and Password to Continue",
                                            "",
                                            maxWidth: 400,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.red);
                                      }
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: primaryColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text("Sign in",
                                            style: primaryFonts.copyWith(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primaryColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        width: 40,
                                        height: 25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  const CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
