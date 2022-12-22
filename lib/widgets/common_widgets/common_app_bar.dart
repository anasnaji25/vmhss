import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../views/profile_view/profile_view.dart';

PreferredSize customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/icons/vmhslogo.png",
          height: 70,
          width: 70,
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const ProfileView());
                    },
                    child: Icon(
                      Icons.person,
                      color: HexColor('#5E72C4'),
                      size: 23,
                    ),
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
          ],
        ),
      ],
    ),
  );
}