// ignore_for_file: non_constant_identifier_names

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

Widget Container_Empty(
    {double? h,
    double? w,
    required Widget child,
    color_border,
    color,
    required double Padding,
    bool border = false,
    double? circular}) {
  return Container(
    height: h,
    width: w,
    padding: EdgeInsets.all(Padding),
    decoration: BoxDecoration(
      color: color ?? const Color.fromARGB(255, 240, 240, 240),
      borderRadius: BorderRadius.all(Radius.circular(circular ?? 10)),
      border: border ? Border.all(color: color_border ?? gryColor) : null,
    ),
    child: Center(
      child: child,
    ),
  );
}
