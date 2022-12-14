import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPress;

  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            height: 32,
            width: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: HexColor('#D9D9D9'),
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              icon,
              color: HexColor('#001453'),
              size: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            text,
            style: primaryFonts.copyWith(
                fontSize: 12,
                color: const Color.fromARGB(255, 4, 63, 110),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
