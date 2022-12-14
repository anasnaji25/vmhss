import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetionView extends StatefulWidget {
  SetionView({Key? key}) : super(key: key);

  @override
  State<SetionView> createState() => _SetionViewState();
}

class _SetionViewState extends State<SetionView> {
  var stdTextEditingController = TextEditingController();
  var sectionTextController = TextEditingController();
  var subjectTextController = TextEditingController();

  final sectionController = Get.find<SectionController>();

  @override
  void initState() {
    super.initState();
    sectionController.getSections();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LeftBar(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: GetBuilder<SectionController>(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            addSection();
                          },
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      blurRadius: 3)
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Add Section")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Sections",
                      style: primaryFonts.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          "Sl.No",
                          style: primaryFonts.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          "Standerd",
                          style: primaryFonts.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          "Section",
                          style: primaryFonts.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          "Class Teacher",
                          style: primaryFonts.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          "Actions",
                          style: primaryFonts.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  for (int i = 0;
                      i < sectionController.sectionModelList.length;
                      i++)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                (i + 1).toString(),
                                style: primaryFonts.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                sectionController.sectionModelList[i].standerd,
                                style: primaryFonts.copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                sectionController.sectionModelList[i].section,
                                style: primaryFonts.copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                sectionController
                                    .sectionModelList[i].classTeacher,
                                style: primaryFonts.copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.delete,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.edit,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        h10,
                      ],
                    ),
                ],
              );
            }),
          ),
        ),
        const RightBar(),
      ],
    ));
  }

  addSection() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 300,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Add Standerd",
                  style: primaryFonts.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                      controller: stdTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Standerd*",
                        enabledBorder: borderstyle,
                        focusedBorder: borderstyle,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "LKG";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "LKG",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "UKG";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "UKG",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "1'st";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "1'st",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "2'nd";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "2'nd",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "3'rd";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "3'rd",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "4'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "4'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "5'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "5'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "6'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "6'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "7'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "7'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "8'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "8'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "9'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "9'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        stdTextEditingController.text = "10'th";
                      },
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "10'th",
                            style: primaryFonts.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                        addSections();
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor),
                        alignment: Alignment.center,
                        child: Text(
                          "Next",
                          style: primaryFonts.copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ));
        });
  }

  //add section
  addSections() {
    sectionController.sectionsList.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 300,
            child: GetBuilder<SectionController>(builder: (_) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add Section",
                    style: primaryFonts.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    child: TextField(
                        controller: stdTextEditingController,
                        decoration: InputDecoration(
                          labelText: "Standerd*",
                          enabledBorder: borderstyle,
                          focusedBorder: borderstyle,
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: sectionTextController,
                              decoration: InputDecoration(
                                labelText: "Sections*",
                                enabledBorder: borderstyle,
                                focusedBorder: borderstyle,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (sectionController.sectionsList.contains(
                                    "${stdTextEditingController.text} ${sectionTextController.text}") ==
                                false) {
                              sectionController.sectionsList.add(
                                  "${stdTextEditingController.text} ${sectionTextController.text}");
                            }
                            sectionController.update();
                            sectionTextController.clear();
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            child: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 23,
                    width: 320,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: sectionController.sectionsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 22,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      sectionController.sectionsList[index],
                                      style:
                                          primaryFonts.copyWith(fontSize: 12),
                                    ),
                                    w10,
                                    InkWell(
                                      onTap: () {
                                        sectionController.sectionsList
                                            .removeAt(index);
                                        sectionController.update();
                                      },
                                      child: const Icon(
                                        CupertinoIcons.xmark,
                                        color: Colors.red,
                                        size: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          sectionTextController.text = "A";
                        },
                        child: Container(
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "A",
                              style: primaryFonts.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          sectionTextController.text = "B";
                        },
                        child: Container(
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "B",
                              style: primaryFonts.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          sectionTextController.text = "C";
                        },
                        child: Container(
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "C",
                              style: primaryFonts.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          sectionTextController.text = "D";
                        },
                        child: Container(
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "D",
                              style: primaryFonts.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();

                          addTeachers(sectionController.sectionsList.first);
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                          alignment: Alignment.center,
                          child: Text(
                            "Next",
                            style: primaryFonts.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }),
          ));
        });
  }

  addTeachers(String section) {
    sectionController.sectionSecled = sectionController.sectionsList.first;
    sectionController.teacherSelected = sectionController.teachersList.first;
    sectionController.update();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 300,
            child: GetBuilder<SectionController>(
              builder: (_) => Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add Teacher for $section",
                    style: primaryFonts.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: DropdownButton<String>(
                      value: sectionController.teacherSelected ?? "",
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.

                        sectionController.teacherSelected = value!;
                        sectionController.update();
                      },
                      items: sectionController.teachersList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();

                          if (sectionController.sectionsList.last == section) {
                            sectionController.sectionModel.add(
                                {section: sectionController.teacherSelected});
                            addSubjects();
                          } else {
                            sectionController.sectionModel.add(
                                {section: sectionController.teacherSelected});

                            final first = sectionController.sectionsList
                                .indexWhere((sect) => sect == section);
                            addTeachers(
                                sectionController.sectionsList[first + 1]);
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
                            "Add",
                            style: primaryFonts.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        });
  }

  addSubjects() {
    sectionController.sectionSecled = sectionController.sectionsList.first;
    sectionController.update();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 300,
            child: GetBuilder<SectionController>(
              builder: (_) => Column(
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
                  Container(
                    height: 50,
                    width: 300,
                    child: DropdownButton<String>(
                      value: sectionController.sectionSecled ?? "",
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.

                        sectionController.sectionSecled = value!;
                        sectionController.update();
                      },
                      items: sectionController.sectionsList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
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
                              controller: subjectTextController,
                              decoration: InputDecoration(
                                labelText: "Subjects*",
                                enabledBorder: borderstyle,
                                focusedBorder: borderstyle,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print(sectionController.subjectList);
                            if (subjectTextController.text.isNotEmpty) {
                              sectionController.subjectList.add({
                                "${sectionController.sectionSecled}":
                                    subjectTextController.text
                              });
                              Get.closeAllSnackbars();
                              Get.snackbar(
                                  "${subjectTextController.text} added to ${sectionController.sectionSecled}",
                                  "",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.BOTTOM,
                                  maxWidth: 300);
                              subjectTextController.clear();
                            }
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            child: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          sectionController.addToDb(
                              sectionController.subjectList,
                              sectionController.sectionModel);
                          Get.back();
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                          alignment: Alignment.center,
                          child: Text(
                            "Add",
                            style: primaryFonts.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        });
  }
}
