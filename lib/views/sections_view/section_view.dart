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
import 'package:hexcolor/hexcolor.dart';
import '../../widgets/common_widgets/common_app_bar.dart';
import '../profile_view/profile_view.dart';

class SectionView extends StatefulWidget {
  SectionView({Key? key}) : super(key: key);

  @override
  State<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  var sort;
  List<String> sortList = ["Name", "Gender", 'Class'];
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
        appBar: customAppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LeftBar(),
            Expanded(
              child: GetBuilder<SectionController>(builder: (_) {
                return Container(
                  decoration: BoxDecoration(color: HexColor('#e3f2fd')),
                  height: size.height,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SECTIONS',
                                    style: primaryFonts.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .vertical_align_bottom,
                                                      color: Colors.black),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Export",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: () {
                                            addSection();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: HexColor('#0F2878'),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.7),
                                                      blurRadius: 3)
                                                ]),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Text(
                                                "ADD SECTION",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          prefixIcon: const Icon(Icons.search),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.2)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.2))),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black54
                                                    .withOpacity(0.5))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButton<String>(
                                            value: sort,
                                            hint: Text(
                                              "Sort By",
                                              style: primaryFonts.copyWith(
                                                  fontSize: 14),
                                            ),
                                            underline: null,
                                            isExpanded: true,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            elevation: 8,
                                            itemHeight: 50,
                                            isDense: true,
                                            style: const TextStyle(
                                                color: Colors.black54),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.

                                              setState(() {
                                                sort = value!;
                                              });
                                            },
                                            items: sortList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            h30,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: tableHeadColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: Text(
                                        "Sl.No",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        "Standard",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        "Section",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        "Class Teacher",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 200,
                                      child: Text(
                                        "Actions",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            h10,
                            for (int i = 0;
                                i < sectionController.sectionModelList.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1,
                                          offset:
                                              Offset(0, 0), // Shadow position
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 50,
                                          child: Text(
                                            (i + 1).toString(),
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(
                                            sectionController
                                                .sectionModelList[i].standerd,
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(
                                            sectionController
                                                .sectionModelList[i].section,
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(
                                            sectionController
                                                .sectionModelList[i]
                                                .classTeacher,
                                            style: primaryFonts.copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.green),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Add Students',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                              Container(
                                                height: 20,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.blue),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.edit,
                                                  size: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            h30
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const RightBar(),
          ],
        ));
  }

  addSection() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 500,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Standard",
                            style: primaryFonts.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          InkWell(
                              onTap: () {
                                Get.back();
                                stdTextEditingController.clear();
                                SectionView();
                              },
                              child: const Icon(
                                Icons.close,
                                size: 24,
                              )),
                        ],
                      ),
                      h20,
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                            controller: stdTextEditingController,
                            decoration: InputDecoration(
                              labelText: "Standard*",
                              enabledBorder: borderstyle,
                              focusedBorder: borderstyle,
                            )),
                      ),
                      h30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "LKG";
                            },
                            text: 'LKG',
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "UKG";
                            },
                            text: 'UKG',
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "1'st";
                            },
                            text: "1'st",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "2'nd";
                            },
                            text: "2'nd",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "3'rd";
                            },
                            text: "3'rd",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "4'th";
                            },
                            text: "4'th",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "5'th";
                            },
                            text: "5'th",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "6'th";
                            },
                            text: "6'th",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "7'th";
                            },
                            text: "7'th",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "8'th";
                            },
                            text: "8'th",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "9'th";
                            },
                            text: "9'th",
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "10'th";
                            },
                            text: "10'th",
                          ),
                        ],
                      ),
                      h20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 27,
                          ),
                          CustomClassContainer(
                            text: "11'th",
                            onTap: () {
                              stdTextEditingController.text = "11'th";
                            },
                          ),
                          const SizedBox(
                            width: 57,
                          ),
                          CustomClassContainer(
                            onTap: () {
                              stdTextEditingController.text = "12'th";
                            },
                            text: "12'th",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            // Get.back();
                            // addSections();
                            try {
                              if (stdTextEditingController.text.isNotEmpty) {
                                Get.back();
                                addSections();
                              }
                            } catch (e) {}
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor('#0F2878')),
                          alignment: Alignment.center,
                          child: Text(
                            "Next",
                            style: primaryFonts.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
            height: 500,
            width: 500,
            child: GetBuilder<SectionController>(builder: (_) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                  addSection();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                )),
                            w30,
                            Text(
                              "Add Section",
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: TextField(
                              controller: stdTextEditingController,
                              decoration: InputDecoration(
                                labelText: "Standard*",
                                enabledBorder: borderstyle,
                                focusedBorder: borderstyle,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
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
                                          false &&
                                      sectionTextController.text.isNotEmpty) {
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomClassContainer(
                              text: 'A',
                              onTap: () {
                                sectionTextController.text = "A";
                              },
                            ),
                            CustomClassContainer(
                              text: 'B',
                              onTap: () {
                                sectionTextController.text = "B";
                              },
                            ),
                            CustomClassContainer(
                              text: 'C',
                              onTap: () {
                                sectionTextController.text = "C";
                              },
                            ),
                            CustomClassContainer(
                              text: 'D',
                              onTap: () {
                                sectionTextController.text = "D";
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount:
                                    sectionController.sectionsList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 1,
                                                    spreadRadius: 1,
                                                    offset: Offset(0, 1))
                                              ],
                                              color: HexColor('#7CC57E'),
                                              // border:
                                              //     Border.all(color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  sectionController
                                                      .sectionsList[index],
                                                  style: primaryFonts.copyWith(
                                                      fontSize: 12),
                                                ),
                                                w10,
                                                InkWell(
                                                  onTap: () {
                                                    sectionController
                                                        .sectionsList
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
                                      ),
                                      h10
                                    ],
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (sectionController.sectionsList.isNotEmpty) {
                              Get.back();

                              addTeachers(sectionController.sectionsList.first);
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor('#0F2878')),
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
              );
            }),
          ));
        });
  }

  addTeachers(String section) {
    sectionController.sectionSelected = sectionController.sectionsList.first;
    sectionController.teacherSelected = sectionController.teachersList.first;
    sectionController.update();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 500,
            width: 500,
            child: GetBuilder<SectionController>(
              builder: (_) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                  addSections();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                )),
                            w30,
                            Text(
                              "Add Teacher for $section",
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                        ),
                        h20,
                        Container(
                          height: 50,
                          width: double.infinity,
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
                        h30
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();

                            if (sectionController.sectionsList.last ==
                                section) {
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
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor('#0F2878')),
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
            ),
          ));
        });
  }

  addSubjects() {
    sectionController.sectionSelected = sectionController.sectionsList.first;
    sectionController.update();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 500,
            width: 500,
            child: GetBuilder<SectionController>(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                  addTeachers(
                                      sectionController.sectionsList.first);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                )),
                            w30,
                            Text(
                              "Add Subject",
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                        ),
                        h20,
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: DropdownButton<String>(
                            value: sectionController.sectionSelected ?? "",
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
                              sectionController.sectionSelected = value!;
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
                        h20,
                        Container(
                          height: 50,
                          width: double.infinity,
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
                                      "${sectionController.sectionSelected}":
                                          subjectTextController.text
                                    });
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                        "${subjectTextController.text} added to ${sectionController.sectionSelected}",
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
                          height: 20,
                        ),
                      ],
                    ),
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
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor('#0F2878')),
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

class CustomClassContainer extends StatelessWidget {
  const CustomClassContainer({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 25,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  spreadRadius: 0,
                  offset: Offset(0, 0))
            ],
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: primaryFonts.copyWith(fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class CustomSubjectContainer extends StatelessWidget {
  const CustomSubjectContainer({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  spreadRadius: 0,
                  offset: Offset(0, 0))
            ],
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: primaryFonts.copyWith(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
