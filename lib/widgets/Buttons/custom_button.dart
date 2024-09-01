// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget Custom_Button({
  required BuildContext context,
  required onPressed,
  double? horizontal,
  double? vertical,
  double? circular,
  IconData? icon,
  String? title,
  double? size_text,
  double? size_icon,
  Border_Color,
  backgroundColor,
  Color_text,
  Color_icon,
}) {
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circular ?? 8.sp),
        side: BorderSide(color: Border_Color ?? Colors.black, width: 2.8),
      ),
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 1.5.w, vertical: vertical ?? 1.8.h),
      minimumSize: const Size(20, 20),
    ),
    onPressed: onPressed,
    child: icon != null
        ? Icon(icon, color: Color_icon ?? Colors.amber[900], size: size_icon ?? 35.sp)
        : Text(
            title ?? '',
            style: TextStyle(
              color: Color_text ?? Colors.black,
              fontSize: size_text ?? 11.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lemonada',
            ),
          ),
  );
}
