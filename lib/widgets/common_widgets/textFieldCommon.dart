import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/decoration.dart';

class TextFieldCommon extends StatelessWidget {
  TextFieldCommon({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLine = 1,
    this.width = 330,
    this.height = 55,
  });

  final TextEditingController controller;
  final String labelText;
  final int maxLine;
  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
        maxLines: maxLine,
        controller: controller,
        decoration: kTextField.copyWith(
          // contentPadding: EdgeInsets.all(30),
          labelText: labelText,
        ),
      ),
    );
  }
}
