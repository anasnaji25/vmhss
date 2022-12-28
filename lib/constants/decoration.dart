import 'package:flutter/material.dart';

import 'app_styles.dart';

var kTextField = InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    labelText: 'labelText',
    enabledBorder: borderstyle,
    focusedBorder: borderstyle);

var kDropdownDecoration = BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.black54.withOpacity(0.5)));

var kDropdownTextStyle = const TextStyle(color: Colors.black54);
