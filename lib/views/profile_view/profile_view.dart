import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/textFieldCommon.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/common_widgets/common_app_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var instituteNameController = TextEditingController();
  var instituteAddressController = TextEditingController();
  var instituteEmailController = TextEditingController();
  var institutePhoneController = TextEditingController();
  var facebookController = TextEditingController();
  var twitterController = TextEditingController();
  var instagramController = TextEditingController();
  var youtubeController = TextEditingController();

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date = picked;
        startDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  _selectedDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date2,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date2) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date2 = picked;
        endDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        color: HexColor('#e3f2fd'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeftBar(),
            Expanded(
              child: ListView(
                children: [
                  h20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          children: [
                            h20,
                            Text(
                              "INSTITUTION DETAILS",
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            h10,
                            Divider(),
                            h20,
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextFieldCommon(
                                                  controller:
                                                      instituteNameController,
                                                  labelText:
                                                      'Institution Name'),
                                              w30,
                                              TextFieldCommon(
                                                  controller:
                                                      instituteAddressController,
                                                  maxLine: 5,
                                                  labelText:
                                                      'Institution Address'),
                                            ],
                                          ),
                                          h30,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextFieldCommon(
                                                  controller:
                                                      instituteEmailController,
                                                  labelText:
                                                      'Institution Email'),
                                              w30,
                                              TextFieldCommon(
                                                  controller:
                                                      institutePhoneController,
                                                  labelText:
                                                      'Institution Phone'),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            'ACADEMIC YEAR',
                                            style: primaryFonts.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          h10,
                                          Divider(),
                                          h20,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 330,
                                                child: TextField(
                                                    controller:
                                                        startDateController,
                                                    readOnly: true,
                                                    onTap: () {
                                                      _selectedDate(context);
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: "Start Date*",
                                                      suffixIcon: const Icon(
                                                          Icons.date_range),
                                                      enabledBorder:
                                                          borderstyle,
                                                      focusedBorder:
                                                          borderstyle,
                                                    )),
                                              ),
                                              w30,
                                              Container(
                                                height: 50,
                                                width: 330,
                                                child: TextField(
                                                    controller:
                                                        endDateController,
                                                    readOnly: true,
                                                    onTap: () {
                                                      _selectedDateEnd(context);
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: "End Date*",
                                                      suffixIcon: const Icon(
                                                          Icons.date_range),
                                                      enabledBorder:
                                                          borderstyle,
                                                      focusedBorder:
                                                          borderstyle,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            'SOCIAL LINKS',
                                            style: primaryFonts.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          h10,
                                          Divider(),
                                          h20,
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextFieldCommon(
                                                      controller:
                                                          facebookController,
                                                      labelText: 'Facebook'),
                                                  w30,
                                                  TextFieldCommon(
                                                      controller:
                                                          youtubeController,
                                                      labelText: 'Youtube'),
                                                ],
                                              ),
                                              h30,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextFieldCommon(
                                                      controller:
                                                          twitterController,
                                                      labelText: 'Twitter'),
                                                  w30,
                                                  TextFieldCommon(
                                                      controller:
                                                          instagramController,
                                                      labelText: 'Instagram'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          h30
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            RightBar()
          ],
        ),
      ),
    );
  }
}
