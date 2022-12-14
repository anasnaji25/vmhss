import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/controllers/staff_management_controller.dart';
import 'package:attandence_admin_panel/models/staff_model.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../profile_view/profile_view.dart';

class StaffManageView extends StatefulWidget {
  const StaffManageView({super.key});

  @override
  State<StaffManageView> createState() => _StaffManageViewState();
}

class _StaffManageViewState extends State<StaffManageView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();

  var startdateController = TextEditingController();
  var enddateController = TextEditingController();

  var fullNameTextController = TextEditingController();
  var mobileNumberTextController = TextEditingController();
  var addressTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var qualificationTextController = TextEditingController();
  var totalExperienceTextController = TextEditingController();
  var esiTextController = TextEditingController();
  var aadharnumberTextController = TextEditingController();
  var panCardTextController = TextEditingController();

  var gender;
  var designation;

  final staffmanageController = Get.find<StaffManagementController>();

  List<String> genderList = ["Male", "Female"];

  List<String> designationList = [
    "Primary",
    "High School",
    "HR Sec",
    "Special Teacher",
    "Driver",
    "Attender",
    "AAYA",
    "Security",
    "Office Staff"
  ];

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now().subtract(const Duration(days: 10000)),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date = picked;
        startdateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  _selectedDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date2,
        firstDate: DateTime.now().subtract(const Duration(days: 10000)),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date2) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date2 = picked;
        enddateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  Uint8List? imagePath;
  String imageName = "";

  chooseImage() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    setState(() {
      imagePath = bytesFromPicker!;
    });
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
                            'PERSONAl INFORMATION',
                            style: primaryFonts.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Divider(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          child: InkWell(
                            onTap: () {
                              chooseImage();
                            },
                            child: imagePath == null
                                ? Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.memory(imagePath!),
                                  ),
                          ),
                        ),
                        h15,
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    height: 50,
                                    child: TextField(
                                      controller: fullNameTextController,
                                      decoration: InputDecoration(
                                          labelText: "Full Name",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: mobileNumberTextController,
                                      decoration: InputDecoration(
                                          labelText: "Mobile Number",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: DropdownButton<String>(
                                        value: gender,
                                        hint: Text(
                                          "Gender*",
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
                                        ),
                                        isExpanded: true,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        elevation: 0,
                                        itemHeight: 55,
                                        isDense: true,
                                        style: const TextStyle(
                                            color: Colors.black54),
                                        onChanged: (String? value) {
                                          // This is called when the user selects an item.

                                          setState(() {
                                            gender = value!;
                                          });
                                        },
                                        items: genderList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      maxLines: 2,
                                      controller: addressTextController,
                                      decoration: InputDecoration(
                                          labelText: "Address",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        h30,
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: emailTextController,
                                      decoration: InputDecoration(
                                          labelText: "Email*",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    child: TextField(
                                        controller: enddateController,
                                        readOnly: true,
                                        onTap: () {
                                          _selectedDateEnd(context);
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Date of Birth*",
                                          suffixIcon:
                                              const Icon(Icons.date_range),
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Container(
                                height: 50,
                                width: 330,
                                child: TextField(
                                    controller: startdateController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectedDate(context);
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Joining Date*",
                                      suffixIcon: const Icon(Icons.date_range),
                                      enabledBorder: borderstyle,
                                      focusedBorder: borderstyle,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        h30,
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    height: 50,
                                    child: TextField(
                                      controller: qualificationTextController,
                                      decoration: InputDecoration(
                                          labelText: "Qualification",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: totalExperienceTextController,
                                      decoration: InputDecoration(
                                          labelText: "Total Experience",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: DropdownButton<String>(
                                        value: designation,
                                        isExpanded: true,
                                        isDense: true,
                                        hint: Text(
                                          "Designation",
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
                                        ),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        elevation: 0,
                                        style: const TextStyle(
                                            color: Colors.black54),
                                        onChanged: (String? value) {
                                          // This is called when the user selects an item.

                                          setState(() {
                                            designation = value!;
                                          });
                                        },
                                        items: designationList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: esiTextController,
                                      decoration: InputDecoration(
                                          labelText: "ESI",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'DOCUMENTS',
                            style: primaryFonts.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, bottom: 10),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    height: 50,
                                    child: TextField(
                                      controller: aadharnumberTextController,
                                      decoration: InputDecoration(
                                          labelText: "Aadhaar Card Number",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: panCardTextController,
                                      decoration: InputDecoration(
                                          labelText: "PAN Card Number",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () async {
                              // var imageUrl =
                              String url =
                                  await staffmanageController.storeImage(
                                      images: imagePath,
                                      employeename: fullNameTextController.text,
                                      imageName: imageName);

                              StaffModel staffModel = StaffModel(
                                  image: url,
                                  fullName: fullNameTextController.text,
                                  mobileNumber: mobileNumberTextController.text,
                                  gender: gender,
                                  address: addressTextController.text,
                                  email: emailTextController.text,
                                  dob: _date2,
                                  joiningDate: _date,
                                  qualification:
                                      qualificationTextController.text,
                                  totalExperience:
                                      totalExperienceTextController.text,
                                  designation: designation,
                                  esi: esiTextController.text,
                                  aadharCardNumber:
                                      aadharnumberTextController.text,
                                  panCardNumber: panCardTextController.text,
                                  aadharCardImage: "null",
                                  panCardImage: "null");

                              staffmanageController
                                  .writeToStaffmanagement(staffModel);
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: primaryColor),
                              alignment: Alignment.center,
                              child: Text(
                                "Save",
                                style:
                                    primaryFonts.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
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
}
