import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/controllers/data_import_controller.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/models/section_model.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../widgets/common_widgets/common_app_bar.dart';
import '../profile_view/profile_view.dart';

class DataImportView extends StatefulWidget {
  DataImportView({Key? key}) : super(key: key);

  @override
  State<DataImportView> createState() => _DataImportViewState();
}

class _DataImportViewState extends State<DataImportView> {
  final dataimportController = Get.find<DataImportController>();

  final sectionController = Get.find<SectionController>();

  var classSelected;
  String classId = "";
  String className = "";
  String sectionSelected = "";

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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Data Import',
                                        style: primaryFonts.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      h30,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: tableHeadColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  "",
                                                  style: primaryFonts.copyWith(
                                                      color: Colors.black87,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  "",
                                                  style: primaryFonts.copyWith(
                                                      color: Colors.black87,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  "",
                                                  style: primaryFonts.copyWith(
                                                      color: Colors.black87,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      h10,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 1,
                                                  offset: Offset(
                                                      0, 0), // Shadow position
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  child: Text(
                                                    "1",
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                    "Import Staff",
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                    "",
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                                Container(
                                                  width: 300,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          dataimportController
                                                              .importStaffs();
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color:
                                                                    Colors
                                                                        .green),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .file_upload_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Import Data',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          String url = "https://firebasestorage.googleapis.com/v0/b/vmhsschool-88969.appspot.com/o/example%20excel%20files%2Frequest%20response-12.xlsx?alt=media&token=fe55ead1-adcf-45f6-bca8-4518e6f42976";
                                                          dataimportController.downloadFile(url);
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors
                                                                        .lightBlue[
                                                                    800]),
                                                            alignment:
                                                                Alignment.center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .file_download_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Download template',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      h10,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 1,
                                                  offset: Offset(
                                                      0, 0), // Shadow position
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  child: Text(
                                                    "2",
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                    "Import Students",
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                    "",
                                                    style:
                                                        primaryFonts.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ),
                                                Container(
                                                  width: 300,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: (){
                                                           selectSection();
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color:
                                                                    Colors.green),
                                                            alignment:
                                                                Alignment.center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .file_upload_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Import Data',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          String url = "https://firebasestorage.googleapis.com/v0/b/vmhsschool-88969.appspot.com/o/example%20excel%20files%2FStudent-details.xlsx?alt=media&token=b7a187f4-ea0a-4982-bb31-0784436c5554";

                                                          dataimportController.downloadFile(url);
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors
                                                                        .lightBlue[
                                                                    800]),
                                                            alignment:
                                                                Alignment.center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .file_download_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Download template',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
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
                              ])),
                    )));
              }),
            ),
            const RightBar(),
          ],
        ));
  }



  selectSection() {
   
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: 200,
            width: 500,
            child: GetBuilder<SectionController>(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Container(
                                      height: 50,
                                      width: 330,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black54
                                                  .withOpacity(0.5))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: DropdownButton<SectionModel>(
                                          value: sectionController
                                              .sectionSelected,
                                          isExpanded: true,
                                          icon: const Icon(Icons
                                              .keyboard_arrow_down_outlined),
                                          elevation: 0,
                                          itemHeight: 55,
                                          isDense: true,
                                          style: const TextStyle(
                                              color: Colors.black54),
                                          hint: Text(
                                            "Section*",
                                            style: primaryFonts.copyWith(
                                                fontSize: 14),
                                          ),
                                          onChanged: (SectionModel? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              sectionController
                                              .sectionSelected = value!;
                                              className = value.standerd;
                                              classId = value.id;
                                              sectionSelected = value.section;
                                            });

                                            sectionController
                                              .update();
                                            
                                            // List<SectionModel> sectionModelList
                                          },
                                          items: sectionController
                                              .sectionModelList
                                              .map<
                                                      DropdownMenuItem<
                                                          SectionModel>>(
                                                  (SectionModel value) {
                                            return DropdownMenuItem<
                                                SectionModel>(
                                              value: value,
                                              child: Text(
                                                  "${value.standerd} ${value.section}"),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                       
   const SizedBox(
    height: 20,
   ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                         dataimportController.importStudents(classId, className, sectionSelected);
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
