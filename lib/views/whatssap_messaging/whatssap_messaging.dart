import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/controllers/whatsspp_message_controller.dart';
import 'package:attandence_admin_panel/views/whatssap_messaging/send_mark_list.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../profile_view/profile_view.dart';

class WhatsAppMessageView extends StatefulWidget {
  const WhatsAppMessageView({super.key});

  @override
  State<WhatsAppMessageView> createState() => _WhatsAppMessageViewState();
}

class _WhatsAppMessageViewState extends State<WhatsAppMessageView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();

  var parentNameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  var examnameController = TextEditingController();

  var mathsController = TextEditingController();

  var englishController = TextEditingController();
  var tamilController = TextEditingController();

  final whatsappConroller = Get.find<WhatsappMessageController>();



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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: HexColor('#F7E467'),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Image.asset(
                "assets/icons/vmhslogo.png",
                height: 70,
                width: 70,
              ),
            ),
          ),
          leadingWidth: 100,
          centerTitle: true,
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
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.6))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 20, left: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Whatssap Message Management',
                            style: primaryFonts.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () {
                            sendMarkList();
                          },
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primaryColor),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.whatsapp,
                                        color: Colors.white,
                                      ),
                                      w10,
                                      Text(
                                        "Send Mark list",
                                        style: primaryFonts.copyWith(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            // sendMarkList();
                            Get.to(()=> SendMarkListView());
                          },
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primaryColor),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.whatsapp,
                                        color: Colors.white,
                                      ),
                                      w10,
                                      Text(
                                        "Send Exam Mark list",
                                        style: primaryFonts.copyWith(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const RightBar()
        ],
      ),
    );
  }

  sendMarkList() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add Subject",
                    style: primaryFonts.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: examnameController,
                              decoration: InputDecoration(
                                labelText: "Exam Name*",
                                enabledBorder: borderstyle,
                                focusedBorder: borderstyle,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: parentNameController,
                              decoration: InputDecoration(
                                labelText: "Parent Name*",
                                enabledBorder: borderstyle,
                                focusedBorder: borderstyle,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: phoneNumberController,
                              decoration: InputDecoration(
                                labelText: "Phone Number (whatsapp Number)*",
                                prefix: Text("+91"),
                                enabledBorder: borderstyle,
                                focusedBorder: borderstyle,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Marks",
                    style: primaryFonts.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text("Maths : "),
                        w10,
                        Container(
                          height: 50,
                          width: 200,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                    controller: mathsController,
                                    decoration: InputDecoration(
                                      enabledBorder: borderstyle,
                                      focusedBorder: borderstyle,
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text("English :"),
                        w10,
                        Container(
                          height: 50,
                          width: 200,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                    controller: englishController,
                                    decoration: InputDecoration(
                                      enabledBorder: borderstyle,
                                      focusedBorder: borderstyle,
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text("Tamil :  "),
                        w10,
                        Container(
                          height: 50,
                          width: 200,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                    controller: tamilController,
                                    decoration: InputDecoration(
                                      enabledBorder: borderstyle,
                                      focusedBorder: borderstyle,
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        whatsappConroller.isLoading.isTrue
                            ? CircularProgressIndicator()
                            : InkWell(
                                onTap: () {
                                  if (parentNameController.text.isNotEmpty &&
                                      examnameController.text.isNotEmpty &&
                                      mathsController.text.isNotEmpty &&
                                      tamilController.text.isNotEmpty &&
                                      phoneNumberController.text.isNotEmpty &&
                                      englishController.text.isNotEmpty) {
                                    whatsappConroller.sendMarkList(
                                        name: parentNameController.text,
                                        examName: examnameController.text,
                                        maths: mathsController.text,
                                        english: englishController.text,
                                        phone: phoneNumberController.text,
                                        tamil: tamilController.text);
                                  } else {
                                    Get.snackbar("Fill all the fields", "",
                                        colorText: Colors.white,
                                        maxWidth: 400,
                                        backgroundColor: Colors.red);
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primaryColor),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Send Now",
                                    style: primaryFonts.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
