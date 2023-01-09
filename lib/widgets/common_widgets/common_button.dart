import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/decoration.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    this.height = 40,
    required this.buttonTitle,
    required this.buttonColor,
    this.width = 185,
  }) : super(key: key);
  final VoidCallback onTap;
  final height;
  final buttonColor;
  final String buttonTitle;
  final width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttonColor,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 3)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            buttonTitle,
            style: kCustomButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
