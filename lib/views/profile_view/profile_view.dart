import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();
  var startdateController = TextEditingController();
  var enddateController = TextEditingController();

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
        startdateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
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
        enddateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "Institution Details",
              style: primaryFonts.copyWith(color: Colors.grey, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.6))),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Profile Information',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600),
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
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Institution Name",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "*",
                                          style: primaryFonts.copyWith(
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 330,
                                      height: 50,
                                      child: TextField(
                                        decoration: InputDecoration(
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
                                    Row(
                                      children: [
                                        Text(
                                          "Institution Address",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "*",
                                          style: primaryFonts.copyWith(
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 330,
                                      child: TextField(
                                        maxLines: 2,
                                        decoration: InputDecoration(
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
                            height: 10,
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
                                    Row(
                                      children: [
                                        Text(
                                          "Institution Email",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "*",
                                          style: primaryFonts.copyWith(
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 330,
                                      height: 50,
                                      child: TextField(
                                        decoration: InputDecoration(
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
                                    Row(
                                      children: [
                                        Text(
                                          "Institution Phone",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "*",
                                          style: primaryFonts.copyWith(
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 330,
                                      child: TextField(
                                        decoration: InputDecoration(
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
                              'Academic Year',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Divider(),
                          ),
                          Row(
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
                                        labelText: "Start Date*",
                                        suffixIcon:
                                            const Icon(Icons.date_range),
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle,
                                      )),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  height: 50,
                                  width: 330,
                                  child: TextField(
                                      controller: enddateController,
                                      readOnly: true,
                                      onTap: () {
                                        _selectedDateEnd(context);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "End Date*",
                                        suffixIcon:
                                            const Icon(Icons.date_range),
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Social Links',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Facebook",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 200,
                                      height: 50,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: borderstyle,
                                            focusedBorder: borderstyle),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "YouTube",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 200,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: borderstyle,
                                            focusedBorder: borderstyle),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Twitter",
                                          style: primaryFonts.copyWith(
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 200,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: borderstyle,
                                            focusedBorder: borderstyle),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
