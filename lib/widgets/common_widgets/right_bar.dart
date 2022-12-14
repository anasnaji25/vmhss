import 'package:attandence_admin_panel/views/event_handling/event_handling_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/helper_widgets.dart';
import 'icon_box.dart';

class RightBar extends StatelessWidget {
  const RightBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      color: Colors.white,
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          IconBox(icon: Icons.sms_outlined, text: 'SMS', onPress: () {
             Get.to(()=> EventManagetView());
          }),
          h20,
          IconBox(
              icon: Icons.adf_scanner_outlined,
              text: 'Bona-fide',
              onPress: () {}),
          h20,
          IconBox(
              icon: Icons.home_work_rounded, text: 'Home Work', onPress: () {}),
          h20,
          IconBox(
              icon: Icons.book_outlined, text: 'Achievement', onPress: () {}),
          h20,
          IconBox(
              icon: Icons.event,
              text: 'Events',
              onPress: () {
               
              }),
        ],
      ),
    );
  }
}