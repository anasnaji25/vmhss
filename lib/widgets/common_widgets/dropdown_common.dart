import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownCommon extends StatelessWidget {
  const DropDownCommon({
    Key? key,
    required this.value,
    required this.listName,
    required this.onChange,
    this.hintText,
    this.width = 200,
    this.height = 50,
    required this.textStyle,
    required this.decoration,
  }) : super(key: key);
  final onChange;
  final value;
  final List listName;
  final hintText;
  final width;
  final height;
  final textStyle;
  final decoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height,
          width: width,
          decoration: decoration,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              value: value,
              hint: hintText,
              underline: null,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              elevation: 12,
              itemHeight: 50,
              isDense: true,
              style: textStyle,
              onChanged: onChange,
              items: listName.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
