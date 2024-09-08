// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget Custom_Text({required text, double? size, color, fontweight}) {
  return Text(
    text ?? '',
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 10.sp,
      fontWeight: fontweight ?? FontWeight.bold,
      fontFamily: 'Tajawal',
    ),
  );
}
